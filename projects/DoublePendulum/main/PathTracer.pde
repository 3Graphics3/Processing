class PathTracer
{

  private PVector position;

  private ArrayList<PVector> path;
  private PGraphics pathTracer;

  private ChaoticPendulum system;

  /* Constructor definition */
  public PathTracer(PVector position, ChaoticPendulum system)
  {
    this.position = position;
    this.path = new ArrayList<PVector>();
    this.pathTracer = createGraphics(width, height);

    this.system = system;
  }

  /* Function definition */
  public PGraphics getTracer()
  {
    return this.pathTracer;
  }

  public void update()
  {
    var pendulum = this.system.getBottomPendulum();
    var ball = pendulum.getBall();
    this.path.add(ball.getPosition());
  }

  public void render()
  {
    this.pathTracer.beginDraw();
    this.pathTracer.translate(this.position.x, this.position.y);
    this.renderPath();

    this.pathTracer.endDraw();
  }

  private void renderPath()
  {
    if (this.path != null)
    {
      this.pathTracer.strokeWeight(3);
      for (var pathPoint : this.path)
      {
        var hue = map(noise(pathPoint.x), 0, 1, 0, 360);
        this.pathTracer.stroke(hue, 255, 255, 150);
        this.pathTracer.point(pathPoint.x, pathPoint.y);
      }
    }
  }
}
