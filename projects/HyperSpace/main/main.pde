import peasy.*;

PeasyCam camera;
HyperSpace hyperSpace;

void setup()
{
  surface.setTitle("HyperSpace");

  camera = new PeasyCam(this, 420);
  createHyperSpace();

  fullScreen(P3D);
  colorMode(HSB, 360, 255, 255);
}

void createHyperSpace()
{
  hyperSpace = new HyperSpace();
}

void draw()
{
  background(0);

  hyperSpace.animate();
  hyperSpace.render();
}
