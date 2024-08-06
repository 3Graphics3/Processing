class MetaSurface
{

  private ArrayList<Metaball> metaballs;
  private float[] metaHues;

  /* Constructor definition */
  public MetaSurface(int capacity)
  {
    this.createMetaballs(capacity);
    this.metaHues = new float[width * (height + 1)];
  }

  /* Function definition */
  private void createMetaballs(int capacity)
  {
    this.metaballs = new ArrayList<Metaball>();

    for (int b = 0; b < capacity; b++)
    {
      var posX = random(width);
      var posY = random(height);
      var position = new PVector(posX, posY);
      var radius = pow(PI, 4.7);

      this.metaballs.add(new Metaball(position, radius));
    }
  }

  public void animate()
  {
    if (this.metaballs != null)
    {
      this.updateMetaHues();

      for (var metaball : this.metaballs)
        metaball.animate();
    }
  }

  private void updateMetaHues()
  {
    for (int x = 0; x < width; x++)
    {
      for (int y = 0; y < height; y++)
      {
        var pixelIndex = x + y * width;

        var metaHue = 0f;
        for (var metaball : this.metaballs)
        {
          var position = metaball.getPosition();
          var mX = position.x;
          var mY = position.y;

          var distance = dist(x, y, mX, mY);
          var metaTerm = metaball.getRadius() / distance;
          var scalar = pow(PI, 3);
          metaTerm *= scalar;

          metaHue += metaTerm;
        }

        this.metaHues[pixelIndex] = metaHue;
      }
    }
  }

  public void render()
  {
    if (this.metaballs != null)
    {
      loadPixels();
      for (int x = 0; x < width; x++)
      {
        for (int y = 0; y < height; y++)
        {
          var pixelIndex = x + y * width;
          var metaHue = this.metaHues[pixelIndex];

          /*
           * We can also change the patterns of
           * the metaballs, by modulating the metaHue
           * variable, by the parameter modulo.
           * Some really interesting values are
           * given below:
           *
           * --> 21
           * --> 210
           * --> 255
           * --> 360
           */
          var modulo = 255;
          metaHue %= modulo;
          var metaColor = color(metaHue, 255, 255);

          pixels[pixelIndex] = metaColor;
        }
      }
      updatePixels();
    }
  }
}
