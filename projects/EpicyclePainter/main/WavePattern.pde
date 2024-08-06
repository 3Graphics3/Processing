class WavePattern
{

  private PVector position;
  private ArrayList<Float> wave;

  /* Constructor definition */
  public WavePattern(PVector position)
  {
    this.position = position;
    this.wave = new ArrayList<Float>();
  }

  /* Function definition */
  public void addPoint(float posY)
  {
    this.wave.add(0, posY);
  }

  public float getPoint(int index)
  {
    return this.wave.get(index);
  }

  public PVector getPosition()
  {
    return this.position;
  }

  public void render()
  {
    if (this.wave != null)
    {
      this.renderWave();
      this.monitorWave();
    }
  }

  public void renderWave()
  {
    pushMatrix();
    translate(this.position.x, this.position.y);

    beginShape();
    for (int p = 0; p < this.wave.size(); p++)
      vertex(p, this.wave.get(p));
    endShape();
    popMatrix();
  }

  private void monitorWave()
  {
    var waveLength = this.wave.size();
    var waveBound = 123 * width / waveLength;
    var waveOverflows = (waveLength > waveBound);

    if (waveOverflows)
      this.wave.remove(waveLength - 1);
  }
}
