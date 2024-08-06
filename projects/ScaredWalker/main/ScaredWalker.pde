class Scaredwalker
{

  private Scaredgrid scaredGrid;

  private PVector position;
  private float radius;

  private Cell currentCell;

  /* Constructor definition */
  public Scaredwalker(Scaredgrid scaredGrid)
  {
    this.scaredGrid = scaredGrid;
    var resolution = this.scaredGrid.gridResolution;

    var middle = floor(resolution / 2);
    var dimX = width / resolution;
    var dimY = height / resolution;
    var posX = middle * dimX - dimX / 2;
    var posY = middle * dimY - dimY / 2;
    this.position = new PVector(posX, posY);
    this.radius = dimX / 2;

    this.currentCell = this.scaredGrid.getCell(middle, middle);
  }

  /* Function definition */
  public void walk()
  {
    this.currentCell.reserve();

    var possibleMoves = this.findPossibleMoves();
    var walkerIsStuck = (possibleMoves.size() == 0);
    if (walkerIsStuck)
    {
      println("I can't move anymore :(");
      noLoop();

      return;
    }

    var direction = new Direction();
    var randomIndex = floor(random(0, possibleMoves.size()));
    var randomMove = possibleMoves.get(randomIndex);

    var randomVector = direction.motionMap.get(randomMove);
    randomVector.mult(2 * this.radius);
    this.position.add(randomVector);

    var nextCell = this.findNextCell(randomMove);
    var nextRow = floor(nextCell.x);
    var nextCol = floor(nextCell.y);
    this.currentCell = this.scaredGrid.getCell(nextRow, nextCol);
  }

  private ArrayList<Integer> findPossibleMoves()
  {
    var possibleMoves = new ArrayList<Integer>();

    var currentRow = floor(this.currentCell.indexVector.x);
    var currentCol = floor(this.currentCell.indexVector.y);

    var leftCell = this.scaredGrid.getCell(currentRow, currentCol - 1);
    var canMoveLeft = (!leftCell.isTaken);
    if (canMoveLeft) possibleMoves.add(0);

    var rightCell = this.scaredGrid.getCell(currentRow, currentCol + 1);
    var canMoveRight = (!rightCell.isTaken);
    if (canMoveRight) possibleMoves.add(1);

    var upperCell = this.scaredGrid.getCell(currentRow - 1, currentCol);
    var canMoveUp = (!upperCell.isTaken);
    if (canMoveUp) possibleMoves.add(2);

    var lowerCell = this.scaredGrid.getCell(currentRow + 1, currentCol);
    var canMoveDown = (!lowerCell.isTaken);
    if (canMoveDown) possibleMoves.add(3);

    return possibleMoves;
  }

  private PVector findNextCell(int randomMove)
  {
    var nextCell = new PVector();
    var currentRow = floor(this.currentCell.indexVector.x);
    var currentCol = floor(this.currentCell.indexVector.y);

    var moveLeft = (randomMove == 0);
    if (moveLeft)
    {
      nextCell.x = currentRow;
      nextCell.y = currentCol - 1;
    }

    var moveRight = (randomMove == 1);
    if (moveRight)
    {
      nextCell.x = currentRow;
      nextCell.y = currentCol + 1;
    }

    var moveUp = (randomMove == 2);
    if (moveUp)
    {
      nextCell.x = currentRow - 1;
      nextCell.y = currentCol;
    }

    var moveDown = (randomMove == 3);
    if (moveDown)
    {
      nextCell.x = currentRow + 1;
      nextCell.y = currentCol;
    }

    return nextCell;
  }

  public void show()
  {
    this.scaredGrid.render();
    this.renderWalker();
  }

  private void renderWalker()
  {
    pushMatrix();
    translate(this.position.x, this.position.y);

    noStroke();
    fill(255, 210);
    circle(0, 0, 2 * this.radius);
    popMatrix();
  }
}
