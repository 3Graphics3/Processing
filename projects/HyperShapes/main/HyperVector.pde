class HyperVector
{

  private float f;

  private float a;
  private float b;

  private float n1;
  private float n2;
  private float n3;

  /* Constructor definition */
  public HyperVector(float f, float a, float b,
    float n1, float n2, float n3)
  {
    this.f = f;

    this.a = a;
    this.b = b;

    this.n1 = n1;
    this.n2 = n2;
    this.n3 = n3;
  }

  public float getSuperRadius(float angle)
  {
    var theta = this.f * angle / 3;
    var term1 = pow(abs(cos(theta) / this.a), this.n2);
    var term2 = pow(abs(sin(theta) / this.b), this.n3);

    return pow(term1 + term2, -1f / this.n1);
  }
}
