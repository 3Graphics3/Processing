class PiRiples
{

  private Utility utility;

  private ArrayList<Integer> number;
  private ArrayList<Riple> riples;

  private float phase;
  private float deltaPhase;

  /* Constructor definition */
  public PiRiples(String digitString)
  {
    this.utility = new Utility();

    this.number = new ArrayList<Integer>();
    this.number.addAll(this.utility.toIntegerArray(digitString));
    this.riples = new ArrayList<Riple>();

    this.phase = 0f;
    this.deltaPhase = PI / 123;
  }

  /* Function definition */
  public void animate()
  {
    this.createPiRiples();
    this.phase += this.deltaPhase;
  }

  private void createPiRiples()
  {
    var theta = 0f;
    var scalar = pow(PI, 3.3);
    var modulus = pow(PI, 2);

    var posX = 0.5 * width;
    var posY = 0.5 * height;
    var origin = new PVector(posX, posY);
    for (var digit : this.number)
    {
      var deltaTheta = radians(digit);
      theta += deltaTheta;

      var radius = (digit + this.phase) % modulus;
      radius *= scalar;

      /*
       * The following parametrix equations for
       * the variables, [trigXFactor, trigYFactor],
       * produce some really beautiful riple
       * effects along with the digits of pi!
       * Some examples are given below:
       *
       * --> [sin(PI / 2), same]
       * --> [sin(theta / 2), same]
       * --> [sin(4 * theta), same]
       * --> [sin(theta / digit), same]
       * --> [sin(digit * theta), cos(digit * theta)]
       * --> [sin(digit / 2 * theta), same]
       */
      var n = 1f/2;
      var trigXFactor = sin(theta * digit * n);
      var trigYFactor = cos(theta * digit * n);
      posX = cos(theta) * trigXFactor;
      posY = sin(theta) * trigYFactor;
      var position = new PVector(posX, posY);
      position.mult(radius);

      var distance = PVector.sub(position, origin);
      var noiseValue = noise(distance.mag());
      var alpha = map(noiseValue, 0, 1, 0, 255);

      this.riples.add(new Riple(position, alpha));
    }
  }

  public void render()
  {
    if (this.riples != null)
    {
      pushMatrix();
      translate(width / 2, height / 2);

      for (var riple : this.riples)
        riple.render();

      this.riples.clear();
      popMatrix();
    }
  }
}
