class Cell
{

  private PVector position;
  private float radius;

  private int state;

  /* Constructor definition */
  public Cell(PVector position, float radius)
  {
    this.position = position;
    this.radius = radius;

    this.state = 0;
  }

  /* Function definition */
  public boolean isAlive()
  {
    return (this.state == 1);
  }

  public void render()
  {
    pushMatrix();
    translate(this.position.x, this.position.y);

    var posX = width / 2;
    var posY = height / 2;
    var center = new PVector(posX, posY);

    var distance = PVector.sub(this.position, center);
    var magnitude = distance.mag();

    var noiseValue = noise(this.state * magnitude);
    var stateColor = map(noiseValue, 0, 1, 0, 360);
    var alpha = map(noiseValue, 0, 1, 0, 255);
    fill(stateColor, alpha);

    square(0, 0, 2 * this.radius);
    popMatrix();
  }
}
