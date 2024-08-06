class Star
{

  private PVector position;

  private float hue;
  private float deltaHue;

  /* Constructor definition */
  public Star(PVector position)
  {
    this.position = position;

    this.hue = 0f;
    this.deltaHue = PI / 123;
  }

  /* Function definition */
  public void animate()
  {
    this.hue += this.deltaHue;
  }

  public void render()
  {
    pushMatrix();
    translate(position.x, position.y, position.z);

    var noiseValue = noise(this.hue);
    var weight = map(noiseValue, 0, 1, 12, 1);
    strokeWeight(weight);

    noiseValue = noise(this.hue + PI);
    var alpha = map(noiseValue, 0, 1, 0, 255);
    stroke(255, 234, 0, alpha);
    point(0, 0, 0);

    popMatrix();
  }
}
