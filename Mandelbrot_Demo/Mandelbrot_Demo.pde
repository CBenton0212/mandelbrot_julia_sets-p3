/*
 * Chris Benton
 * 
 * Display the Mandelbrot set side by side with a Julia set
 * where the value of C can be changed based on the position of the mouse.
 * 
 * The C value will be displayed in the Mandelbrot.
 * The bailout value can also be changed to show varying levels of preciseness.
 *
 * Controls are printed in the console and can also be found in KeyBindings tab.
 *
 * Initial values of C and BAILOUT are at begining of Julia tab.
 */


PImage img;
static final int WIDTH = 1000;
static final int HEIGHT = WIDTH / 2;
static final int MANDELBROT_START = 0;
static final int MANDELBROT_END = WIDTH / 2;
static final int JULIA_START = MANDELBROT_END;
static final int JULIA_END = WIDTH;

static final int NO_ESCAPE   = 255 << 24 | 0 << 16 | 0 << 8 | 0;
static final int ESCAPE_FROM = 255 << 24 | 255 << 16 | 255 << 8 | 255;
static final int ESCAPE_TO   = 255 << 24 | 0 << 16 | 0 << 8 | 0;
static final int MANDELBROT_CURSOR = 255 << 24 | 255 << 16 | 0 << 8 | 0;

void settings() {
  size(WIDTH, HEIGHT);
  img = createImage(WIDTH, HEIGHT, RGB);
}

void setup() {
  drawMandelbrot();
  drawJulia();
  image(img, 0, 0);

  println("Key bindings:");
  println("s    save");
  println("z    decrease bailout value (10 min)");
  println("x    increase bailout value (250 max)");
  println("c    change C values with mouse");
  println("o    show orbit of C value at mouse position");
}

void draw() {
  if (mouseC) {
    float cr, ci;

    if (mouseX < JULIA_START)
      cr = map(mouseX, MANDELBROT_START, MANDELBROT_END, -2, 2);
    else
      cr = map(mouseX, JULIA_START, JULIA_END, -2, 2);
    
    ci = map(mouseY, 0, HEIGHT, 2, -2);
    C = new Complex(cr, ci);
    drawJulia();
  }
  image(img, 0, 0);

  if (displayOrbit) orbit();

  noFill();
  stroke(MANDELBROT_CURSOR);
  strokeWeight(3);
  int x = int(map(C.a, -2, 2, MANDELBROT_START, MANDELBROT_END));
  int y = int(map(C.b, 2, -2, 0, HEIGHT));
  point(x, y);
  strokeWeight(1);
  ellipse(x, y, 20, 20);

  fill(0);
  text("C Value: " + C, JULIA_START + 10, 15);
  text("Bailout: " + BAILOUT, JULIA_START + 10, 30);
}
