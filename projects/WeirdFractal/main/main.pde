WeirdFractal weirdFractal;

void setup()
{
  surface.setTitle("Weird Fractal");
  surface.setResizable(false);
  surface.setLocation(displayWidth / 3, floor(0.1 * displayHeight));

  weirdFractal = new WeirdFractal();

  size(780, 780);
  colorMode(HSB, 255, 255, 255);
}

void draw()
{
  background(0);

  weirdFractal.generate();
  weirdFractal.show();
}
