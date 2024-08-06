class Utility
{

  /* Constructor definition */
  public Utility()
  {
  }

  /* Function definition */
  public Cell[][] getCopy(Cell[][] fractalGrid)
  {
    var resolution = fractalGrid.length;
    var copyGrid = new Cell[resolution][resolution];

    for (var col = 0; col < resolution; col++)
      for (var row = 0; row < resolution; row++)
        copyGrid[col][row] = fractalGrid[col][row];

    return copyGrid;
  }

  public int getNextState(Cell[][] fractalGrid, int[] position)
  {
    var col = position[0];
    var row = position[1];
    var currentCell = fractalGrid[col][row];
    var aliveNeighbors = this.countNeighbors(fractalGrid, position);

    if (aliveNeighbors == 1) return 1;
    return currentCell.state;
  }

  private int countNeighbors(Cell[][] fractalGrid, int[] position)
  {
    var col = position[0];
    var row = position[1];
    var neighborsX = fractalGrid[row + 1][col].state +
                     fractalGrid[row - 1][col].state;
    var neighborsY = fractalGrid[row][col + 1].state +
                     fractalGrid[row][col - 1].state;

    return neighborsX + neighborsY;
  }
}
