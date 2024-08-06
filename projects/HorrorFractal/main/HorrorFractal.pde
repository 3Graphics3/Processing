class HorrorFractal
{

  private Sequence sequence;
  private ArrayList<Circle> fractal;

  /* Constructor definition */
  public HorrorFractal()
  {
    this.sequence = new Sequence();

    this.fractal = new ArrayList<Circle>();
    this.fractal.add(new Circle());
  }

  /* Function definition */
  public void animate()
  {
    if (this.sequence.isValid())
    {
      this.sequence.updateNumbers();
      this.updateFractal();
    }

    this.sequence.updateIndex();
  }

  private void updateFractal()
  {
    var aNMinus1 = this.sequence.getPreviousTerm();
    var aN = this.sequence.getCurrentTerm();

    var posX = (aNMinus1 + aN) / 2;
    var position = new PVector(posX, 0);
    var radius = aN - aNMinus1;

    this.fractal.add(new Circle(position, radius));
  }

  public void render()
  {
    if (this.fractal != null)
    {
      pushMatrix();
      translate(0, height / 2);

      for (var term : this.fractal)
        term.render();

      popMatrix();
    }
  }
}
