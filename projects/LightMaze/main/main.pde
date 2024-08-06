LightMaze lightMaze;

void setup()
{
  surface.setTitle("LightMaze");
  surface.setResizable(false);
  surface.setLocation(displayWidth / 3, floor(0.1 * displayHeight));

  createLightMaze();

  size(780, 780);
  colorMode(HSB, 360, 255, 255);
}

void createLightMaze()
{
  var totalBarriers = 39;
  var totalBeams = 60;

  lightMaze = new LightMaze(totalBarriers, totalBeams);
}

void draw()
{
  background(0);

  lightMaze.render();
  lightMaze.animate();
}
