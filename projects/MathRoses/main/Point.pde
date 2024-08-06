class Point
{

  private PVector position;
  private float hue;

  /* Constructor definition */
  public Point(PVector position, float hue)
  {
    this.position = position;
    this.hue = hue;
  }

  /* Function definition */
  public void render()
  {
    pushMatrix();
    translate(this.position.x, this.position.y);

    noFill();
    strokeWeight(2);
    stroke(hue, 255, 255);
    point(0, 0);

    popMatrix();
  }
}
