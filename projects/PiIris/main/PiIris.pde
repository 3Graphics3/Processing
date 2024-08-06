class PiIris
{

  private Utility utility;

  private float radius;
  private ArrayList<Integer> number;
  private ArrayList<PVector> table;

  private int currentIndex;

  /* Constructor definition */
  public PiIris(String digitString, float radius)
  {
    this.utility = new Utility();

    this.radius = radius;
    this.number = new ArrayList<Integer>();
    this.number.addAll(this.utility.toIntegerArray(digitString));

    this.table = new ArrayList<PVector>();
    this.currentIndex = 0;
  }

  /* Function definition */
  public void animate()
  {
    for (int p = 0; p < 99; p++)
    {
      if (this.currentIndex < this.number.size() - 2)
      {
        var delta = randomGaussian();
        this.addNewPoint(this.currentIndex, delta);
        this.addNewPoint(this.currentIndex + 1, delta);

        this.currentIndex += 2;
      }
    }
  }

  private void addNewPoint(int index, float delta)
  {
    var digit = this.number.get(index) + delta;
    var theta = map(digit, 0, 9, 0, TAU);

    /*
     * The following parametrix equations for
     * the variables, [trigXFactor, trigYFactor],
     * produce some really beautiful iris patterns,
     * along with the digits of pi! Some examples
     * are given below:
     *
     * --> [sin(PI / 2), same]
     * --> [sin(theta / 2), same]
     * --> [sin(2 * theta), same]
     * --> [sin(n * theta), same], where n (e) [0, 9]
     * --> [sin(n * theta) * sin(-n * theta), same], where n (e) [0, 6]
     */
    var n = 3;
    var trigXFactor = sin(n * theta) * sin(-n * theta);
    var trigYFactor = sin(n * theta) * sin(-n * theta);

    var posX = cos(theta) * trigXFactor;
    var posY = sin(theta) * trigYFactor;
    var position = new PVector(posX, posY);
    position.mult(this.radius);

    this.table.add(position);
  }

  public void render()
  {
    pushMatrix();
    translate(width / 2, height / 2);

    noFill();
    this.renderOutline();
    this.renderIris();
    popMatrix();
  }

  private void renderOutline()
  {
    strokeWeight(2);
    stroke(6, 56, 20);
    circle(0, 0, 2 * this.radius);
  }

  private void renderIris()
  {
    if (this.table != null)
    {
      for (int d = 0; d < this.table.size() - 1; d++)
      {
        var start = this.table.get(d);
        var end = this.table.get(d + 1);

        var middle = start.copy().add(end).mult(0.5);
        var distance = dist(middle.x, middle.y, 0, 0);

        var colorParams = this.utility.getColorParams(this.radius, distance);

        var w = colorParams[0];
        var h = colorParams[1];
        var s = colorParams[2];
        var b = colorParams[3];

        strokeWeight(w);
        stroke(h, s, b);
        //strokeWeight(2);
        //stroke(255, 255, 180);
        point(middle.x, middle.y);
      }
    }
  }
}
