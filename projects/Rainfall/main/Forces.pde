class Forces
{

  private float gravityFactor;
  private Drop drop;

  /* Constructor definition */
  public Forces(Drop drop)
  {
    this.gravityFactor = pow(TAU, 2.07);
    this.drop = drop;
  }

  /* Function definition */
  public PVector getGravity()
  {
    var direction = PVector.fromAngle(this.drop.getAngle());
    var strength = this.gravityFactor * this.drop.getMass();

    direction.normalize();
    direction.mult(strength);

    return direction;
  }
}
