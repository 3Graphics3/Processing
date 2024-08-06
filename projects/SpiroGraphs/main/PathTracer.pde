class PathTracer
{

  private ArrayList<PVector> path;

  /* Constructor definition */
  public PathTracer()
  {
    this.path = new ArrayList<PVector>();
  }

  /* Function definition */
  public void addNewPoint(PVector point)
  {
    if (this.path != null)
      this.path.add(point);
  }

  public void render()
  {
    if (this.path != null)
    {
      noFill();
      strokeWeight(3);
      stroke(180, 150, 180);

      beginShape();
      for (var step : this.path)
        vertex(step.x, step.y);
      endShape();
    }
  }
}
