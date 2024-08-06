class Circle
{

  private PVector position;
  private float radius;

  /* Constructor definition */
  public Circle(PVector position, float radius)
  {
    this.position = position;
    this.radius = radius;
  }

  public Circle()
  {
    this.position = new PVector();
    this.radius = 0f;
  }

  /* Function definition */
  public void render()
  {
    pushMatrix();
    translate(this.position.x, this.position.y);

    noFill();
    stroke(180, 90);

    circle(0, 0, this.radius);
    popMatrix();
  }
}
