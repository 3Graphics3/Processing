class Utility
{

  /* Constructor definition */
  public Utility()
  {
  }

  /* Function definition */
  public P4Vector multiply(float[][] m1, P4Vector m2)
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

  private float[][] toMatrix(P4Vector vector)
  {
    var matrix = new float[4][1];
    matrix[0][0] = vector.x;
    matrix[1][0] = vector.y;
    matrix[2][0] = vector.z;
    matrix[3][0] = vector.w;

    return matrix;
  }

  private P4Vector toVector(float[][] matrix)
  {
    var vector = new P4Vector();
    vector.x = matrix[0][0];
    vector.y = matrix[1][0];
    vector.z = matrix[2][0];

    var hasValidLength = (matrix.length == 4);
    if (hasValidLength) vector.w = matrix[3][0];

    return vector;
  }
}
