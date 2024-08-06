class Cell
{

  private PVector indexVector; 
  private PVector dimension;
  private PVector position;

  private boolean isTaken;

  /* Constructor definition */
  public Cell(PVector indexVector, int gridResolution)
  {
    this.indexVector = indexVector;

    var cellNumberIsValid = (gridResolution != 0);
    if (cellNumberIsValid)
    {
      var dimX = width / gridResolution;
      var dimY = height / gridResolution;
      this.dimension = new PVector(dimX, dimY);
      
      var posX = this.indexVector.x * this.dimension.x;
      var posY = this.indexVector.y * this.dimension.y;
      this.position = new PVector(posX, posY);
    }

    this.isTaken = false;
  }

  /* Function definition */
  public void reserve()
  {
    if (!this.isTaken) this.isTaken = true;
  }
  
  public void render()
  {
    pushMatrix();
    translate(this.position.x, this.position.y);
    
    noFill();
    stroke(255, 210);
    rect(0, 0, this.dimension.x, this.dimension.y);
    
    popMatrix();
  }
}
