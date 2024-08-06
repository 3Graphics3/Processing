class SuperShape
{

  private Utility utility;
  private PVector[] superShape;

  private float theta;
  private float deltaTheta;

  /* Constructor defintion */
  public SuperShape(int numberOfPoints)
  {
    this.utility = new Utility();
    this.superShape = new PVector[numberOfPoints];

    this.theta = 0f;
    this.deltaTheta = PI / 30;
  }

  /* Function definition */
  public void animate()
  {
    this.updateSuperShape();
    this.theta += this.deltaTheta;
  }

  private void updateSuperShape()
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
       * --> [cos(sin(newTheta)), same]
       * --> [cos(sin(newTheta + TAU * angle)), same]
       */
      var newTheta = angle * this.theta;
      var radius = this.utility.getSuperRadius(newTheta);

      var trigXFactor = cos(newTheta);
      var trigYFactor = cos(newTheta);
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
    translate(width / 2, height / 2);

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

      var noiseValue = noise(superRadius);
      var hue = map(noiseValue, 0, 1, 0, 360);
      stroke(hue, 255, 180);
      strokeWeight(5);
      point(superPoint.x, superPoint.y);
    }
  }
}
