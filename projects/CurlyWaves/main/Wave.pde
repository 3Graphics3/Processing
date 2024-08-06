class Wave
{

  private float amplitude;
  private float period;
  private float frequency;

  private float phase;
  private float deltaPhase;
  private float spacing;

  private ArrayList<Oscillator> particles;

  /* Constructor definition */
  public Wave(float amplitude, float period, float deltaPhase)
  {
    this.amplitude = amplitude;
    this.period = period;

    if (this.period != 0) this.frequency = 1 / period;
    else this.frequency = 0;

    this.phase = 0f;
    this.deltaPhase = deltaPhase;
    this.spacing = (int)width / 30;

    this.createParticleWave();
  }

  /* Function definition */
  private void createParticleWave()
  {
    this.particles = new ArrayList<Oscillator>();

    var fillColor = color(random(255), 120, random(255));
    for (float x = 0; x < width; x += this.spacing)
    {
      var theta = this.phase + TWO_PI * x * this.frequency;
      var y = map(sin(theta), -1, 1, -this.amplitude, this.amplitude);

      var position = new PVector(x, y);
      var radius = 15f;
      this.particles.add(new Oscillator(position, radius, fillColor));
    }
  }

  public void oscillate()
  {
    this.phase += this.deltaPhase;

    var p = 0;
    for (float x = 0; x < width; x += this.spacing)
    {
      var theta = this.phase + TWO_PI * x * this.frequency;
      var particle = this.particles.get(p);
      particle.oscillate(theta, this.amplitude);

      p += 1;
    }
  }

  public void show()
  {
    fill(255, 150);

    if (this.particles != null && !this.particles.isEmpty())
    {
      for (var particle : this.particles)
        particle.show();
    }
  }
  
}
