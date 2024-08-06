class CircleStruct
{

  private float scalar;
  private float approximation;

  private float angle;
  private float deltaAngle;

  private float wavePoint;
  private ArrayList<PVector> structure;

  /* Constructor definition */
  public CircleStruct(int approximation)
  {
    this.scalar = 123f;
    this.approximation = approximation;

    this.angle = 0f;
    /*
     * Increasing the deltaAngle parameter
     * actually is equivalent to reducing
     * the spacing between the points in
     * the wave pattern. Smaller values make
     * the pattern more smooth, where bigger
     * ones, make it more sharp.
     */
    this.deltaAngle = 0.21f;

    this.wavePoint = 0f;
    this.structure = new ArrayList<PVector>();
  }

  /* Function definition */
  public float getWavePoint()
  {
    return this.wavePoint;
  }

  public void animate()
  {
    this.updateStructure();
    this.angle += this.deltaAngle;
  }

  private void updateStructure()
  {
    this.structure.clear();

    var posX = 0f;
    var posY = 0f;
    for (int k = 0; k < this.approximation; k++)
    {
      var n = 2 * k + 1;
      var radius = 4 / (n * PI);
      radius *= this.scalar;

      var newAngle = TAU * n * this.angle;
      var theta = radians(newAngle);

      var currentCenter = new PVector(posX, posY, radius);
      this.structure.add(currentCenter);

      /*
       * Changing the values of the trig[X-Y]Factor
       * parameters, really produces some amazing
       * results for the wave pattern. Some great
       * sample values are given below:
       *
       * --> [cos(theta), sin(theta)]
       * --> [cos(theta) * sin(theta), sin(theta) * sin(theta)]
       * --> [cos(theta) * sin(theta / 2), sin(theta) * sin(theta / 2)]
       */
      var trigXFactor = cos(theta);
      var trigYFactor = sin(theta);
      posX += radius * trigXFactor;
      posY += radius * trigYFactor;
    }

    this.wavePoint = posY;
  }

  private void render(PVector endPoint)
  {
    var current = new PVector();
    for (int k = 0; k < this.structure.size() - 1; k++)
    {
      var previous = this.structure.get(k);

      pushMatrix();
      translate(previous.x, previous.y);

      stroke(255);
      circle(0, 0, 2 * previous.z);
      popMatrix();

      stroke(90, 120, 180);
      current = this.structure.get(k + 1);
      line(previous.x, previous.y,
        current.x, current.y);
    }

    circle(current.x, current.y, 2 * current.z);
    line(current.x, current.y, endPoint.x, endPoint.y);
  }
}
