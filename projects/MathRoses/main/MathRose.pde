class MathRose
{

  private int resolution;
  private ArrayList<Point> points;

  private float time;
  private float deltaTime;

  /* Constructor definition */
  public MathRose(int resolution)
  {
    this.resolution = resolution;
    this.points = new ArrayList<Point>();

    this.time = 0f;
    this.deltaTime = 0.009f;
  }

  /* Function definition */
  public void animate()
  {
    if (this.points != null)
    {
      this.points.clear();
      this.createRose();
      this.time += this.deltaTime;
    }
  }

  private void createRose()
  {
    var scalar = 300f;
    for (int p = 0; p < this.resolution; p++)
    {
      var angle = map(p, 0, this.resolution, 0, TAU);

      angle *= sqrt(this.time);
      /*
       * Changing the factor variable,
       * produces some really interesting
       * rose patterns! Some example values,
       * are given below:
       *
       * --> 1f
       * --> PI / 2
       * --> 3 * PI
       * --> 14 * PI
       * --> PI / 3
       */
      var factor = 1f;
      var radius = scalar * sin(factor * angle);

      var theta = TAU * angle;
      var posX = radius * cos(theta);
      var posY = radius * sin(theta);
      var position = new PVector(posX, posY);

      var sineValue = sin(this.time);
      var hue = map(sineValue, -1, 1, 0, 360);

      this.points.add(new Point(position, hue));
    }
  }

  public void render()
  {
    if (this.points != null)
    {
      pushMatrix();
      translate(width / 2, height / 2);

      for (var point : this.points)
        point.render();
      popMatrix();
    }
  }
}
