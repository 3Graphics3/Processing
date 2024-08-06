class HyperPoint
{

  private PVector position;

  private int id;
  private float hue;

  /* Constructor definition */
  public HyperPoint(PVector position, int id)
  {
    this.position = position;

    this.id = id;
    this.hue = 0f;
  }

  /* Constructor definition */
  public void animate(float time, int size)
  {
    var newHue = map(this.id, 0, size, 0, 3 * 360);
    this.hue = (newHue + time) % 360;
  }

  public void render()
  {
    pushMatrix();
    translate(this.position.x, this.position.y,
      this.position.z);

    noFill();
    stroke(this.hue, 240, 210);
    strokeWeight(3);
    point(0, 0, 0);
    popMatrix();
  }
}
