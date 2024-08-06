SuperShape superShape;

void setup()
{
  surface.setTitle("Super Shapes");
  surface.setResizable(false);
  surface.setLocation(displayWidth / 3, floor(0.1 * displayHeight));

  createSuperShape();

  size(780, 780);
  colorMode(HSB, 360, 255, 255);
}

void createSuperShape()
{
  var numberOfPoints = 390;
  superShape = new SuperShape(numberOfPoints);
}

void draw()
{
  background(0);

  superShape.animate();
  superShape.render();
}
