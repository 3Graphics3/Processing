class Attractor
{

  private PVector position;
  private float radius;
  private float mass;

  /* Constructor definition */
  public Attractor(PVector position, float radius)
  {
    this.position = position;
    this.radius = 1.2 * radius;
    this.mass = (float)Math.sqrt(PI * Math.pow(this.radius, 2));
  }

  /* Function definition */
  public PVector attract(Planet planet)
  {
    var attraction = PVector.sub(this.position, planet.position);

    var planetDistance = attraction.mag();
    planetDistance = constrain(planetDistance, 6, 9);

    var attractionStrength = (gravitationalConstant * this.mass * planet.mass) /
                              ((float)Math.pow(planetDistance, 2));
    attraction.normalize();
    attraction.setMag(attractionStrength);

    return attraction;
  }

  public void show()
  {
    pushMatrix();
    translate(this.position.x, this.position.y);

    noStroke();
    fill(255, 150, 180, 210);
    circle(0, 0, this.radius);
    popMatrix();
  }
  
}
