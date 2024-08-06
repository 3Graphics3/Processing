Mosaic mosaic;

void setup()
{
  surface.setTitle("Mosaic");
  createMosaic();

  fullScreen(P2D);
  colorMode(HSB, 360, 255, 255);
}

void createMosaic()
{
  var totalRegions = 810;
  mosaic = new Mosaic(totalRegions);
}

void draw()
{
  background(0);

  mosaic.animate();
  mosaic.render();
}
