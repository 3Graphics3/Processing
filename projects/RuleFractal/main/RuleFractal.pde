class RuleFractal
{

  private PathMaker pathMaker;
  private ArrayList<PVector> grammarPath;

  /* Constructor definition */
  public RuleFractal(int depth)
  {
    this.pathMaker = new PathMaker(depth);
    this.createGrammarPath();
  }

  /* Function definition */
  private void createGrammarPath()
  {
    this.grammarPath = new ArrayList<PVector>();

    var angle = 0f;
    var posX = width / 5;
    var posY = 0.93 * height;
    var position = new PVector(posX, posY);

    var stringPath = this.pathMaker.getStringPath();
    for (var character : stringPath)
    {
      var grammar = this.pathMaker.getGrammar();
      var isVariable = grammar.isVariable(character);
      var value = grammar.getValue(character);

      if (isVariable)
      {
        var theta = radians(angle);
        var motionVector = PVector.fromAngle(theta);
        motionVector.normalize();
        motionVector.mult(value);
        position.add(motionVector);

        this.grammarPath.add(position.copy());
        continue;
      }

      angle += value;
    }
  }

  public void render()
  {
    if (this.grammarPath != null)
    {
      noFill();
      stroke(300, 255);

      for (int p = 0; p < this.grammarPath.size() - 1; p++)
      {
        var previous = this.grammarPath.get(p);
        var next = this.grammarPath.get(p + 1);

        line(previous.x, previous.y,
          next.x, next.y);
      }
    }
  }
}
