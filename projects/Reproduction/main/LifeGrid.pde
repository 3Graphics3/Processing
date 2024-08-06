class LifeGrid
{

  private Utility utility;

  private int resolution;
  private LifeCell[][] currentGrid;

  /* Constructor definition */
  public LifeGrid(int resolution)
  {
    this.utility = new Utility();

    this.resolution = resolution;
    this.createLifeGrid();
  }

  /* Function definition */
  private void createLifeGrid()
  {
    this.currentGrid = new LifeCell[this.resolution][this.resolution];

    var radius = width / resolution;
    for (var col = 0; col < this.resolution; col++)
    {
      var posY = col * radius;
      for (var row = 0; row < this.resolution; row++)
      {
        var posX = row * radius;
        var position = new PVector(posX, posY);

        this.currentGrid[col][row] = new LifeCell(position, radius);
      }
    }
  }

  public void grow()
  {
    var nextGrid = this.utility.getCopy(this.currentGrid);

    for (var col = 0; col < this.resolution; col++)
    {
      for (var row = 0; row < this.resolution; row++)
      {
        var position = new int[] {col, row};
        var nextState = this.utility.getNextState(this.currentGrid, position);

        nextGrid[col][row].state = nextState;
      }
    }

    this.currentGrid = nextGrid;
  }

  public void render()
  {
    if (this.currentGrid != null)
    {
      for (var col = 0; col < this.resolution; col++)
        for (var row = 0; row < this.resolution; row++)
          this.currentGrid[col][row].render();
    }
  }
}
