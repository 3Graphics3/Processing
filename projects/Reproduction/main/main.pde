LifeGrid lifeGrid;

void setup()
{
  surface.setTitle("Reproduction");
  surface.setResizable(false);
  surface.setLocation(displayWidth / 3, floor(0.1 * displayHeight));
  
  createLifeGrid();

  size(720, 720, P2D);
}

void createLifeGrid()
{
  var resolution = 90;
  lifeGrid = new LifeGrid(resolution);
}

void draw()
{
  background(0);
  frameRate(7);

  lifeGrid.grow();
  lifeGrid.render();
}
