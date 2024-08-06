class WeirdFractal //<>//
{

  private int currentNumber;

  private PVector currentInterval;
  private float currentMiddle;
  private ArrayList<PVector> sequence;
  private ArrayList<Circle> weirdCircles;

  private float factor;
  private float delta;
  private float deltaHue;

  /* Constructor definition */
  public WeirdFractal()
  {
    this.currentNumber = 0;

    this.beginSequence();
    this.constructHorror();

    this.factor = 0.5f;
    this.delta = 0.9f;
    this.deltaHue = 0f;
  }

  /* Function definition */
  private void beginSequence()
  {
    this.sequence = new ArrayList<PVector>();

    var start = 0;
    var end = width;
    this.currentInterval = new PVector(start, end);
    this.sequence.add(currentInterval);
  }

  private void constructHorror()
  {
    this.weirdCircles = new ArrayList<Circle>();

    var currentInterval = this.sequence.get(this.currentNumber);
    this.currentMiddle = (currentInterval.x + currentInterval.y) / 2;
    var position = new PVector(this.currentMiddle, 0);
    var radius = (currentInterval.y - currentInterval.x) / 2;

    this.weirdCircles.add(new Circle(position, radius));
  }

  public void generate()
  {
    var isNumberEven = (this.currentNumber % 2 == 0);
    var commonFactor = (this.currentInterval.x + this.currentInterval.y);

    var randomPick = (isNumberEven ? this.factor : this.factor / 2) * commonFactor;
    var nextInterval = this.pickNextInterval(randomPick);
    this.currentInterval = nextInterval;
    this.sequence.add(nextInterval);

    this.currentMiddle = (nextInterval.x + nextInterval.y) / 2;
    var position = new PVector(this.currentMiddle, 0);
    var radius = (nextInterval.y - nextInterval.x) / 2;
    this.weirdCircles.add(new Circle(position, radius));

    this.currentNumber++;
    this.deltaHue += this.delta;
  }

  private PVector pickNextInterval(float randomPick)
  {
    var start = 0f;
    var end = start;
    var commonTerm = (this.currentMiddle + this.currentInterval.y);

    if (randomPick < this.currentMiddle)
    {
      start = this.currentInterval.x + randomPick;
      end = (commonTerm + randomPick) / 2;
    } else
    {
      start = this.currentInterval.y - randomPick;
      end = commonTerm / 2;
    }

    return new PVector(start, end);
  }

  public void show()
  {
    pushMatrix();
    translate(0, height / 2);

    this.renderWeirdCircles();
    popMatrix();

    pushMatrix();
    translate(width, height / 2);
    rotate(PI);

    this.renderWeirdCircles();
    popMatrix();
  }

  private void renderWeirdCircles()
  {
    noFill();
    strokeWeight(2);

    if (this.weirdCircles != null && this.weirdCircles.size() != 0)
    {
      var originRadius = this.weirdCircles.get(0).radius;
      for (var weirdCircle : this.weirdCircles)
      {
        var distanceFromOrigin = abs(weirdCircle.position.x);
        var hue = map(distanceFromOrigin, 0, originRadius, 0, 255);
        stroke((hue + this.deltaHue) % 255, 255, 255);

        weirdCircle.show();
      }
    }
  }
}
