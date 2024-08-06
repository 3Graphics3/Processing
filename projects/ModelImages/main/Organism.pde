class Organism
{

  private PVector origin;

  private float radius;
  private float deltaRadius;
  private boolean isGrowing;

  private color bioColor;

  /* Constructor definition */
  public Organism(PVector origin, float radius,
    color bioColor)
  {
    this.origin = origin;

    this.radius = radius;
    this.deltaRadius = PI / 24;
    this.isGrowing = true;

    this.bioColor = bioColor;
  }

  /* Function definition */
  public void grow()
  {
    if (!this.isGrowing) return;
    this.radius += this.deltaRadius;
  }

  public void stopGrowth()
  {
    this.isGrowing = false;
  }

  public boolean collidesWith(Organism organism)
  {
    var pointA = organism.origin;
    var pointB = this.origin;
    var originDistance = originDistance(pointA, pointB);
    var radiiSum = (organism.radius + this.radius);

    return (radiiSum >= originDistance);
  }

  private float originDistance(PVector pointA, PVector pointB)
  {
    var distXSquared = pow(pointA.x - pointB.x, 2);
    var distYSquared = pow(pointA.y - pointB.y, 2);

    return sqrt(distXSquared + distYSquared);
  }

  public void render()
  {
    pushMatrix();
    translate(this.origin.x, this.origin.y);

    var weight = floor(2 * this.radius);
    strokeWeight(weight);
    stroke(this.bioColor, 180);
    point(0, 0);

    //noStroke();
    //fill(this.bioColor, 180);
    //circle(0, 0, 2 * this.radius);

    popMatrix();
  }
}
