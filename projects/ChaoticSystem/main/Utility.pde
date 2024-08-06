class Utility
{

  /* Constructor definition */
  public Utility() {
  }

  /* Function definition */
  public PVector getDeltaVector(PVector coords, PVector params)
  {
    var x = coords.x;
    var y = coords.y;
    var z = coords.z;

    var sigma = params.x;
    var rho = params.y;
    var beta = params.z;

    var deltaX = sigma * (y - x);
    var deltaY = x * (rho - z) - y;
    var deltaZ = x * y - beta * z;

    return new PVector(deltaX, deltaY, deltaZ);
  }
}
