class Alphabet
{

  private ArrayList<Character> variables;
  private ArrayList<Character> constants;

  /* Constructor definition */
  public Alphabet()
  {
    this.createConstants();
    this.createVariables();
  }

  /* Function definition */
  public Character getVariable(Integer index)
  {
    return this.variables.get(index);
  }

  public ArrayList<Character> getVariables()
  {
    return this.variables;
  }

  public Character getConstant(Integer index)
  {
    return this.constants.get(index);
  }

  private void createVariables()
  {
    this.variables = new ArrayList<Character>();

    /*
     * Koch curve.
     */
    //this.variables.add('f');

    /*
     * Sierpinski triangle.
     * Dragon curve.
     */
    //this.variables.add('f');
    //this.variables.add('g');

    /*
     * Sierpinski arrowhead triangle.
     */
    this.variables.add('a');
    this.variables.add('b');
  }

  private void createConstants()
  {
    this.constants = new ArrayList<Character>();

    /*
     * Koch curve.
     * Sierpinski triangle.
     * Sierpinski arrowhead triangle.
     * Dragon curve.
     */
    this.constants.add('+');
    this.constants.add('-');
  }
}
