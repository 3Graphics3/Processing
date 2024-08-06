NoiseAudio noiseAudio;

void setup()
{
  surface.setTitle("Noise Audio");
  createNoiseAudio();

  fullScreen();
  colorMode(HSB, 360, 255, 255);
}

void createNoiseAudio()
{
  var numberOfDiscs = 12;
  noiseAudio = new NoiseAudio(numberOfDiscs);
}

void draw()
{
  var noiseValue = noise(frameRate / 15);
  var hue = map(noiseValue, 0, 1, 0, 360);
  background(hue, 255, 90);

  noiseAudio.render();
  noiseAudio.animate();
}
