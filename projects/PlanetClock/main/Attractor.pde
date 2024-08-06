class Attractor
{

  protected PVector position;
  protected float radius;
  protected float mass;

  /* Constructor definition */
  public Attractor(PVector position, float radius)
  {
    this.position = position;
    this.radius = radius;
    this.mass = PI * pow(this.radius, 1.2);
  }

  /* Function definition */
  public void show()
  {
    pushMatrix();
    translate(this.position.x, this.position.y);

    noFill();
    stroke(this.mass, 255, 255, 180);
    strokeWeight(11);
    circle(0, 0, 2 * this.radius);
    popMatrix();
  }
  
}
