class NoiseField
{

  private int resolution;

  private OpenSimplexNoise noise;
  private float[][] noiseField;

  private float deltaNoiseXY;
  private float noiseZ;
  private float deltaNoiseZ;

  /* Constructor definition */
  public NoiseField(int resolution)
  {
    this.resolution = resolution;

    this.noise = new OpenSimplexNoise();
    this.noiseField = new float[this.resolution][this.resolution];

    this.deltaNoiseXY = PI / 54;

    /*
     * Alternative values for deltaNoiseZ, in
     * order to create some really aesthetic
     * view in the eyes of the spectator:
     *
     * --> 0.96f
     * --> 0.45f
     */
    this.deltaNoiseZ = 0.45 * this.deltaNoiseXY;
  }

  /* Function definition */
  public void update()
  {
    var noiseX = 0f;
    for (int row = 0; row < this.resolution; row++)
    {
      noiseX += this.deltaNoiseXY;

      var noiseY = 0f;
      for (int col = 0; col < this.resolution; col++)
      {
        noiseY += this.deltaNoiseXY;

        var noiseWeight = (float)this.noise.eval(noiseY, noiseX, this.noiseZ);
        this.noiseField[row][col] = noiseWeight;
      }
    }

    this.noiseZ += this.deltaNoiseZ;
  }

  public float getValue(int row, int col)
  {
    return this.noiseField[row][col];
  }
}
