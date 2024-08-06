class Utility
{

  /* Constructor definition */
  public Utility()
  {
  }

  /* Function definition */
  public ArrayList<Integer> toIntegerArray(String sentence)
  {
    var stringLength = sentence.length() / 7;
    var integerArray = new ArrayList<Integer>();

    for (int c = 0; c < stringLength; c++)
    {
      var letter = sentence.charAt(c);
      if (letter == '.') continue;
      integerArray.add(Character.getNumericValue(letter));
    }

    return integerArray;
  }

  public float[] getColorParams(float radius, float distance)
  {
    var a = 0.1666 * radius;
    var c = 0.72 * radius;

    var pointIsInsidePupil = (distance <= a);
    if (pointIsInsidePupil) return new float[] {2, 343, 23, 12};

    var pointIsInsideCiliary = (distance > a && distance <= c);
    if (pointIsInsideCiliary) return new float[] {3, 24, 69, 60};

    return new float[] {2, 6, 56, 20};
  }
}
