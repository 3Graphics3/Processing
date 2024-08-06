class Drop
{

  private PVector position;
  private float radius;
  private float deltaRadius;

  private int lifeSpan;
  private int deltaLife;

  /* Constructor definition */
  public Drop(PVector position, float radius)
  {
    this.position = position;
    this.radius = radius;
    this.deltaRadius = 0.6f;

    this.lifeSpan = 255;
    this.deltaLife = 3;
  }

  /* Function definition */
  public void animate()
  {
    this.lifeSpan -= this.deltaLife;
    this.radius += this.deltaRadius;
  }

  public boolean hasVanished()
  {
    return this.lifeSpan <= 0;
  }

  public void render()
  {
    pushMatrix();
    translate(this.position.x, this.position.y);

    noStroke();
    fill(this.lifeSpan, 180);
    circle(0, 0, this.radius);

    popMatrix();
  }
}
