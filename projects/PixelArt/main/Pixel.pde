class Pixel {

  private PVector position;
  private float radius;

  private int state;

  /* Constructor definition */
  public Pixel(PVector position, float radius, int state)
  {
    this.position = position;
    this.radius = radius;

    this.state = state;
  }

  /* Function definition */
  public void render()
  {
    pushMatrix();
    translate(this.position.x, this.position.y);

    noStroke();
    var stateColor = (this.isAlive() ? color(0, 32, 63) :
      color(173, 239, 209));
    fill(stateColor, 180);

    square(0, 0, this.radius);
    popMatrix();
  }

  private boolean isAlive() {
    return (this.state == 1);
  }
}
