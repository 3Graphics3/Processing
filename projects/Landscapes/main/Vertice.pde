class Vertice
{

  private PVector origin;
  private float radius;
  private float weight;

  /* Constructor definition */
  public Vertice(PVector origin, float radius, float weight)
  {
    this.origin = origin;
    this.radius = radius;
    this.weight = weight;
  }

  /* Function definition */
  public void render()
  {
    pushMatrix();
    translate(this.origin.x, this.origin.y);

    noStroke();
    var sineValue = sin(PI * this.weight / 2);

    /*
     * The following code, achieves some really
     * interesting lively micro-organism interaction
     * or some realistic view of a thermal field:
     *
     * --> var mappedWeight = map(sineValue, -1, 1, 0, 255);
     * --> fill(mappedWeight, 255, 255, 180);
     *
     * --> var mappedWeight = map(sineValue, -1, 1, 150, 198);
     * --> fill(mappedWeight, 180, 255, 180);
     */
    var mappedWeight = map(sineValue, -1, 1, 0, 255);
    fill(mappedWeight, 255, 255, 210);
    circle(0, 0, 1.8 * this.radius);

    popMatrix();
  }
}
