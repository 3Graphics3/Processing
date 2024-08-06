PolarFlower polarFlower;

void setup()
{
  surface.setTitle("Polar Flower");
  createPolarFlower();

  fullScreen();
  colorMode(HSB, 360, 255, 255);
}

void createPolarFlower()
{
  var frequency = 30;
  polarFlower = new PolarFlower(frequency);
}

void draw()
{
  background(0);

  polarFlower.render();
  polarFlower.animate();
}
