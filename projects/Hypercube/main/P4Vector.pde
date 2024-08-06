class P4Vector
{

  private float x;
  private float y;
  private float z;
  private float w;

  /* Constructor definition */
  public P4Vector(float x, float y,
    float z, float w)
  {
    this.x = x;
    this.y = y;
    this.z = z;
    this.w = w;
  }

  public P4Vector()
  {
    this.x = 0f;
    this.y = 0f;
    this.z = 0f;
    this.w = 0f;
  }

  /* Function definition */
  public void mult(float scalar)
  {
    this.x *= scalar;
    this.y *= scalar;
    this.z *= scalar;
    this.w *= scalar;
  }
}
