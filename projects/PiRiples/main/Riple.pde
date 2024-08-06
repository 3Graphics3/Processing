class Riple
{

  private PVector position;
  private float alpha;

  /* Constructor definition */
  public Riple(PVector position, float alpha)
  {
    this.position = position;
    this.alpha = alpha;
  }

  /* Function definition */
  public void render()
  {
    pushMatrix();
    translate(this.position.x, this.position.y);

    noFill();

    var weight = map(this.alpha, 0, 255, 9, 1);
    strokeWeight(weight);
    stroke(180, 210, 255, this.alpha);
    point(0, 0);
    popMatrix();
  }
}
