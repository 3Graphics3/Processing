class Forces
{

  private float gravityAcceleration;
  private Attractor attractor;

  /* Constructor definition */
  public Forces(Attractor attractor)
  {
    this.gravityAcceleration = PI / 81;
    this.attractor = attractor;
  }

  /* Function definition */
  public PVector getAttraction(Attractor attractor)
  {
    var attraction = PVector.sub(this.attractor.position, attractor.position);
    var planetDistance = attraction.mag();
    planetDistance = constrain(planetDistance, PI, 3 * PI);

    attraction.normalize();
    var strengthFactor = this.attractor.mass * attractor.mass / pow(planetDistance, 2);
    var strength = this.gravityAcceleration * strengthFactor;
    attraction.setMag(strength);

    return attraction;
  }
  
}
