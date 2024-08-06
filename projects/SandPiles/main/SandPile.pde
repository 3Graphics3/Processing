class SandPile
{

  private PVector dimension;
  private int[][] sandPile;

  private int cellBound;
  private int decrementation;
  private color[] pixelColors;

  /* Constructor definition */
  public SandPile(color[] pixelColors)
  {
    this.dimension = new PVector(width, height);
    this.initializeSandPile();

    this.cellBound = 4;
    this.decrementation = -4;
    this.pixelColors = pixelColors;
  }

  /* Function definition */
  private void initializeSandPile()
  {
    var dimX = (int)this.dimension.x;
    var dimY = (int)this.dimension.y;
    this.sandPile = new int[dimX][dimY];

    for (int row = 0; row < this.dimension.y; row++)
    {
      for (int col = 0; col < this.dimension.x; col++)
        this.sandPile[row][col] = 0;
    }

    var midRow = dimX / 2;
    var midCol = dimY / 2;
    var randomQuantity = (int)random(1000000, 10000000);
    this.sandPile[midRow][midCol] = randomQuantity;
  }

  public void arrange()
  {
    for (int row = 0; row < this.dimension.y; row++)
    {
      for (int col = 0; col < this.dimension.x; col++)
      {
        var cellValue = this.sandPile[row][col];
        var cellValueExceedsBound = (cellValue > this.cellBound);
        if (cellValueExceedsBound)
        {
          var rightNeighborExists = (col + 1 < this.dimension.x);
          var leftNeighborExists = (col - 1 >= 0);
          var upperNeighborExists = (row + 1 < this.dimension.y);
          var lowerNeighborExists = (row - 1 >= 0);

          if (rightNeighborExists) this.sandPile[row][col + 1]++;
          if (leftNeighborExists) this.sandPile[row][col - 1]++;
          if (upperNeighborExists) this.sandPile[row + 1][col]++;
          if (lowerNeighborExists) this.sandPile[row - 1][col]++;

          this.sandPile[row][col] += this.decrementation;
        }
      }
    }
  }

  public void show()
  {
    loadPixels();
    for (int row = 0; row < this.dimension.y; row++)
    {
      for (int col = 0; col < this.dimension.x; col++)
      {
        var cellValue = this.sandPile[row][col];
        var cellValueIsValid = (cellValue < this.cellBound);
        var sandGrainColor = (cellValueIsValid ? pixelColors[this.cellBound - cellValue] : color(0, 0, 0));

        var pixelIndex = row + col * (int)this.dimension.x;
        pixels[pixelIndex] = sandGrainColor;
      }
    }
    updatePixels();
  }
}
