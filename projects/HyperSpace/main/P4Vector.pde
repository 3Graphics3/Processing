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
    this(0, 0, 0, 0);
  }

  /* Function definition */
  public void extend(float scalar)
  {
    this.x *= scalar;
    this.y *= scalar;
    this.z *= scalar;
    this.w *= scalar;
  }

  public float getDistance(P4Vector vector)
  {
    var diffXSquared = pow(this.x - vector.x, 2);
    var diffYSquared = pow(this.y - vector.y, 2);
    var diffZSquared = pow(this.z - vector.z, 2);
    var diffWSquared = pow(this.w - vector.w, 2);

    return sqrt(diffXSquared + diffYSquared +
      diffZSquared + diffWSquared);
  }

  public float getLength()
  {
    var xSquared = pow(this.x, 2);
    var ySquared = pow(this.y, 2);
    var zSquared = pow(this.z, 2);
    var wSquared = pow(this.w, 2);

    return sqrt(xSquared + ySquared +
      zSquared + wSquared);
  }
}
