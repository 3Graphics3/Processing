MetaSurface metaSurface;

void setup()
{
  surface.setTitle("Metaballs");
  surface.setResizable(false);
  surface.setLocation(displayWidth / 3, floor(0.1 * displayHeight));

  createMetaSurface();

  size(690, 690);
  colorMode(HSB, 360, 255, 255);
}

void createMetaSurface()
{
  var capacity = 6;
  metaSurface = new MetaSurface(capacity);
}

void draw()
{
  background(0);

  metaSurface.animate();
  metaSurface.render();
}
