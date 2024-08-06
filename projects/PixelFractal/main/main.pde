FractalGrid fractalGrid;

void setup()
{
  surface.setTitle("Pixel Fractal");
  surface.setResizable(false);
  surface.setLocation(displayWidth / 3, floor(0.1 * displayHeight));
  
  createFractalGrid();

  size(720, 720);
  colorMode(HSB, 360, 255, 255);
}

void createFractalGrid()
{
  var resolution = 360;
  var depth = floor(resolution / 3);
  
  fractalGrid = new FractalGrid(resolution, depth);
}

void draw()
{
  background(0);

  fractalGrid.animate();
  fractalGrid.render();
}
