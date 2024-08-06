class Beam
{

  private PVector start;
  private PVector end;

  private float theta;

  /* Constructor definition */
  public Beam(PVector start, float theta)
  {
    this.start = start;
    this.theta = theta;

    var direction = PVector.fromAngle(theta);
    var startCopy = this.start.copy();
    var size = pow(PI, 1.5);
    direction.mult(size);

    this.end = startCopy.add(direction);
  }

  /* Function definition */
  public float getAngle()
  {
    return this.theta;
  }

  public PVector getIntersection(Barrier barrier)
  {
    var x1 = barrier.start.x;
    var y1 = barrier.start.y;
    var x2 = barrier.end.x;
    var y2 = barrier.end.y;

    var x3 = this.start.x;
    var y3 = this.start.y;
    var x4 = this.end.x;
    var y4 = this.end.y;

    var product0 = (x1 - x2) * (y3 - y4);
    var product1 = (y1 - y2) * (x3 - x4);
    var commonTerm = product0 - product1;
    if (commonTerm == 0) return null;

    product0 = (x1 - x3) * (y3 - y4);
    product1 = (y1 - y3) * (x3 - x4);
    var termA = product0 - product1;

    product0 = (x1 - x3) * (y1 - y2);
    product1 = (y1 - y3) * (x1 - x2);
    var termB = product0 - product1;

    var u = termA / commonTerm;
    var v = termB / commonTerm;

    var barriersCollide = (u > 0 && u < 1 && v > 0);
    if (!barriersCollide) return null;

    var posX = x1 + u * (x2 - x1);
    var posY = y1 + u * (y2 - y1);
    return new PVector(posX, posY);
  }

  public void render()
  {
    noFill();
    stroke(66, 180, 180);
    strokeWeight(2);

    line(this.start.x, this.start.y,
      this.end.x, this.end.y);
  }
}
