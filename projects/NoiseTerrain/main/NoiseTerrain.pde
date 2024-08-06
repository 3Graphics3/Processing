class NoiseTerrain
{

  private NoiseField noiseField;

  /* Constructor definition */
  public NoiseTerrain()
  {
    this.noiseField = new NoiseField();
  }

  /* Function definition */
  public void animate()
  {
    this.noiseField.animate();
  }

  public void render()
  {
    loadPixels();
    for (int x = 0; x < width; x++)
    {
      for (int y = 0; y < height; y++)
      {
        var pixelIndex = x + y * width;
        var colorField = this.noiseField.getColorField();
        pixels[pixelIndex] = colorField[pixelIndex];
      }
    }
    updatePixels();
  }
}
