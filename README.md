## Mandelbrot and Julia Set Visualization

### Overview
"The [Mandelbrot Set](https://en.wikipedia.org/wiki/Mandelbrot_set) is the set of complex numbers _c_ for which the function ![f_c(z) = z^2 + c](https://latex.codecogs.com/svg.latex?f_c%28z%29%20%3D%20z%5E2%20&plus;%20c) does not diverge when iterated from ![z = 0](https://latex.codecogs.com/svg.latex?z%20%3D%200) for which the sequence ![f_c(0)](https://latex.codecogs.com/svg.latex?f_c%280%29%2C%20f_c%28f_c%280%29%29), etc., remains bounded in absolute value" -Wikipedia

We can visualize the Mandelbrot Set by letting each pixel represent a complex number, _c_, where the real and imaginary components of _c_ are associated with the x and y positions of each pixel respectively. The color of each pixel is determined by the rate at with _c_ diverges; black pixels represent values which do not diverge while white pixels represent values which diverge quickly.

A [Julia Set](https://en.wikipedia.org/wiki/Julia_set) is a set that corresponds to the Mandelbrot set for which the value of _c_ is held constant but the value of _z_ is variable (in contrast to the Mandelbrot set where _z_ is held constant at 0  + 0_i_ ). _z_ is determined by the complex number represented at each pixel in the image space, where x and y positions depict real and imaginary components of _z_.

### Requirements

In order to run this visualization tool, you will need to download and install [Processing](https://processing.org/download/). 

### Usage

Once Processing is installed, open any of the .pde files and run the program.

#### Controls

| Key | Description                             |
|-----|-----------------------------------------|
| z   | decrease bailout value (minimum of 10)  |
| x   | increase bailout value (maximum of 250) |
| c   | toggle mouse control for changing _c_   |
| o   | toggle orbital display of _c_           |
| s   | save image                              |

The bailout value determines the threshold for which a value is considered to diverge. Adjusting the bailout value will result in varying levels of preciseness.

Enabling mouse control of the _c_ value allows you to move the mouse around the Mandelbrot Set, setting the _c_ value for the associated Julia Set.

Enabling the orbital display highlights the calculated values of ![f_c(z) = z^2 + c](https://latex.codecogs.com/svg.latex?f_c%28z%29%20%3D%20z%5E2%20&plus;%20c), where ![z_0 = c_{(x, y)}](https://latex.codecogs.com/gif.latex?z_0%20%3D%20c_%7B%28x%2C%20y%29%7D) and ![z_i = f_c(z_{i-1})](https://latex.codecogs.com/gif.latex?z_i%20%3D%20f_c%28z_%7Bi-1%7D%29)


