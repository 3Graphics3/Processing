class Utility
{

  /* Constructor definition */
  public Utility()
  {
  }

  /* Function definition */
  public float getSuperRadius(float theta)
  {
    var n1 = pow(PI, 3.3);
    var n2 = pow(PI, 3.6);
    var n3 = 1.2 * TAU;

    var a = TAU;
    var b = TAU;

    var angle = theta / 3;
    var term1 = pow(abs(cos(angle) / a), n2);
    var term2 = pow(abs(sin(angle) / b), n3);

    return 1 / pow(term1 + term2, 1f / n1);
  }
}
