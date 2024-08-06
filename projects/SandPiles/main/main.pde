SandPile sandPile;

void setup()
{
  surface.setTitle("SandPiles");
  surface.setResizable(false);
  surface.setLocation(displayWidth / 3, floor(0.1 * displayHeight));

  createSandPile();

  size(720, 720);
  colorMode(HSB, 255, 255, 255);
}

void createSandPile()
{
  //var pixelColors = new color[]
  //  {
  //  color(78, 186, 125),
  //  color(81, 116, 124),
  //  color(53, 71, 73),
  //  color(36, 46, 50)
  //};

  var pixelColors = new color[]
    {
    color(95, 93, 188),
    color(65, 58, 66),
    color(224, 159, 69),
    color(128, 186, 190),
    color(94, 84, 93)
  };

  sandPile = new SandPile(pixelColors);
}

void draw()
{
  background(0);

  sandPile.show();
  for (int times = 0; times < 120; times++)
    sandPile.arrange();
}
