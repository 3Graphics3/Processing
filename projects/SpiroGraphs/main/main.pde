SpiroPainter painter;

void setup()
{
  surface.setTitle("Spiro-Graphs");
  surface.setResizable(false);
  surface.setLocation(displayWidth / 3, floor(0.1 * displayHeight));

  createPainter();

  size(780, 780);
  colorMode(HSB, 360, 255, 255);
}

void createPainter()
{
  var depth = 18;
  painter = new SpiroPainter(depth);
}

void draw()
{
  background(0);

  painter.render();
  painter.animate();
}
