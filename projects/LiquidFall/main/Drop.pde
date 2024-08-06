class Drop
{

  private PVector position;
  private PVector velocity;
  private PVector acceleration;

  private PVector dimension;
  private float mass;

  /* Constructor definition */
  public Drop(PVector position, PVector dimension)
  {
    this.position = position;
    this.velocity = new PVector(0, 0);
    this.acceleration = new PVector(0, 0);
    
    this.dimension = dimension;
    this.mass = this.dimension.x * this.dimension.y;
  }

  /* Function definition */
  public void applyForce(PVector outerForce)
  {
    var force = PVector.div(outerForce, this.mass);
    this.acceleration.add(force);
  }

  public void fall()
  {
    this.velocity.add(this.acceleration);
    this.position.add(this.velocity);

    this.acceleration.mult(0);
  }

  public void checkBounds()
  {
    if (this.position.y > height - groundY)
      this.position.y = height - groundY;
  }

  public void show()
  {
    stroke(30);
    fill(this.dimension.x, 99, this.dimension.y, 120);

    rect(this.position.x, this.position.y,
         this.dimension.x, this.dimension.y);
  }
  
}
