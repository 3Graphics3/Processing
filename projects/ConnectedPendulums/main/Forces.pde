class Forces
{

  private PVector gravityAcceleration;
  private Pendulum pendulum;

  /* Constructor definition */
  public Forces(Pendulum pendulum)
  {
    this.gravityAcceleration = new PVector(0, 0.003);
    this.pendulum = pendulum;
  }

  /* Function definition */
  public PVector getGravity(boolean apply)
  {
    if (!apply)
      return new PVector(0, 0);

    return PVector.mult(this.gravityAcceleration, this.pendulum.mass);
  }
  
}
