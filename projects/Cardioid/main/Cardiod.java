class Cardiod
{

  private int resolution;
  private float maxRadius;
  private float[] imaginaryHues;

  /* Constructor definition */
  public Cardiod(int resolution)
  {
    this.resolution = resolution;
    this.maxRadius = TAU;
    this.imaginaryHues = new float[width * (height + 1)];

    this.createCardiod();
  }

  /* Function definition */
  private void createCardiod()
  {
    for (int x = 0; x < width; x++)
    {
      for (int y = 0; y < height; y++)
      {
        var piX = map(x, 0, width, -2.00, 0.47);
        var piY = map(y, 0, height, -1.12, 1.12);

        var c0 = new PVector(piX, piY);
        var iteration = 0;
        for (int k = 0; k < this.resolution; k++)
        {
          var piXSquared = pow(piX, 2);
          var piYSquared = pow(piY, 2);
          var magnitude = piXSquared + piYSquared;
          if (magnitude > this.maxRadius) break;

          var newX = piXSquared - piYSquared;
          var newY = 2 * piX * piY;
          piX = newX + c0.x;
          piY = newY + c0.y;

          iteration++;
        }

        var sineValue = sin(iteration);
        var hue = map(sineValue, -1, 1, 360, 0);
        var pixelIndex = x + y * width;

        this.imaginaryHues[pixelIndex] = hue;
      }
    }
  }

  public void render()
  {
    if (this.imaginaryHues != null)
    {
      loadPixels();
      for (int x = 0; x < width; x++)
      {
        for (int y = 0; y < height; y++)
        {
          var pixelIndex = x + y * width;

          var imaginaryHue = this.imaginaryHues[pixelIndex];
          var imaginaryColor = color(imaginaryHue, 255);
          pixels[pixelIndex] = imaginaryColor;
        }
      }
      updatePixels();
    }
  }
}
