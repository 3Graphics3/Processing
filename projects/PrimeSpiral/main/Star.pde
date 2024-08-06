class Star
{

  private PVector position;
  private float alpha;

  /* Constructor definition */
  public Star(PVector position, float alpha)
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
    stroke(180, 255, 210, this.alpha);
    rectMode(CENTER);
    square(0, 0, 3);

    popMatrix();
  }
}
