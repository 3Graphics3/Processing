import ddf.minim.*;

Minim minim;
AudioPlayer ambience;

Landscape landscape;

void setup()
{
  surface.setTitle("Landscapes");
  surface.setResizable(false);
  surface.setLocation(displayWidth / 3, floor(0.1 * displayHeight));

  createBackMusic();
  createLandscape();

  size(840, 840, P2D);
  colorMode(HSB, 300, 255, 255);
}

void createBackMusic()
{
  minim = new Minim(this);

  /*
   * Alternative ambience sounds:
   *
   * --> Wave
   * --> Space
   */
  var folder = "sound/";
  var name = "Space";
  var extension = "Ambience";
  var format = ".mp3";
  var fileName = folder + name + extension
    + format;

  ambience = minim.loadFile(fileName);
}

void createLandscape()
{
  var resolution = 84;
  landscape = new Landscape(resolution);
}

void draw()
{
  background(63);

  if (!ambience.isPlaying()) ambience.play();
  if (!ambience.isLooping()) ambience.loop();

  landscape.update();
  landscape.render();
}
