
Complex C = new Complex(-0.7485714, -0.06857133);
int BAILOUT = 50;

/*
 * Function for Julia set
 * f(x) = x^2 + C
 */
Complex f(Complex x) {
  return x.multiply(x).add(C);
}

/*
 * Repetitively call function f for a given seed,
 * where the result is then passed throught the function
 * until a result exceeds a radius of 2 or a bailout limit
 * is reached - representing no escape of radius
 */
int escapes(Complex seed) {
  int loopCount = 0;
  while (seed.abs() <= 2 && loopCount < BAILOUT) {
    seed = f(seed);
    loopCount++;
  }

  return loopCount;
}

void drawJulia() {
  img.loadPixels();
  for (int row = 0; row < HEIGHT; row++) {
    for (int col = JULIA_START; col < JULIA_END; col++) {

      float real = map(col, JULIA_START, JULIA_END, -2, 2);
      float i = map(row, 0, HEIGHT, 2, -2);
      int iterations = escapes(new Complex(real, i));

      img.pixels[row * WIDTH + col] = (iterations <= BAILOUT) ?
        lerpColor(ESCAPE_FROM, ESCAPE_TO, float(iterations) / BAILOUT) : NO_ESCAPE;
    }
  }
  img.updatePixels();
}


/*
 * Draw thge orbit of a given complex value, determined
 * by the mouse position, in the context of the standing
 * Julia set.
 */
void orbit() {
  noFill();
  stroke(250, 120, 0);
  strokeWeight(5);
  int radius = 15;
  float cr = (mouseX < JULIA_START) ? 
    map(mouseX, MANDELBROT_START, MANDELBROT_END, -2, 2) :
    map(mouseX, JULIA_START, JULIA_END, -2, 2);
  float ci = map(mouseY, 0, HEIGHT, 2, -2);
  Complex origin = new Complex(cr, ci);
  int iterations = 0;

  float mx = (mouseX < JULIA_START) ? mouseX : mouseX - JULIA_START;
  point(mx, mouseY);

  strokeWeight(1);
  while (origin.a >= -2 && origin.a <= 2 && origin.b >= -2 && origin.b <= 2 && iterations < BAILOUT) {
    Complex dest = f(origin);
    float x1 = (int) map(origin.a, -2, 2, JULIA_START, JULIA_END);
    float y1 = (int) map(origin.b, 2, -2, 0, HEIGHT);
    float x2 = (int) map(dest.a, -2, 2, JULIA_START, JULIA_END);
    float y2 = map(dest.b, 2, -2, 0, HEIGHT);
    ellipse(x1, y1, radius, radius);

    if (x2 < JULIA_START) {
      y2 = ((y1 - y2) / (x1 - x2)) * x2 + y1;
      x2 = JULIA_START;
    } else {
      ellipse(x2, y2, radius, radius);
    }

    line(x1, y1, x2, y2);
    origin = dest;
    iterations++;
  }
}
