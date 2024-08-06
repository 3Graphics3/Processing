class RosePoint
{

  private PVector position;
  private float hue;

  /* Constructor definition */
  public RosePoint(PVector position,
    float hue)
  {
    this.position = position;
    this.hue = hue;
  }

  /* Function definition */
  public void render()
  {
    pushMatrix();
    translate(this.position.x,
      this.position.y, this.position.z);

    noFill();
    strokeWeight(2);
    stroke(this.hue, 255, 255);

    point(0, 0, 0);
    popMatrix();
  }
}
