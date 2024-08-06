class Superstar
{

  private Utility utility;

  private PVector origin;
  private PVector[] superShape;

  /* Constructor defintion */
  public Superstar(PVector origin,
    float angleFactor, int resolution)
  {
    this.utility = new Utility();

    this.origin = origin;
    this.superShape = new PVector[resolution];
    
    this.createSuperShape(angleFactor);
  }

  /* Function definition */
  private void createSuperShape(float angleFactor)
  {
    var size = this.superShape.length;
    var scalar = pow(PI, 3.6);
    for (int p = 0; p < size; p++)
    {
      var angle = map(p, 0, size, 0, TAU);

      /*
       * Changing the values of the trig[X-Y]Factor
       * parameter, produces some really beautiful
       * superShapes! Some examples, are given below:
       *
       * --> [1, same]
       * --> [cos(newTheta), same]
       */
      var newTheta = 0.12 * angle * angleFactor;
      var radius = this.utility.getSuperRadius(newTheta);

      var trigXFactor = 1;
      var trigYFactor = 1;
      var posX = radius * cos(angle) * trigXFactor;
      var posY = radius * sin(angle) * trigYFactor;
      var superPoint = new PVector(posX, posY);
      superPoint.mult(scalar);

      this.superShape[p] = superPoint;
    }
  }

  public void render()
  {
    pushMatrix();
    translate(this.origin.x, this.origin.y);

    this.renderSuperPoints();
    popMatrix();
  }

  private void renderSuperPoints()
  {
    var size = this.superShape.length;
    for (int p = 0; p < size; p++)
    {
      var superPoint = this.superShape[p];

      var angle = map(p, 0, size, 0, TAU);
      var superRadius = this.utility.getSuperRadius(angle);

      var noiseValue = noise(superRadius + PI * p);
      var hue = map(noiseValue, 0, 1, 0, 360);
      stroke(hue, 255, 180);
      strokeWeight(5);
      point(superPoint.x, superPoint.y);
    }
  }
}
