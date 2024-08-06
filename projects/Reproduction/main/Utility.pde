class Utility
{

  /* Constructor definition */
  public Utility()
  {
  }

  /* Function definition */
  public LifeCell[][] getCopy(LifeCell[][] lifeGrid)
  {
    var resolution = lifeGrid.length;
    var copyGrid = new LifeCell[resolution][resolution];

    for (var col = 0; col < resolution; col++)
      for (var row = 0; row < resolution; row++)
        copyGrid[col][row] = lifeGrid[col][row];

    return copyGrid;
  }

  public int getNextState(LifeCell[][] lifeGrid, int[] position)
  {
    var col = position[0];
    var row = position[1];
    var currentCell = lifeGrid[col][row];
    var cellNeighbors = this.countNeighbors(lifeGrid, position);

    if (currentCell.isAlive() && (cellNeighbors < 2 || cellNeighbors > 3)) return 0;
    if (currentCell.isAlive() && (cellNeighbors == 2 || cellNeighbors == 3)) return currentCell.state;
    if (!currentCell.isAlive() && cellNeighbors == 3) return 1;

    return currentCell.state;
  }

  private int countNeighbors(LifeCell[][] lifeGrid, int[] position)
  {
    var resolution = lifeGrid.length;
    var col = position[0];
    var row = position[1];
    var totalNeighbors = -lifeGrid[col][row].state;

    var a = -1;
    var b = 2;
    for (var i = a; i < b; i++)
    {
      for (var j = a; j < b; j++)
      {
        var x = (col + i + resolution) % resolution;
        var y = (row + j + resolution) % resolution;
        var neighborState = lifeGrid[x][y].state;

        totalNeighbors += neighborState;
      }
    }

    return totalNeighbors;
  }
}
