class HyperShape
{

  private HyperSpace hyperSpace;
  private ArrayList<HyperPoint> hyperShape;

  private float time;
  private float deltaTime;

  /* Constructor definition */
  public HyperShape(int resolution)
  {
    this.hyperSpace = new HyperSpace();
    this.createHyperShape(resolution);

    this.time = 0f;
    this.deltaTime = PI / 2;
  }

  /* Function definition */
  private void createHyperShape(int resolution)
  {
    this.hyperShape = new ArrayList<HyperPoint>();

    var rangeY = PI / 4;
    var rangeX = PI;
    for (int y = 0; y < resolution; y++)
    {
      var phi = map(y, 0, resolution, -rangeY, rangeY);
      for (int x = 0; x < resolution; x++)
      {
        var theta = map(x, 0, resolution, -rangeX, rangeX);

        var id = y + x * resolution;
        var angle = new PVector(theta, phi);
        var position = this.hyperSpace.getPosition(angle);

        this.hyperShape.add(new HyperPoint(position, id));
      }
    }
  }

  public void animate()
  {
    if (this.hyperShape != null)
    {
      var size = this.hyperShape.size();
      for (var hyperPoint : this.hyperShape)
        hyperPoint.animate(this.time, size);

      this.time += this.deltaTime;
    }
  }

  public void render()
  {
    if (this.hyperShape != null)
    {
      for (var hyperPoint : this.hyperShape)
        hyperPoint.render();
    }
  }
}
