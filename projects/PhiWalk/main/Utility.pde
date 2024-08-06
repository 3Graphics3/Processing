class Utility
{

  /* Constructor definition */
  public Utility()
  {
  }

  /* Function definition */
  public ArrayList<Integer> toIntegerArray(String sentence)
  {
    var stringLength = sentence.length();
    var integerArray = new ArrayList<Integer>();

    for (int c = 0; c < stringLength; c++)
    {
      var letter = sentence.charAt(c);
      if (letter == '.') continue;
      integerArray.add(Character.getNumericValue(letter));
    }

    return integerArray;
  }
}
