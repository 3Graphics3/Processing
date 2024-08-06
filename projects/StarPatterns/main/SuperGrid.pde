class Supergrid
{

  private int resolution;
  private PVector cellDim;

  private int starResolution;
  private Superstar[][] superGrid;

  private float stretch;
  private float maxStretch;
  private float deltaStretch;

  /* Constructor definition */
  public Supergrid(int dimension, int resolution)
  {
    this.resolution = resolution;

    var cellX = dimension / this.resolution;
    var cellY = dimension / this.resolution;
    this.cellDim = new PVector(cellX, cellY);

    this.starResolution = 123;
    this.superGrid = new Superstar[this.resolution][this.resolution];
    this.createSupergrid();

    this.stretch = 0f;
    this.maxStretch = 2 * TAU;
    this.deltaStretch = 0.009;
  }

  public void animate()
  {
    if (this.superGrid != null)
    {
      this.createSupergrid();

      var maxStrechExceeded = (this.stretch > this.maxStretch);
      if (maxStrechExceeded) this.stretch = 0f;

      this.stretch += this.deltaStretch;
    }
  }

  private void createSupergrid()
  {
    for (int row = 0; row < this.resolution; row++)
    {
      var cellX = this.cellDim.x;
      var cellY = this.cellDim.y;

      var posY = row * cellY + cellY / 2;
      for (int col = 0; col < this.resolution; col++)
      {
        var posX = col * cellX + cellX / 2;
        var origin = new PVector(posX, posY);
        var starResolution = this.starResolution;
        var angleFactor = this.stretch * cellY;

        this.superGrid[row][col] = new Superstar(origin,
          angleFactor, starResolution);
      }
    }
  }

  public void render()
  {
    if (this.superGrid != null)
    {
      for (int row = 0; row < this.resolution; row++)
        for (int col = 0; col < this.resolution; col++)
          this.superGrid[row][col].render();
    }
  }
}
