class Utility
{

  /* Constructor definition */
  public Utility()
  {
  }

  /* Function definition */
  public PVector getAngularVector(PVector radiusVector, PVector massVector,
    PVector angleVector, PVector angularVelocityVector)
  {
    var G = 1.5f;

    var r1 = radiusVector.x;
    var r2 = radiusVector.y;

    var m1 = massVector.x;
    var m2 = massVector.y;

    var a1 = angleVector.x;
    var a2 = angleVector.y;

    var a1V = angularVelocityVector.x;
    var a2V = angularVelocityVector.y;

    var a1VSquared = pow(a1V, 2);
    var a2VSquared = pow(a2V, 2);
    var twoM1PlusM2 = 2 * m1 + m2;
    var cosA1MinusA2 = cos(a1 - a2);
    var twoSinA1MinusA2 = 2 * sin(a1 - a2);
    var cosTwoa1MinusTwoA2 = cos(2 * a1 - 2 * a2);
    var commonDenominator = twoM1PlusM2 - m2 * cosTwoa1MinusTwoA2;

    var term1 = -G * twoM1PlusM2 * sin(a1);
    var term2 = -G * m2 * sin(a1 - 2 * a2);
    var term3 = -twoSinA1MinusA2 * m2 * (a2VSquared * r2 + a1VSquared * r1 * cosA1MinusA2);
    var term4 = r1 * commonDenominator;
    var a1A = (term1 + term2 + term3) / term4;

    term1 = a1VSquared * r1 * (m1 + m2);
    term2 = G * (m1 + m2) * cos(a1);
    term3 = a2VSquared * r2 * m2 * cosA1MinusA2;
    term4 = r2 * commonDenominator;
    var a2A = twoSinA1MinusA2 * (term1 + term2 + term3) / term4;

    return new PVector(a1A, a2A);
  }
}
