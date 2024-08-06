class Seed
{

  private Utility utility;
  private Seed ovary;

  private PVector position;
  private float radius;
  private float deltaRadius;

  private boolean isMoving;

  /* Constructor definition */
  public Seed(Seed ovary, PVector position, float radius)
  {
    this.utility = new Utility();
    this.ovary = ovary;

    this.position = position;
    this.radius = radius;
    this.deltaRadius = PI / 321;

    this.isMoving = true;
  }

  public Seed(PVector position, float radius)
  {
    this(null, position, radius);
    this.isMoving = false;
  }

  /* Function definition */
  public boolean collidesWith(Seed seed)
  {
    var radiiSum = this.radius + seed.radius;
    var distance = this.position.dist(seed.position);
    return (radiiSum > distance);
  }

  public boolean isTheSameWith(Seed seed)
  {
    return this == seed;
  }

  public void stopMoving()
  {
    this.isMoving = false;
  }

  public void animate()
  {
    if (this.isMoving)
    {
      var motionVector = this.utility.getMotionVector(this, this.ovary);
      this.position.add(motionVector);

      this.radius += this.deltaRadius;
    }
  }

  public void render()
  {
    pushMatrix();
    translate(this.position.x, this.position.y);

    noStroke();
    fill(120, 150, 180);
    circle(0, 0, 2 * this.radius);
    popMatrix();
  }
}
