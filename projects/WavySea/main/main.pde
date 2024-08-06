import ddf.minim.*;

Minim minim;
AudioPlayer waveSound;

Sea sea;

void setup()
{
  surface.setTitle("Wavy Sea");

  createSound();
  createSea();

  fullScreen(P3D);
}

void createSound()
{
  minim = new Minim(this);
  
  waveSound = minim.loadFile("waveSound.mp3");
}

void createSea()
{
  var resolution = 99;
  var dimension = new PVector(width, height);

  sea = new Sea(dimension, resolution);
}

void draw()
{
  background(0);
  translate(width / 2, height / 2);

  if (!waveSound.isPlaying()) waveSound.play();

  sea.flow();
  sea.show();
}
