class Utility
{

  /* Constructor definition */
  public Utility()
  {
  }

  /* Function definition */
  private Bubble findKissingBubble(Bubble b0, Bubble b1)
  {
    var r0 = b0.radius;
    var r1 = b1.radius;

    var deltaR01 = abs(r0 - r1);
    var r2 = deltaR01;
    var k2 = 1 / r2;

    var radiusPr02 = r0 * r2;
    var cX = (float)b0.center.re() + (2 * radiusPr02) / deltaR01 - (r0 + r2);
    var triangleArea = sqrt(r1 * radiusPr02 * (deltaR01 - r2));
    var cY = (float)b0.center.im() + 2 * triangleArea / deltaR01;
    var center = new Complex(cX, cY);

    return new Bubble(center, k2);
  }

  public float findKissingBend(Bubble[] triplet)
  {
    if (triplet != null)
    {
      var k0 = triplet[0].bend;
      var k1 = triplet[1].bend;
      var k2 = triplet[2].bend;

      var bendSum = k0 + k1 + k2;
      var pr01 = k0 * k1;
      var pr02 = k0 * k2;
      var pr12 = k1 * k2;
      var bendArea = sqrt(pr01 + pr02 + pr12);
      var k3 = bendSum + 2 * bendArea;

      if (k3 == 0) return 0;
      return k3;
    }

    return 0;
  }

  public Complex[] findKissingCenters(Bubble[] triplet, float k3)
  {
    var k0 = triplet[0].bend;
    var k1 = triplet[1].bend;
    var k2 = triplet[2].bend;

    var z0 = triplet[0].center;
    var z1 = triplet[1].center;
    var z2 = triplet[2].center;

    var cEx0 = z0.mul(k0);
    var cEx1 = z1.mul(k1);
    var cEx2 = z2.mul(k2);
    var cExSum012 = cEx0.add(cEx1).add(cEx2);

    var cPr01 = cEx0.mul(cEx1);
    var cPr02 = cEx0.mul(cEx2);
    var cPr12 = cEx1.mul(cEx2);
    var cPrSum012 = cPr01.add(cPr02).add(cPr12);

    var cPrSum012Root = cPrSum012.sqrt();
    cPrSum012Root = cPrSum012Root.mul(2);

    var posz3 = cExSum012.add(cPrSum012Root);
    var negz3 = cExSum012.sub(cPrSum012Root);
    posz3 = posz3.mul(1 / k3);
    negz3 = negz3.mul(1 / k3);

    return new Complex[] {posz3, negz3};
  }

  public boolean isTangentToAll(Bubble[] triplet, Bubble other)
  {
    for (var bubble : triplet)
      if (!other.isTangentTo(bubble))
        return false;

    return true;
  }
}
