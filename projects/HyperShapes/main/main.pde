import peasy.*;

PeasyCam camera;
HyperShape hyperShape;

void setup()
{
  surface.setTitle("Hyper Shapes");

  createSupershape();
  camera = new PeasyCam(this, 600);

  fullScreen(P3D);
  colorMode(HSB, 360, 255, 255);
}

void createSupershape()
{
  var resolution = 180;
  hyperShape = new HyperShape(resolution);
}

void draw()
{
  background(0);

  hyperShape.animate();
  hyperShape.render();
}
