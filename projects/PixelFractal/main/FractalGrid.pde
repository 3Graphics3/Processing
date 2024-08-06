class FractalGrid
{

  private Utility utility;

  private int resolution;
  private Cell[][] currentGrid;
  
  private int generation;
  private int depth;

  /* Constructor definition */
  public FractalGrid(int resolution, int depth)
  {
    this.utility = new Utility();

    this.resolution = resolution;
    this.createFractalGrid();
    this.initializeFractalGrid();
    
    this.generation = 0;
    this.depth = depth;
  }

  /* Function definition */
  private void createFractalGrid()
  {
    this.currentGrid = new Cell[this.resolution][this.resolution];

    var radius = width / resolution;
    for (var col = 0; col < this.resolution; col++)
    {
      var posY = col * radius;
      for (var row = 0; row < this.resolution; row++)
      {
        var posX = row * radius;
        var position = new PVector(posX, posY);

        this.currentGrid[col][row] = new Cell(position, radius);
      }
    }
  }

  private void initializeFractalGrid()
  {
    var row = floor(this.resolution / 2);
    var col = floor(this.resolution / 2);
    this.currentGrid[row][col].state = 1;
  }

  public void animate()
  {
    if (this.generation < this.depth)
    {
      var nextGrid = this.utility.getCopy(this.currentGrid);

      for (var col = 1; col < this.resolution - 1; col++)
      {
        for (var row = 1; row < this.resolution - 1; row++)
        {
          var position = new int[] {col, row};
          var nextState = this.utility.getNextState(this.currentGrid, position);

          nextGrid[col][row].state = nextState;
        }
      }

      this.currentGrid = nextGrid;
    }
    
    this.generation++;
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
