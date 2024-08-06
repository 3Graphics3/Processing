class Snowflake
{

  private PVector position;
  private PVector velocity;
  private PVector acceleration;

  private float radius;
  private float mass;

  private float angle;
  private float deltaAngle;

  private PImage pattern;

  /* Constructor definition */
  public Snowflake(PVector position,
    float radius, PImage pattern)
  {
    this.position = position;
    this.velocity = new PVector();
    this.acceleration = new PVector();

    this.radius = 1.2 * radius;
    this.mass = TAU * this.radius;

    this.angle = 0f;
    var sign = (random(1) > 0.5) ? -1 : 1;
    var factor = PI / 9;
    var scalar = factor * this.radius / this.mass;
    this.deltaAngle = scalar * sign;

    this.pattern = pattern;
  }

  /* Function definition */
  public void applyForce(PVector force)
  {
    var newForce = PVector.div(force, this.mass);
    this.acceleration.add(newForce);
  }

  public boolean isOutOfScope()
  {
    return (this.position.y > height + this.radius);
  }

  public void rePosition()
  {
    if (this.position.x < -this.radius)
      this.position.x = width + this.radius;

    if (this.position.x > width + this.radius)
      this.position.x = -this.radius;
  }

  public void animate()
  {
    this.velocity.add(this.acceleration);
    this.position.add(this.velocity);

    this.angle += this.deltaAngle;
    this.acceleration.mult(0);
  }

  public void render()
  {
    pushMatrix();
    translate(this.position.x, this.position.y);

    imageMode(CENTER);
    rotate(this.angle);
    image(this.pattern, 0, 0, this.radius, this.radius);
    popMatrix();
  }
}
