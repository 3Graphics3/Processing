class Projection
{

  private Utility utility;

  /* Constructor definition */
  public Projection()
  {
    this.utility = new Utility();
  }

  /* Function definition */
  public PVector project(PVector vector)
  {
    var projectionMatrix = new float[][] {
      {1, 0, 0},
      {0, 1, 0}
    };
    
    return this.utility.multiply(projectionMatrix, vector);
  }
}
