Supergrid superGrid;

void setup()
{
  surface.setTitle("Star Patterns");
  surface.setResizable(false);
  surface.setLocation(displayWidth / 3, floor(0.1 * displayHeight));

  createSupergrid();

  size(750, 750);
  colorMode(HSB, 360, 255, 255);
}

void createSupergrid()
{
  var dimension = height;
  var gridResolution = 6;

  superGrid = new Supergrid(dimension, gridResolution);
}

void draw()
{
  background(0);

  superGrid.render();
  superGrid.animate();
}
