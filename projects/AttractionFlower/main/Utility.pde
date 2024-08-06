class Utility
{

  /* Constructor definition */
  public Utility()
  {
  }

  /* Function definition */
  public PVector getMotionVector(Seed seed, Seed ovary)
  {
    var factor = pow(-1, frameCount);
    var leftMotionProb = random(-1, 0);
    var posX = leftMotionProb;

    var upperMotionProb = 0f;
    var lowerMotionProb = 0f;
    var liesAboveXAxes = (seed.position.y > ovary.position.y);
    if (liesAboveXAxes)
    {
      while (lowerMotionProb < 0.5f) lowerMotionProb = random(1);
      upperMotionProb = 1 - lowerMotionProb;
    } else
    {
      while (upperMotionProb < 0.5f) upperMotionProb = random(1);
      lowerMotionProb = 1 - upperMotionProb;
    }

    var directionProb = (frameCount % 2 == 0 ? upperMotionProb : lowerMotionProb);
    var posY = factor * directionProb;
    var motionVector = new PVector(posX, posY);
    var strength = pow(PI, 2);
    motionVector.mult(strength);

    return motionVector;
  }
}
