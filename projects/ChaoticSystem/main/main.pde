import peasy.*;

PeasyCam camera;
ChaoticSystem system;

void setup()
{
  surface.setTitle("Chaotic System");
  
  camera = new PeasyCam(this, 420);
  createSystem();

  fullScreen(P3D);
  colorMode(HSB, 360, 255, 255);
}

void createSystem()
{
  var pointLimit = 15 * 312;
  system = new ChaoticSystem(pointLimit);
}

void draw()
{
  background(0);

  system.animate();
  system.render();
}
