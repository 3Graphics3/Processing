class LifeCell
{

  private PVector position;
  private float radius;

  private int state;

  /* Constructor definition */
  public LifeCell(PVector position, float radius)
  {
    this.position = position;
    this.radius = radius;

    /*
     * If you want to make the grid, more
     * compact, you can use the following
     * code:
     *
     * randomValue = random(2);
     * this.state = floor(randomValue);
     *
     * But in case you need to make the grid,
     * look more like a living organism, which
     * contains bacteria, use the following
     * code:
     *
     * randomValue = randomGaussian();
     * this.state = ceil(randomValue);
     */

    var randomValue = randomGaussian();
    this.state = ceil(randomValue);
  }

  /* Function definition */
  public boolean isAlive() {
    return (this.state == 1);
  }

  public void render()
  {
    pushMatrix();
    translate(this.position.x, this.position.y);

    /*
     * For small grid resolution, use the
     * following colorization code:
     *
     * noFill();
     * stroke(stateColor, 180);
     *
     * Otherwise, for bigger resolution grids
     * you can also use the previous code
     * along with the following one:
     *
     * noStroke();
     * fill(stateColor, 180);
     */

    var stateColor = (this.isAlive() ? color(28, 33, 53) :
      color(231, 233, 238));
    noStroke();
    fill(stateColor, 180);

    square(0, 0, this.radius);
    //circle(this.radius / 2, this.radius / 2, this.radius);

    popMatrix();
  }
}
