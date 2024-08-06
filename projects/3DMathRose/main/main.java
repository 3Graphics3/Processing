import peasy.*;

PeasyCam camera;
Rose3D rose3D;

void setup()
{
  surface.setTitle("3D Rose");

  camera = new PeasyCam(this, 480);
  createRose3D();

  fullScreen(P3D);
  colorMode(HSB, 360, 255, 255);
}

void createRose3D()
{
  var density = 18; 
  rose3D = new Rose3D(density);
}

void draw()
{
  background(0);

  rose3D.render();
  rose3D.animate();
}
