class HyperSpace
{

  private float theta;
  private float deltaTheta;

  private ArrayList<P4Vector> hyperPoints;

  /* Constructor definition */
  public HyperSpace()
  {
    this.theta = 0f;
    this.deltaTheta = PI / 321;

    this.hyperPoints = new ArrayList<P4Vector>();
  }

  /* Function definition */
  public void animate()
  {
    if (this.hyperPoints != null)
    {
      this.createHyperPoints();
      this.theta += this.deltaTheta;
    }
  }

  private void createHyperPoints()
  {
    var projection = new Projection();
    var rotation = new Rotation();

    var delta = 0.15;
    var radius = 240f;
    for (float t = 0; t < TAU; t += delta)
    {
      for (float u = -PI / 2; u < PI / 2; u += delta)
      {
        for (float v = -PI / 2; v < PI / 2; v += delta)
        {
          /*
           * Parametrizing the following trigonometric
           * equations with the factor[X, Y, Z, W] vectors
           * below, produce some really interesting results!
           * In the examples below, the format, is of the
           * form [factorX, factorY, factorZ, factorW]:
           *
           * --> [(1, 1, 1), same, same, same]
           * --> [(1, 1, 1), (2, 1, 1), (3, 1, 1), (6, 1, 1)]
           * --> [(1, 1, 1), (1, 2, 1), (1, 3, 1), (1, 1, 1)]
           * --> [(1, 1, 1), (1, 1, [2 | 3]), (1, 1, 1), (1, 1, 1)]
           * --> [(1, 1, 1), (1, 2, 1), (3, 1, 1), (1, 1, 1)]
           * --> [(1, PI, 1), (1, PI, 1), (1, PI, 1), (1, 1, 1)]
           * --> [(1, PI, 1), (PI, PI, PI), (1, PI, 1), (1, 1, 1)]
           * --> [(1f/3, 1, 1), (1, 1f/3, 1), (1, 1, 1f/3), (1, 1, 1)]
           * --> [(1f/9, 1, 1f/9), (1, 1, 1), (1f/9, 1, 1f/9), (1, 1, 1)]
           */

          //var k = 9;
          var factorX = new PVector(1, 1, 1);
          var factorY = new PVector(1, 1, 3);
          var factorZ = new PVector(1, 1, 1);
          var factorW = new PVector(1, 1, 1);

          var x = cos(t * factorX.x) * cos(u * factorX.y) * cos(v * factorX.z);
          var y = sin(t * factorY.x) * cos(u * factorY.y) * cos(v * factorY.z);
          var z = sin(u * factorZ.x) * cos(v * factorZ.y);
          var w = sin(v * factorW.x);
          var position = new P4Vector(x, y, z, w);
          position.extend(radius);

          var params = new PVector(t, u, v);

          //var rotated = rotation.rotateAround(position, this.theta, "xy");
          //rotated = rotation.rotateAround(rotated, theta, "zw");
          //rotated = rotation.rotateAround(rotated, PI / 4, "x");
          //var projected = projection.project(rotated, params);
          var projected = projection.project(position, params);

          this.hyperPoints.add(projected);
        }
      }
    }
  }

  public void render()
  {
    if (this.hyperPoints != null)
    {
      noFill();
      strokeWeight(2);

      for (var hyperPoint : this.hyperPoints)
      {
        var x = 0.5 * width;
        var y = 0.5 * height;
        var z = 0.75 * (width + height);
        var origin = new P4Vector(x, y, z, z);

        var distance = hyperPoint.getDistance(origin);
        var noiseValue = noise(distance);
        var hue = map(noiseValue, 0, 1, 0, 360);
        stroke(hue, 150, 210);

        point(hyperPoint.x, hyperPoint.y, hyperPoint.z);
      }

      this.hyperPoints.clear();
    }
  }
}
