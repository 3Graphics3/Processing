class ConstMatrix
{

  private Matrix2 const0;
  private PVector const1;

  /* Constructor definition */
  public ConstMatrix(Matrix2 const0, PVector const1)
  {
    this.const0 = const0;
    this.const1 = const1;
  }

  /* Function definition */
  public PVector transform(PVector vector)
  {
    var productMatrix = this.const0.multiply(vector);
    return productMatrix.add(this.const1);
  }
}
