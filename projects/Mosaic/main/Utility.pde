class Utility
{

  /* Constructor definition */
  public Utility()
  {
  }

  /* Function definition */
  public float[][] toFloatMatrix(PVector[] vectorMatrix)
  {
    var floatMatrix = new float[vectorMatrix.length][2];

    for (int s = 0; s < vectorMatrix.length; s++)
    {
      var seed = vectorMatrix[s];

      floatMatrix[s][0] = seed.x;
      floatMatrix[s][1] = seed.y;
    }

    return floatMatrix;
  }
}
