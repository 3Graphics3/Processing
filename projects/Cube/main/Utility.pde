class Utility
{

  /* Constructor definition */
  public Utility()
  {
  }

  /* Function definition */
  public PVector multiply(float[][] m1, PVector m2)
  {
    var newM2 = this.toMatrix(m2);
    var metaVector = this.multiply(m1, newM2);
    return this.toVector(metaVector);
  }

  private float[][] multiply(float[][] matrix0, float[][] matrix1)
  {
    var cols0 = matrix0[0].length;
    var rows1 = matrix1.length;
    var productIsValid = (cols0 == rows1);
    if (!productIsValid) return null;

    var rows0 = matrix0.length;
    var cols1 = matrix1[0].length;
    var metaMatrix = new float[rows0][cols1];
    for (int row = 0; row < rows0; row++)
    {
      for (int col = 0; col < cols1; col++)
      {
        var metaResult = 0f;
        for (int k = 0; k < rows1; k++)
          metaResult += matrix0[row][k] * matrix1[k][col];
        metaMatrix[row][col] = metaResult;
      }
    }

    return metaMatrix;
  }

  private float[][] toMatrix(PVector vector)
  {
    var matrix = new float[3][1];
    matrix[0][0] = vector.x;
    matrix[1][0] = vector.y;
    matrix[2][0] = vector.z;

    return matrix;
  }

  private PVector toVector(float[][] matrix)
  {
    var vector = new PVector();
    vector.x = matrix[0][0];
    vector.y = matrix[1][0];

    var hasValidLength = (matrix.length == 3);
    if (hasValidLength) vector.z = matrix[2][0];

    return vector;
  }
}
