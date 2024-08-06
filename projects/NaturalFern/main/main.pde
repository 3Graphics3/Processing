NaturalFern naturalFern;

void setup()
{
  surface.setTitle("Natural Fern");
  createNaturalFern();

  fullScreen(P2D);
  colorMode(HSB, 360, 255, 255);
}

void createNaturalFern()
{
  naturalFern = new NaturalFern();
}

void draw()
{
  background(0);

  naturalFern.animate();
  naturalFern.render();
}
