class LightMaze
{

  private int totalBarriers;

  private ArrayList<Barrier> barriers;
  private LightBulb lightBulb;

  /* Constructor definition */
  public LightMaze(int totalBarriers, int totalBeams)
  {
    this.totalBarriers = totalBarriers;

    this.barriers = new ArrayList<Barrier>();
    this.constructOuterBarriers();
    this.constructInnerBarriers();

    this.createLightBulb(totalBeams);
  }

  /* Function definition */
  private void createLightBulb(int totalBeams)
  {
    var posX = random(width);
    var posY = random(height);
    var position = new PVector(posX, posY);
    var radius = TAU;

    this.lightBulb = new LightBulb(position, radius, totalBeams);
  }

  private void constructOuterBarriers()
  {
    var scalar = width;

    var start = new PVector();
    var angle = 0f;
    this.barriers.add(new Barrier(start, angle, scalar));

    var posX = width;
    var posY = 0;
    start = new PVector(posX, posY);
    angle = PI / 2;
    this.barriers.add(new Barrier(start, angle, scalar));

    posY = height;
    start = new PVector(posX, posY);
    angle = PI;
    this.barriers.add(new Barrier(start, angle, scalar));

    posX = 0;
    start = new PVector(posX, posY);
    angle = 3 * PI / 2;
    this.barriers.add(new Barrier(start, angle, scalar));
  }

  private void constructInnerBarriers()
  {
    for (int b = 0; b < this.totalBarriers; b++)
    {
      var posX = random(0.12 * width, 0.9 * width);
      var posY = random(0.12 * height, 0.9 * height);
      var start = new PVector(posX, posY);
      var angle = random(TAU);
      var scalar = random(72, 117);

      this.barriers.add(new Barrier(start, angle, scalar));
    }
  }

  public void animate()
  {
    this.lightBulb.animate(this.barriers);
  }

  public void render()
  {
    this.renderBarriers();
    this.lightBulb.render();
  }

  private void renderBarriers()
  {
    if (this.barriers != null)
    {
      for (var barrier : this.barriers)
        barrier.render();
    }
  }
}
