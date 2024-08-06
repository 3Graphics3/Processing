int waveBound = 12;
float deltaPhase = 3f;
ArrayList<Wave> waves;

Wave additiveWave;

void setup()
{
  surface.setTitle("Curly Wave");
  surface.setResizable(false);
  surface.setLocation(displayWidth / 3, floor(0.1 * displayHeight));

  createWaves();
  createAdditiveWave();

  size(810, 600);
}

void mousePressed()
{
  createWaves();
  createAdditiveWave();
}

void createWaves()
{
  waves = new ArrayList<Wave>();

  for (int w = 0; w < waveBound; w++)
  {
    var amplitude = random(3, 15);
    var period = random(120, 150);

    waves.add(new Wave(amplitude, period, deltaPhase));
  }
}

void createAdditiveWave()
{
  var amplitude = 0f;
  var period = 0f;
  for (int w = 0; w < waves.size(); w++)
  {
    var wave = waves.get(w);

    amplitude += wave.amplitude;
    period += (float)Math.pow(wave.period, random(0.03, 0.3)) * noise(w);

    additiveWave = new Wave(amplitude, period, deltaPhase);
  }
}

void draw()
{
  background(0);

  pushMatrix();
  translate(0, 0.5 * height);

  additiveWave.oscillate();
  additiveWave.show();
  popMatrix();
}
