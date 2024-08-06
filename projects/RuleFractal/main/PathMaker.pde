class PathMaker
{

  private int depth;
  private Grammar grammar;
  private ArrayList<Character> stringPath;

  /* Constructor definition */
  public PathMaker(int depth)
  {
    this.depth = depth;
    this.grammar = new Grammar();
    this.createStringPath();
  }

  /* Function definition */
  public ArrayList<Character> getStringPath()
  {
    return this.stringPath;
  }

  public Grammar getGrammar()
  {
    return this.grammar;
  }

  public void createStringPath()
  {
    this.stringPath = new ArrayList<Character>();

    this.stringPath.addAll(this.grammar.getAxiom());
    for (int d = 0; d < this.depth; d++)
    {
      var currentPath = new ArrayList<Character>(this.stringPath);
      var futurePath = this.getFuturePath(currentPath);

      this.stringPath.clear();
      this.stringPath.addAll(futurePath);
    }
  }

  private ArrayList<Character> getFuturePath(ArrayList<Character> currentPath)
  {
    var futurePath = new ArrayList<Character>();

    for (var variable : currentPath)
    {
      if (!this.grammar.isVariable(variable))
      {
        futurePath.add(variable);
        continue;
      }

      var rule = this.grammar.getRule(variable);
      var charRule = this.grammar.toCharacterArray(rule);
      futurePath.addAll(charRule);
    }

    return futurePath;
  }
}
