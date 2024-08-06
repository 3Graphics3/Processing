class PhiWalker
{

  private Utility utility;

  private ArrayList<Integer> digitPath;
  private ArrayList<PVector> path;

  /* Constructor definition */
  public PhiWalker(String digitString)
  {
    this.utility = new Utility();

    this.digitPath = new ArrayList<Integer>();
    this.digitPath.addAll(this.utility.toIntegerArray(digitString));
    this.createPhiPath();
  }

  /* Function definition */
  private void createPhiPath()
  {
    this.path = new ArrayList<PVector>();

    var posX = width / 2 - width / 6;
    var posY = height / 2 - height / 6;
    var position = new PVector(posX, posY);
    var theta = 0f;
    var scalar = pow(PI, 1.8);
    for (var digit : this.digitPath)
    {
      this.path.add(position);

      var deltaTheta = map(digit, 0, 9, 0, TAU);
      theta += deltaTheta;

      var step = PVector.fromAngle(theta);
      step.normalize();
      step.mult(scalar);

      var positionCopy = position.copy();
      positionCopy.add(step);
      position = positionCopy;
    }
  }

  public void render()
  {
    if (this.path != null)
    {
      noFill();
      strokeWeight(2);

      var posX = width / 2;
      var posY = height / 2;
      var origin = new PVector(posX, posY);
      for (int p = 0; p < this.path.size() - 1; p++)
      {
        var previous = this.path.get(p);
        var next = this.path.get(p + 1);

        var distance = PVector.sub(previous, origin);
        var noiseValue = sin(distance.mag());
        var hue = map(noiseValue, -1, 1, 0, 360);
        stroke(hue, 255, 255);
        line(previous.x, previous.y, next.x, next.y);
      }
    }
  }
}
