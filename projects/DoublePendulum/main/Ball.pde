class Ball
{

  private PVector position;
  private float mass;
  private float radius;

  private float deltaHue;
  private float hue;

  /* Constructor definition */
  public Ball(float mass)
  {
    this.position = new PVector();
    this.mass = mass;
    this.radius = sqrt(1.2 * TAU * this.mass);

    this.deltaHue = PI / 321;
    this.hue = 0f;
  }

  /* Function definition */
  public PVector getPosition()
  {
    return this.position;
  }

  public void animate(PVector newPosition)
  {
    this.position = newPosition.copy();
    this.hue += this.deltaHue;
  }

  public void render()
  {
    pushMatrix();
    translate(this.position.x, this.position.y);

    noStroke();
    var noiseValue = noise(this.hue);
    this.hue = map(noiseValue, 0, 1, 0, 360);
    fill(this.hue, 255, 255, 150);
    circle(0, 0, 2 * this.radius);

    popMatrix();
  }
}
