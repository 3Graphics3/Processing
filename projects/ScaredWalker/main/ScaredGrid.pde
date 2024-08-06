class Scaredgrid
{

  private int gridResolution;
  private Cell[][] scaredGrid;

  /* Constructor definition */
  public Scaredgrid(int gridResolution)
  {
    this.gridResolution = gridResolution;
    this.constructGrid();
  }

  /* Function definition */
  private void constructGrid()
  {
    this.scaredGrid = new Cell[this.gridResolution][this.gridResolution];
    for (int row = 0; row < this.gridResolution; row++)
    {
      for (int col = 0; col < this.gridResolution; col++)
      {
        var indexVector = new PVector(row, col);
        this.scaredGrid[row][col] = new Cell(indexVector, this.gridResolution);
      }
    }
  }
  
  public Cell getCell(int row, int col)
  {
    return this.scaredGrid[row][col];
  }

  public void render()
  {
    if (this.scaredGrid != null)
    {
      for (int row = 0; row < this.gridResolution; row++)
      {
        for (int col = 0; col < this.gridResolution; col++)
          this.scaredGrid[row][col].render();
      }
    }
  }
}
