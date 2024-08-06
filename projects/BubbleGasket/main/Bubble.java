class Bubble
{

  private Complex center;

  private float bend;
  private float radius;

  private float deltaPrimeHue;
  private float deltaHue;

  /* Constructor definition */
  public Bubble(Complex center, float bend)
  {
    this.center = center;

    this.bend = bend;
    if (this.bend == 0f) return;
    this.radius = abs(1 / this.bend);

    this.deltaPrimeHue = 0.015;
    this.deltaHue = 0f;
  }

  /* Function definition */
  public boolean isTangentTo(Bubble other)
  {
    var epsilon = 0.0001f;

    var radiiSum = this.radius + other.radius;
    var centerDistance = this.centerDistance(other);
    var isExternallyTangential = (abs(radiiSum - centerDistance) < epsilon);

    var radiiDif = abs(this.radius - other.radius);
    var isInternallyTangential = (abs(radiiDif - centerDistance) < epsilon);

    return isExternallyTangential || isInternallyTangential;
  }

  private float centerDistance(Bubble other)
  {
    var distXSquared = pow((float)(this.center.re() - other.center.re()), 2);
    var distYSquared = pow((float)(this.center.im() - other.center.im()), 2);

    return sqrt(distXSquared + distYSquared);
  }

  public void animate()
  {
    this.deltaHue += this.deltaPrimeHue;
  }

  public void render()
  {
    pushMatrix();
    translate((float)this.center.re(),
      (float)this.center.im());

    var hueValue = map(sin(this.deltaHue / this.radius), -1, 1, 0, 255);

    noFill();
    stroke(hueValue, 255, 210);

    //noStroke();
    //fill(hueValue, 255, 210);

    /*
     * Placing the squares | the circles alone,
     * or simultaneously both, produces a beautiful
     * effect nevertheless!
     */
    //circle(0, 0, 2 * this.radius);
    square(-this.radius, -this.radius, 2 * this.radius);

    popMatrix();
  }
}
