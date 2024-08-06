class NaturalFern
{

  private Utility utility;

  private PVector currentPoint;
  private ArrayList<FernPoint> fern;

  /* Constructor definition */
  public NaturalFern()
  {
    this.utility = new Utility();

    this.currentPoint = new PVector();
    this.fern = new ArrayList<FernPoint>();
  }

  /* Function definition */
  public void animate()
  {
    var frameSpeed = 213;
    for (int s = 0; s < frameSpeed; s++)
    {
      var previous = this.currentPoint;
      this.currentPoint = this.utility.getNextPoint(previous);
      this.fern.add(new FernPoint(this.currentPoint));
    }
  }

  public void render()
  {
    if (this.fern != null)
    {
      for (var fernPoint : this.fern)
        fernPoint.render();
    }
  }
}
