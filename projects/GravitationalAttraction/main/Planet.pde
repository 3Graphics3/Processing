class Planet
{

  private PVector position;
  private PVector velocity;
  private float maxVelocity;
  private PVector acceleration;

  private float radius;
  private float mass;

  /* Constructor definition */
  public Planet(PVector position, float radius)
  {
    this.position = position;
    this.velocity = new PVector();
    this.acceleration = new PVector();

    this.radius = 1.2 * radius;
    this.mass = (float)Math.sqrt(PI * Math.pow(this.radius, 2));
    this.maxVelocity = this.mass * PI / 3;
  }

  /* Function definition */
  public void applyForce(PVector outerForce)
  {
    var force = PVector.div(outerForce, this.mass);
    this.acceleration.add(force);
  }

  public PVector attract(Planet planet)
  {
    var mutualAttraction = PVector.sub(this.position, planet.position);

    var planetDistance = mutualAttraction.mag();
    planetDistance = constrain(planetDistance, 3, 6);

    var mutualAttractionStrength = (gravitationalConstant * this.mass * planet.mass) /
                                    ((float)Math.pow(planetDistance, 2));
    mutualAttraction.normalize();
    mutualAttraction.setMag(mutualAttractionStrength);

    return mutualAttraction;
  }

  public void move()
  {
    this.velocity.add(this.acceleration);
    this.velocity.limit(this.maxVelocity);
    this.position.add(this.velocity);

    this.acceleration.mult(0);
  }

  public void show()
  {
    pushMatrix();
    translate(this.position.x, this.position.y);

    noStroke();
    fill(255, 210);
    circle(0, 0, this.radius);
    popMatrix();
  }
  
}
