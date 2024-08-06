class Projection
{

  private Utility utility;

  /* Constructor definition */
  public Projection()
  {
    this.utility = new Utility();
  }

  /* Function definition */
  public P4Vector project(P4Vector vector, PVector params)
  {
    var t = params.x;
    var u = params.y;
    var v = params.z;

    /*
     * Parametrizing the following vectors
     * vector[X-Y-Z], of the projection matrix,
     * yield some amazing results in the hyper-
     * space! Some examples are given below:
     *
     * -> [[sin(t), cos(t | u | v), 0],
     *     [-cos(t) * sin(u), sin(t) * sin(u), cos(u)],
     *     [cos(t) * cos(u) * sin(v), -sin(t) * cos(u) * sin(v), sin(u) * [sin(v) | cos(u)]]]
     * -> [[-sin(t), cos(v), 0],
     *     [cos(t) * sin(u), sin(t) * sin(u), cos(u)],
     *     [cos(t) * cos(u) * sin(v), sin(t) * cos(u) * sin(v), sin(u) * sin(v)]]
     * -> [[sin(t), cos(t | u | v), 0],
     *     [cos(t) * sin(u), -sin(t) * sin(u), cos(u)],
     *     [cos(t) * cos(u) * sin(v), -sin(t) * cos(u) * sin(v), sin(u) * [sin(v) | cos(u)]]]
     * -> [[-sin(t), cos(v), 0],
     *     [-cos(t) * sin(u), sin(t) * sin(u), cos(u)],
     *     [cos(t) * cos(u) * sin(v), sin(t) * cos(u) * sin(v), sin(u) * sin(v)]]
     */

    var x = sin(t);
    var y = cos(v);
    var z = 0f;
    var vectorX = new PVector(x, y, z);

    x = cos(t) * sin(u);
    y = -sin(t) * sin(u);
    z = cos(u);
    var vectorY = new PVector(x, y, z);

    x = cos(t) * cos(u) * sin(v);
    y = -sin(t) * cos(u) * sin(v);
    z = sin(u) * sin(v);
    var vectorZ = new PVector(x, y, z);

    var projectionMatrix = new float[][] {
      {vectorX.x, vectorX.y, vectorX.z, 0},
      {vectorY.x, vectorY.y, vectorY.z, 0},
      {vectorZ.x, vectorZ.y, vectorZ.z, 0}
    };

    return this.utility.multiply(projectionMatrix, vector);
  }
}
