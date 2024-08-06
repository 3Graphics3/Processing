class Metaball
{

  private PVector velocity;
  private PVector position;
  private float radius;

  /* Constructor definition */
  public Metaball(PVector position, float radius)
  {
    this.position = position;
    this.radius = radius;

    var phi = (1 + sqrt(5)) / 2;
    var scalar = pow(TAU, phi);
    this.velocity = PVector.random2D();
    this.velocity.mult(scalar);
  }

  /* Function definition */
  public float getRadius()
  {
    return this.radius;
  }

  public PVector getPosition()
  {
    return this.position;
  }

  public void animate()
  {
    this.checkBounds();
    this.position.add(this.velocity);
  }

  private void checkBounds()
  {
    var isOutOfBoundsX = (this.position.x >= width || 
                          this.position.x <= 0);
    if (isOutOfBoundsX)
      this.velocity.x *= -1;

    var isOutOfBoundsY = (this.position.y >= height ||
                          this.position.y <= 0);
    if (isOutOfBoundsY)
      this.velocity.y *= -1;
  }
}
