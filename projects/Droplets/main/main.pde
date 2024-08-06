import ddf.minim.*;

Minim minim;
AudioPlayer dropSound;

Rain rain;

void setup()
{
  surface.setTitle("Rain Droplets");

  createAudio();
  rain = new Rain();

  fullScreen();
}

void createAudio()
{
  minim = new Minim(this);
  dropSound = minim.loadFile("dropSound.mp3");
}

void draw()
{
  background(0);

  if (!dropSound.isPlaying())
    dropSound.play();

  rain.animate();
  rain.render();
}
