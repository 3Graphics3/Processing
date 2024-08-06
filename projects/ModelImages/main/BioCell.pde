class BioCell
{

  private PVector origin;
  private float radius;

  private color bioColor;

  /* Constructor definition */
  public BioCell(PVector origin, float radius,
    color bioColor)
  {
    this.origin = origin;
    this.radius = radius;

    this.bioColor = bioColor;
  }

  /* Function definition */
  public void render()
  {
    pushMatrix();
    translate(this.origin.x, this.origin.y);

    rectMode(CENTER);
    noStroke();
    fill(this.bioColor, 255);
    square(0, 0, this.radius);

    popMatrix();
  }
}
