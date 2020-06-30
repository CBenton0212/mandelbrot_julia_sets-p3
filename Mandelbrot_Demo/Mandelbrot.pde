/*
 * Repetitively call function f for a  given value of C
 * and an initial seed value of 0, where the result is
 * then passed throught the function until a result
 * exceeds a radius of 2 or a bailout limit
 * is reached - representing no escape of radius
 */
int escapes2(Complex c) {
  Complex seed = new Complex(0, 0);
  int loopCount = 0;
  
  while (seed.abs() <= 2 && loopCount < BAILOUT) {
    seed = seed.multiply(seed).add(c);
    loopCount++;
  }

  return loopCount;
}

void drawMandelbrot() {
  img.loadPixels();
  float real, i;
  int iterations;
  
  for (int row = 0; row < HEIGHT; row++) {
    for (int col = MANDELBROT_START; col < MANDELBROT_END; col++) {
      real = map(col, MANDELBROT_START, MANDELBROT_END, -2, 2);
      i = map(row, 0, HEIGHT, 2, -2);
      iterations = escapes2(new Complex(real, i));

      img.pixels[row * WIDTH + col] = (iterations <= BAILOUT) ?
        lerpColor(ESCAPE_FROM, ESCAPE_TO, float(iterations) / BAILOUT) : NO_ESCAPE;
    }
  }
  img.updatePixels();
}
