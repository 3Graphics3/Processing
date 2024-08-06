class Leaf
{

  private PVector position;

  private float hue;
  private float deltaHue;

  /* Constructor definition */
  public Leaf(PVector position, float hue)
  {
    this.position = position;

    this.hue = hue;
    var phi = (1 + sqrt(5)) / 2;
    this.deltaHue = pow(PI, phi);
  }

  /* Function definition */
  public void animate()
  {
    this.hue += this.deltaHue;
    
    /*
     * Varying the modulus of the
     * hue, produces different and
     * interesting colorizations for
     * the flower. Some example
     * values, are given below:
     *
     * --> 360
     * --> 255
     */
    var modulus = 255;
    this.hue %= modulus;
  }

  public void render()
  {
    pushMatrix();
    translate(this.position.x, this.position.y);

    noFill();
    var weight = pow(this.hue, 0.42);
    strokeWeight(weight);
    stroke(this.hue, 255, 180);
    point(0, 0);

    popMatrix();
  }
}
