class HyperCube
{

  private P4Vector[] originPoints;
  private P4Vector[] projectedCube;

  private float theta;
  private float deltaTheta;
  private float radius;

  /* Constructor definition */
  public HyperCube(P4Vector[] originPoints, float radius)
  {
    this.originPoints = originPoints;
    this.projectedCube = new P4Vector[this.originPoints.length];

    this.theta = 0f;
    this.deltaTheta = PI / 321;
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

        var rotatedPoint = rotation.rotateAround(originPoint, theta, "xy");
        //rotatedPoint = rotation.rotateAround(rotatedPoint, theta, "xz");
        //rotatedPoint = rotation.rotateAround(rotatedPoint, theta, "xw");
        //rotatedPoint = rotation.rotateAround(rotatedPoint, theta, "yz");
        //rotatedPoint = rotation.rotateAround(rotatedPoint, theta, "yw");
        rotatedPoint = rotation.rotateAround(rotatedPoint, theta, "zw");
        rotatedPoint = rotation.rotateAround(rotatedPoint, PI / 4, "x");

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
      point(originPoint.x, originPoint.y, originPoint.z);
  }

  private void renderConnections()
  {
    for (int p = 0; p < this.projectedCube.length / 2; p++)
    {
      this.connect(p, (p + 1) % 4 + (p >= 4 ? 4 : 0));
      this.connect(p % 4, (p % 4) + 4);
      this.connect(p + 8, (p + 1) % 4 + (p >= 4 ? 4 : 0) + 8);
      this.connect(p % 4 + 8, (p % 4) + 12);
      this.connect(p, p + 8);
    }
  }

  private void connect(int a, int b)
  {
    var previous = this.projectedCube[a];
    var next = this.projectedCube[b];

    stroke(115, 147, 179, 180);
    strokeWeight(3);
    line(previous.x, previous.y, previous.z,
      next.x, next.y, next.z);
  }
}
