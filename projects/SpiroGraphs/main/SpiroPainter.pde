class SpiroPainter
{

  private int depth;
  private ArrayList<Epicycle> epicycles;

  private PathTracer pathTracer;

  /* Constructor definition */
  public SpiroPainter(int depth)
  {
    this.depth = depth;

    this.createPainter();
    this.designPainter();

    this.pathTracer = new PathTracer();
  }

  /* Function definition */
  private void createPainter()
  {
    this.epicycles = new ArrayList<Epicycle>();

    var radius = 120f;
    var position = new PVector();
    var origin = new Epicycle(radius, position);

    this.epicycles.add(origin);
  }

  private void designPainter()
  {
    var current = this.epicycles.get(0);
    for (int d = 0; d < this.depth; d++)
    {
      var maxDepthExceeded = (current.getDepth() == this.depth);
      if (maxDepthExceeded) break;

      current = current.createChild();
      this.epicycles.add(current);
    }
  }

  public void animate()
  {
    if (this.epicycles != null)
    {
      for (var epicycle : this.epicycles)
        epicycle.animate();

      var index = this.epicycles.size() - 1;
      var epicycle = this.epicycles.get(index);
      this.pathTracer.addNewPoint(epicycle.getPosition());
    }
  }

  public void render()
  {
    pushMatrix();
    translate(width / 2, height / 2);

    this.renderPainter();
    this.pathTracer.render();
    popMatrix();
  }

  private void renderPainter()
  {
    if (this.epicycles != null)
    {
      for (var epicycle : this.epicycles)
        epicycle.render();
    }
  }
}
