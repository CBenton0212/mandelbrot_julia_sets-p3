/*
 * Key bindings
 * s    save image as PNG
 * z    decrease bailout value
 * x    increase bailout value
 * c    toggle cursor control of C value
 * o    toggle orbit
 */

boolean mouseC = false;
boolean displayOrbit = false;

void keyPressed() {
  if (key == 's') save("images/" + C.toString() + ".png");
  if (key == 'c') mouseC = !mouseC;
  if (key == 'x' && BAILOUT < 250) {
    BAILOUT += 10;
    drawMandelbrot();
    drawJulia();
  }
  if (key == 'z' && BAILOUT > 10) {
    BAILOUT -= 10;
    drawMandelbrot();
    drawJulia();
  }
  if (key == 'o') displayOrbit = !displayOrbit;
}
