class Sequence
{

  private int currentIndex;
  private int[] consecutiveTerms;
  private ArrayList<Integer> numbers;

  /* Constructor definition */
  public Sequence()
  {
    this.currentIndex = 0;
    this.consecutiveTerms = new int[2];

    this.numbers = new ArrayList<Integer>();
    this.numbers.add(0);
  }

  /* Function definition */
  public int getPreviousTerm()
  {
    return this.consecutiveTerms[0];
  }

  public int getCurrentTerm()
  {
    return this.consecutiveTerms[1];
  }

  public void updateNumbers()
  {
    var index = this.currentIndex - 1;
    var aNMinus1 = this.numbers.get(index);
    var deltaTerm = aNMinus1 - this.currentIndex;

    var goForward = deltaTerm < 0 || this.numbers.contains(deltaTerm);
    var aN = (goForward ? deltaTerm + 2 * this.currentIndex : deltaTerm);
    this.numbers.add(aN);

    this.consecutiveTerms[0] = aNMinus1;
    this.consecutiveTerms[1] = aN;
  }

  public void updateIndex()
  {
    this.currentIndex++;
  }

  public boolean isValid()
  {
    return this.currentIndex > 0;
  }
}
