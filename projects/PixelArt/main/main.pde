PixelGrid pixelGrid;

void setup()
{
  surface.setTitle("Pixel Art");

  createPixelGrid();
  fullScreen(P2D);
}

void createPixelGrid()
{
  var resolution = width / 3;
  var configuration = 154;
  
  pixelGrid = new PixelGrid(resolution, configuration);
}

void draw()
{
  background(0);
  
  pixelGrid.render();
  pixelGrid.animate();
}
