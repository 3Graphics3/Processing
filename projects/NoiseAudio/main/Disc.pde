class Disc
{

  private PVector position;
  private float radius;

  private int id;
  private float time;
  private float deltaTime;

  /* Constructor definition */
  public Disc(PVector position, float radius, int id)
  {
    this.position = position;
    this.radius = radius;

    this.id = id;
    this.time = 0f;
    this.deltaTime = 0.021f;
  }

  /* Function definition */
  public void animate()
  {
    this.time += this.deltaTime;

    var scalar = pow(PI, 5.3);
    var noiseValue = noise(scalar * this.id + this.time);
    var noiseRadius = map(noiseValue, 0, 1, PI, scalar);
    this.radius = noiseRadius;
  }

  public void render()
  {
    pushMatrix();
    translate(this.position.x, this.position.y);

    var sineValue = sin(12 * this.id + this.time);
    var hue = map(sineValue, -1, 1, 0, 360);
    var brightness = map(sineValue, -1, 1, 255, 0);

    noStroke();
    fill(hue, brightness);

    /*
     * By altering between circular discs,
     * to square discs, we can produce a
     * different and unique approach to the
     * audio's appearance.
     */
    //rectMode(CENTER);
    //square(0, 0, 2 * this.radius);

    circle(0, 0, 2 * this.radius);
    popMatrix();
  }
}
