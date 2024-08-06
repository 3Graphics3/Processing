import processing.video.*;

TextWorld textWorld;

void setup()
{
  surface.setTitle("Text World");
  createTextWorld();

  fullScreen();
  colorMode(HSB, 360, 255, 255);
}

void createTextWorld()
{
  var video = new Capture(this, 240, 240);
  var resolution = 210;

  textWorld = new TextWorld(video, resolution);
}

void draw()
{
  background(0);

  textWorld.render();
}
