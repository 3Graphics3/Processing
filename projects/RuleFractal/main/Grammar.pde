class Grammar
{

  private Alphabet alphabet;
  private ArrayList<Character> axiom;
  private HashMap<Character, String> ruleSet;
  private HashMap<Character, Float> valueSet;

  /* Constructor definition */
  public Grammar()
  {
    this.alphabet = new Alphabet();
    this.createRuleSet();
    this.createValueSet();
  }

  /* Function definition */
  public String getRule(Character keyRule)
  {
    return this.ruleSet.get(keyRule);
  }

  public Float getValue(Character keyRule)
  {
    return this.valueSet.get(keyRule);
  }

  public ArrayList<Character> getAxiom()
  {
    return this.axiom;
  }

  public boolean isVariable(Character variable)
  {
    var variables = this.alphabet.getVariables();
    return variables.contains(variable);
  }

  private void createRuleSet()
  {
    this.ruleSet = new HashMap<Character, String>();
    this.axiom = new ArrayList<Character>();

    /*
     * The following rule set, consists of
     * the rules that are given below:
     *
     * 'f' --> 'f+f-f-f+f'
     * where f: move forward
     *       +: turn left(-90)
     *       -: turn right(90)
     *
     * Koch curve.
     */
    //var f = this.alphabet.getVariable(0);
    //var plus = this.alphabet.getConstant(0);
    //var minus = this.alphabet.getConstant(1);

    //this.axiom.add(f);

    //var variable = f;
    //var fPlus = f.toString() + plus;
    //var fMinus = f.toString() + minus;
    //var rule = fPlus + fMinus + fMinus + fPlus + f;
    //this.ruleSet.put(variable, rule);

    /*
     * The following rule set, consists of
     * the rules that are given below:
     *
     * 'f' --> 'f-g+f+g-f'
     * 'g' --> 'gg'
     * where f, g: move forward
     *       +: turn left(-120)
     *       -: turn right(120)
     *
     * Sierpinski triangle.
     */
    //var f = this.alphabet.getVariable(0);
    //var g = this.alphabet.getVariable(1);
    //var plus = this.alphabet.getConstant(0);
    //var minus = this.alphabet.getConstant(1);

    //var axiomString = f.toString() + minus + g + minus + g;
    //this.axiom.addAll(this.toCharacterArray(axiomString));

    //var variable = f;
    //var rule = f.toString() + minus + g + plus + f + plus + g + minus + f;
    //this.ruleSet.put(variable, rule);

    //variable = g;
    //rule = g.toString() + g;
    //this.ruleSet.put(variable, rule);

    /*
     * The following rule set, consists of
     * the rules that are given below:
     *
     * 'a' --> 'b-a-b'
     * 'b' --> 'a+b+a'
     * where a, b: move forward
     *       +: turn left(-120)
     *       -: turn right(120)
     *
     * Sierpinski arrowhead triangle.
     */
    var a = this.alphabet.getVariable(0);
    var b = this.alphabet.getVariable(1);
    var plus = this.alphabet.getConstant(0);
    var minus = this.alphabet.getConstant(1);

    this.axiom.add(a);

    var variable = a;
    var rule = b.toString() + minus + a + minus + b;
    this.ruleSet.put(variable, rule);

    variable = b;
    rule = a.toString() + plus + b + plus + a;
    this.ruleSet.put(variable, rule);

    /*
     * The following rule set, consists of
     * the rules that are given below:
     *
     * 'f' --> 'f+g'
     * 'g' --> 'f-g'
     * where f, g: move forward
     *       +: turn left(-90)
     *       -: turn right(90)
     *
     * Dragon curve.
     */
    //var f = this.alphabet.getVariable(0);
    //var g = this.alphabet.getVariable(1);
    //var plus = this.alphabet.getConstant(0);
    //var minus = this.alphabet.getConstant(1);

    //this.axiom.add(f);

    //var variable = f;
    //var rule = f.toString() + plus + g;
    //this.ruleSet.put(variable, rule);

    //variable = g;
    //rule = f.toString() + minus + g;
    //this.ruleSet.put(variable, rule);
  }

  public ArrayList<Character> toCharacterArray(String rule)
  {
    var characterArray = new ArrayList<Character>();
    for (var c = 0; c < rule.length(); c++)
      characterArray.add(rule.charAt(c));

    return characterArray;
  }

  private void createValueSet()
  {
    this.valueSet = new HashMap<Character, Float>();

    /*
     * Koch curve.
     */
    //var f = this.alphabet.getVariable(0);
    //var plus = this.alphabet.getConstant(0);
    //var minus = this.alphabet.getConstant(1);

    //this.valueSet.put(f, 3f);
    //this.valueSet.put(plus, -90f);
    //this.valueSet.put(minus, 90f);

    /*
     * Sierpinski triangle.
     */
    //var f = this.alphabet.getVariable(0);
    //var g = this.alphabet.getVariable(1);
    //var plus = this.alphabet.getConstant(0);
    //var minus = this.alphabet.getConstant(1);

    //this.valueSet.put(f, 18f);
    //this.valueSet.put(g, 18f);
    //this.valueSet.put(plus, -120f);
    //this.valueSet.put(minus, 120f);

    /*
     * Sierpinski arrowhead triangle.
     */
    var a = this.alphabet.getVariable(0);
    var b = this.alphabet.getVariable(1);
    var plus = this.alphabet.getConstant(0);
    var minus = this.alphabet.getConstant(1);

    this.valueSet.put(a, 18f);
    this.valueSet.put(b, 18f);
    this.valueSet.put(plus, -60f);
    this.valueSet.put(minus, 60f);

    /*
     * Dragon curve.
     */
    //var f = this.alphabet.getVariable(0);
    //var g = this.alphabet.getVariable(1);
    //var plus = this.alphabet.getConstant(0);
    //var minus = this.alphabet.getConstant(1);

    //this.valueSet.put(f, 18f);
    //this.valueSet.put(g, 18f);
    //this.valueSet.put(plus, -90f);
    //this.valueSet.put(minus, 90f);
  }
}
