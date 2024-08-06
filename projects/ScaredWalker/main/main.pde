Scaredwalker scaredWalker;

void setup()
{
  surface.setTitle("Scared Walker");
  surface.setResizable(false);
  surface.setLocation(displayWidth / 3, floor(0.1 * displayHeight));

  createScaredWalker();

  size(720, 720);
  background(0);
}

void createScaredWalker()
{
  var gridResolution = 72;
  var scaredGrid = new Scaredgrid(gridResolution);

  scaredWalker = new Scaredwalker(scaredGrid);
}

void draw()
{
  scaredWalker.show();
  scaredWalker.walk();
}
