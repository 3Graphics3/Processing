EpicyclePainter epicyclePainter;

void setup()
{
  surface.setTitle("Epicycle Painter");
  surface.setResizable(false);
  surface.setLocation(displayWidth / 6, floor(0.1 * displayHeight));

  createPainter();
  size(1320, 690, P2D);
}

void createPainter()
{
  var posX = 0.25 * width;
  var posY = 0.5 * height;
  var origin = new PVector(posX, posY);

  epicyclePainter = new EpicyclePainter(origin);
}

void draw()
{
  background(0);

  epicyclePainter.animate();
  epicyclePainter.render();
}
