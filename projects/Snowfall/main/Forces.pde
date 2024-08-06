class Forces
{

  private float G;
  private Snowflake snowflake;

  /* Constructor definition */
  public Forces(Snowflake snowflake)
  {
    this.G = 0.018;
    this.snowflake = snowflake;
  }

  /* Function definition */
  public PVector getGravity()
  {
    var strength = this.G * this.snowflake.mass;
    return new PVector(0, strength);
  }

  public PVector getWind()
  {
    var randomPhase = random(-PI / 2, PI / 2);
    var windFlow = this.snowflake.angle + randomPhase;
    var wind = PVector.fromAngle(windFlow);
    var strength = 0.12 * this.snowflake.mass;

    return PVector.mult(wind, strength);
  }
}
