StellarSystem stellarSystem;

void setup()
{
  surface.setTitle("Planet Clock");

  createStellarSystem();

  fullScreen();
  colorMode(HSB, 255, 255, 255);
}

void createStellarSystem()
{
  var radius = 60f;
  var posX = width / 2;
  var posY = height / 2;
  var position = new PVector(posX, posY);
  var sun = new Attractor(position, radius);

  stellarSystem = new StellarSystem(sun);
}

void draw()
{
  background(0);
  
  stellarSystem.show();
  stellarSystem.update();
}
