class NoiseField
{

  private PVector delta;

  private float time;
  private float deltaTime;

  private float zeta;
  private float deltaZeta;
  private color[] colorField;

  /* Constructor definition */
  public NoiseField()
  {
    this.time = 0f;
    
    /*
     * Affects the rate of change
     * of all the components of the
     * seed paremeters (x, y, zeta)
     * of the noise() function.
     */
    this.deltaTime = PI / 123;

    var dx = 0.0003f;
    var dy = 0.0003f;
    var dz = 0.09f;
    this.delta = new PVector(dx, dy, dz);

    this.zeta = 0f;
    
    /*
     * Affects the rate of change of
     * the terrain's speed, which
     * corresponds to the zeta paremeter
     * of the noise() function.
     */
    var power = sqrt(2);
    this.deltaZeta = pow(this.delta.z, power);

    this.colorField = new color[width * (height + 1)];
    this.createColorField();
  }

  /* Function definition */
  public color[] getColorField()
  {
    return this.colorField;
  }

  public void animate()
  {
    if (this.colorField != null)
    {
      this.createColorField();

      this.time += this.deltaTime;
      this.zeta += this.deltaZeta;
    }
  }

  private void createColorField()
  {
    var y = 0f;
    for (int i = 0; i < width; i++)
    {
      var deltaY = this.delta.y * this.time;

      var x = 0f;
      for (int j = 0; j < height; j++)
      {
        var pixelIndex = i + j * width;
        var deltaX = this.delta.x * this.time;

        var noiseValue = noise(x, y, zeta);
        var hue = map(noiseValue, 0, 1, 0, 360);
        var alpha = map(noiseValue, 0, 1, 0, 255);
        var pixelColor = color(hue, alpha);

        this.colorField[pixelIndex] = pixelColor;
        x += deltaX;
      }

      y += deltaY;
    }
  }
}
