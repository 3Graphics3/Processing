class Cube
{

  private PVector[] originPoints;
  private PVector[] projectedCube;

  private float theta;
  private float deltaTheta;
  private float radius;

  /* Constructor definition */
  public Cube(PVector[] originPoints, float radius)
  {
    this.originPoints = originPoints;
    this.projectedCube = new PVector[this.originPoints.length];

    this.theta = 0f;
    this.deltaTheta = PI / 213;
    this.radius = radius;
  }

  /* Function definition */
  public void animate()
  {
    if (this.projectedCube != null)
    {
      var rotation = new Rotation();
      var projection = new Projection();

      for (int p = 0; p < this.projectedCube.length; p++)
      {
        var originPoint = this.originPoints[p];

        //var plane = "xy";
        //var rotatedPoint = rotation.rotateAround(originPoint, theta, plane);
        var plane = "xz";
        var rotatedPoint = rotation.rotateAround(originPoint, theta, plane);
        plane = "yz";
        rotatedPoint = rotation.rotateAround(rotatedPoint, theta, plane);

        var projectedPoint = projection.project(rotatedPoint);
        projectedPoint.mult(this.radius);

        this.projectedCube[p] = projectedPoint;
      }
    }

    this.theta += this.deltaTheta;
  }

  public void render()
  {
    if (this.projectedCube != null)
    {
      pushMatrix();
      translate(width / 2, height / 2);

      this.renderVertices();
      this.renderConnections();
      popMatrix();
    }
  }

  private void renderVertices()
  {
    noFill();
    stroke(255, 180);
    strokeWeight(21);

    for (var originPoint : this.projectedCube)
      point(originPoint.x, originPoint.y);
  }

  private void renderConnections()
  {
    for (int p = 0; p < this.projectedCube.length; p++)
    {
      this.connect(p, (p + 1) % 4 + (p >= 4 ? 4 : 0));
      this.connect(p % 4, (p % 4) + 4);
    }
  }

  private void connect(int a, int b)
  {
    var previous = this.projectedCube[a];
    var next = this.projectedCube[b];

    stroke(115, 147, 179, 180);
    strokeWeight(3);
    line(previous.x, previous.y, next.x, next.y);
  }
}
