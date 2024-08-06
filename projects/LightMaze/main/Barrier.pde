class Barrier
{

  private PVector start;
  private PVector end;

  /* Constructor definition */
  public Barrier(PVector start, float theta, float size)
  {
    this.start = start;

    var direction = PVector.fromAngle(theta);
    var startCopy = this.start.copy();
    direction.mult(size);
    
    this.end = startCopy.add(direction);
  }

  /* Function definition */
  public void render()
  {
    noFill();
    stroke(96, 30, 120);
    strokeWeight(3);

    line(this.start.x, this.start.y,
      this.end.x, this.end.y);
  }
}
