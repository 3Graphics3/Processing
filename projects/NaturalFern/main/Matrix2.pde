class Matrix2
{

  private float a;
  private float b;
  private float c;
  private float d;

  /* Constructor definition */
  public Matrix2(float a, float b,
    float c, float d)
  {
    this.a = a;
    this.b = b;
    this.c = c;
    this.d = d;
  }

  /* Function definition */
  public PVector multiply(PVector vector)
  {
    var posX = this.a * vector.x + this.b * vector.y;
    var posY = this.c * vector.x + this.d * vector.y;
    return new PVector(posX, posY);
  }
}
