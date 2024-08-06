class TimeTable
{

  private int totalPoints;
  private ArrayList<PVector> timePoints;

  private float time;
  private float deltaTime;

  /* Constructor definition */
  public TimeTable(int totalPoints)
  {
    this.totalPoints = totalPoints;
    this.createTimePoints();

    this.time = 0;
    this.deltaTime = PI / 123;
  }

  /* Function definition */
  private void createTimePoints()
  {
    this.timePoints = new ArrayList<PVector>();

    var radius = 369f;
    var deltaAngle = TAU / this.totalPoints;
    for (float angle = 0; angle < TAU; angle += deltaAngle)
    {
      var posX = cos(angle + PI);
      var posY = sin(angle + PI);
      var position = new PVector(posX, posY);
      position.mult(radius);

      this.timePoints.add(position);
    }
  }

  public void animate()
  {
    this.time += this.deltaTime;
  }

  public void render()
  {
    if (this.timePoints != null)
    {
      pushMatrix();
      translate(width / 2, height / 2);

      this.renderTable();
      this.renderConnections();
      popMatrix();
    }
  }

  private void renderTable()
  {
    stroke(120, 180, 210);

    for (var point : this.timePoints)
    {
      pushMatrix();
      translate(point.x, point.y);

      strokeWeight(9);
      point(0, 0);
      popMatrix();
    }
  }

  private void renderConnections()
  {
    strokeWeight(1);

    var noiseValue = sin(this.time);
    var hue = map(noiseValue, -1, 1, 0, 360);
    stroke(hue, 180, 210);

    for (int p = 0; p < this.timePoints.size(); p++)
    {
      var start = this.timePoints.get(p);

      /*
       * Interesting patterns arrise, when
       * we replace the value of the equation
       * variable, with the following expressions:
       *
       * --> p % this.time
       * --> p * this.time
       */
      var equation = p * this.time;
      var endIndex = (int)equation % this.totalPoints;
      var end = this.timePoints.get(endIndex);

      line(start.x, start.y, end.x, end.y);
    }
  }
}
