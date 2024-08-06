class Epicycle
{

  private Epicycle parent;
  private int depth;

  private float radius;
  private PVector position;

  private float angle;
  private float deltaAngle;

  private Epicycle child;

  /* Constructor definition */
  public Epicycle(Epicycle parent, int depth)
  {
    this.parent = parent;
    this.depth = depth;

    if (this.parent != null)
    {
      this.radius = 0.5 * this.parent.radius;
      this.position = new PVector();

      this.angle = 0f;

      /*
       * The following equations for the angular
       * frequency and the epicycle's rotational
       * direction, as well as for the parent-child
       * radii ratio, produce aesthetic unique designs
       * Below are given some examples in terms of
       * of [radiiRatio, angularEquation, directionEquation]:
       *
       * [0.09, this.depth / this.radius, cos(2 * this.depth + 1)]
       * [0.5, 2 * this.depth / this.radius, pow(-1, this.depth)]
       * [0.5, 21 * this.depth / pow(this.radius, 2), pow(-1, this.depth)]
       * [0.25, 9 * this.depth / pow(this.radius, 2), sin(2 * this.depth + 1)]
       * [0.25, 3 * this.depth / pow(this.radius, 1.5), sin(2 * this.depth + 1) | pow(-1, 1.5)]
       */
      var factor = TAU / (15 * this.depth);
      var equation = 21 * this.depth / pow(this.radius, 2);
      var sign = (pow(-1, this.depth) > 0 ? 1 : -1);
      equation *= factor;
      this.deltaAngle = equation * sign;
    }

    this.child = null;
  }

  public Epicycle(float radius, PVector position)
  {
    this(null, 0);

    this.radius = radius;
    this.position = position;
  }

  /* Function definition */
  public int getDepth()
  {
    return this.depth;
  }

  public PVector getPosition()
  {
    return this.position;
  }

  public Epicycle createChild()
  {
    this.child = new Epicycle(this, this.depth + 1);
    return this.child;
  }

  public void animate()
  {
    if (this.parent != null)
    {
      var newRadius = this.radius + this.parent.radius;
      var posX = newRadius * cos(this.angle);
      var posY = newRadius * sin(this.angle);
      this.position = new PVector(posX, posY);
      this.position.add(this.parent.getPosition());

      this.angle += this.deltaAngle;
    }
  }

  public void render()
  {
    pushMatrix();
    translate(this.position.x, this.position.y);

    noFill();
    stroke(180, 120, 150);
    strokeWeight(2);
    circle(0, 0, 2 * this.radius);

    popMatrix();
  }
}
