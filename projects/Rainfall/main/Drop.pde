class Drop
{

  private float size;
  private float mass;

  private float angle;
  private PVector direction;

  private PVector start;
  private PVector end;

  private PVector velocity;
  private PVector acceleration;

  /* Constructor definition */
  public Drop(float size, PVector start, float angle)
  {
    this.size = size;
    this.mass = PI * pow(size, 1.2);

    this.angle = angle;
    this.direction = PVector.fromAngle(this.angle);
    this.direction.normalize();
    this.direction.mult(this.size);

    this.start = start;
    this.end = this.start.copy().add(this.direction);

    this.velocity = new PVector();
    this.acceleration = new PVector();
  }

  /* Function definition */
  public float getAngle()
  {
    return this.angle;
  }

  public float getMass()
  {
    return this.mass;
  }

  public boolean hasSplashed()
  {
    return this.end.y > height;
  }

  public void applyForce(PVector force)
  {
    var newForce = PVector.div(force, this.mass);
    this.start.add(newForce);
  }

  public void animate()
  {
    this.velocity.add(this.acceleration);
    this.start.add(this.velocity);
    this.end = this.start.copy().add(this.direction);

    this.acceleration.mult(0);
  }

  public void render()
  {
    var noiseValue = noise(this.mass);
    var alpha = map(noiseValue, 0, 1, 255, 0);
    var weight = map(noiseValue, 0, 1, 3, 1);

    noFill();
    stroke(203, 44, 68, alpha);
    strokeWeight(weight);

    line(this.start.x, this.start.y,
      this.end.x, this.end.y);
  }
}
