class PrimeSpiral
{

  private Utility utility;

  private int currentNumber;
  private ArrayList<Star> spiral;

  /* Constructor definition */
  public PrimeSpiral()
  {
    this.utility = new Utility();

    this.currentNumber = 0;
    this.spiral = new ArrayList<Star>();
  }

  /* Function definition */
  public void animate()
  {
    if (this.spiral != null)
    {
      for (int t = 0; t < 180; t++)
      {
        if (this.utility.isPrime(this.currentNumber))
          this.addNewStar();

        this.currentNumber++;
      }
    }
  }

  private void addNewStar()
  {
    var radius = PI / (1.5 * 321);

    var theta = this.currentNumber;
    var posX = theta * cos(theta);
    var posY = theta * sin(theta);
    var position = new PVector(posX, posY);
    position.mult(radius);

    posX = width / 2;
    posY = height / 2;
    var origin = new PVector(posX, posY);
    var distance = PVector.sub(position, origin);
    var noiseValue = sin(distance.mag());
    var alpha = map(noiseValue, -1, 1, 255, 0);

    this.spiral.add(new Star(position, alpha));
  }

  public void render()
  {
    if (this.spiral != null)
    {
      pushMatrix();
      translate(width / 2, height / 2);

      for (var star : this.spiral)
        star.render();
      popMatrix();
    }
  }
}
