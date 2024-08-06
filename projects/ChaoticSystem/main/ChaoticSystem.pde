class ChaoticSystem
{

  private Utility utility;

  private int pointLimit;
  private PVector params;
  private float deltaTime;
  private PVector position;

  private ArrayList<PVector> points;

  /* Constructor definition */
  public ChaoticSystem(int pointLimit)
  {
    this.utility = new Utility();

    /*
     * The following parameters correspond
     * to the factors [sigma, rho, beta]
     * - accordingly - of the differential
     * equations, that govern the system.
     * When altered, they produce interesting
     * "chaotic" results:
     *
     * --> [10, 28, 8/3]
     * --> [12.3, 33.69, PI]
     * --> [10, 33.3, 12.3]
     * --> [0.3, 29.1, PI]
     * --> [8.1, 36.9, sqrt(PI)]
     * --> [11.1, 33.6, 13/5]
     * --> [10.2, 33.3, 8/3]
     */
    var sigma = 12.3;
    var rho = 33.69;
    var beta = PI;
    this.params = new PVector(sigma, rho, beta);
    this.deltaTime = 0.009f;

    var x = PI;
    var y = TAU;
    var z = PI / 4;
    this.position = new PVector(x, y, z);

    this.pointLimit = pointLimit;
    this.points = new ArrayList<PVector>();
  }

  /* Function definition */
  public void animate()
  {
    if (this.points != null)
    {
      this.controlSystem();

      var delta = this.utility.getDeltaVector(this.position, this.params);
      delta.mult(this.deltaTime);
      this.position.add(delta);

      this.points.add(this.position.copy());
    }
  }

  private void controlSystem()
  {
    if (this.points.size() > this.pointLimit)
      this.points.clear();
  }

  public void render()
  {
    if (this.points != null)
    {
      noFill();
      for (var point : this.points)
      {
        var hue = frameCount % 360;
        stroke(hue, 255, 255, 180);
        strokeWeight(3);
        point(point.x, point.y, point.z);
      }
    }
  }
}
