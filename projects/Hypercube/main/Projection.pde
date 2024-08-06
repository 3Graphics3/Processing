class Projection
{

  private Utility utility;

  /* Constructor definition */
  public Projection()
  {
    this.utility = new Utility();
  }

  /* Function definition */
  public P4Vector project(P4Vector vector)
  {
    var lightSource = PI;
    var pointOfView = 1 / (lightSource - vector.w);
    var projectionMatrix = new float[][] {
      {pointOfView, 0, 0, 0},
      {0, pointOfView, 0, 0},
      {0, 0, pointOfView, 0}
    };

    return this.utility.multiply(projectionMatrix, vector);
  }
}
