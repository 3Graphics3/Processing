import ddf.minim.*;

Minim minim;
AudioPlayer ambience;
NoiseTerrain noiseTerrain;

void setup()
{
  surface.setTitle("Noise Terrain");

  surface.setResizable(false);
  surface.setLocation(displayWidth / 3, floor(0.1 * displayHeight));

  createBackMusic();
  createNoiseTerrain();

  size(720, 720);
  colorMode(HSB, 360, 255, 255);
}

void createBackMusic()
{
  minim = new Minim(this);

  var folder = "sound/";
  var name = "Thunder";
  var format = ".mp3";
  var fileName = folder + name + format;

  ambience = minim.loadFile(fileName);
}

void createNoiseTerrain()
{
  noiseTerrain = new NoiseTerrain();
}

void draw()
{
  background(0);

  if (!ambience.isPlaying()) ambience.play();
  if (!ambience.isLooping()) ambience.loop();

  noiseTerrain.render();
  noiseTerrain.animate();
}
