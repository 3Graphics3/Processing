class StellarSystem
{

  private Attractor sun;
  private Planet[] planets;

  /* Constructor definition */
  public StellarSystem(Attractor sun)
  {
    this.sun = sun;
    this.createPlanetaryClock();
  }

  /* Function definition */
  private void createPlanetaryClock()
  {
    this.planets = new Planet[3];
    
    for (int p = 0; p < this.planets.length; p++)
    {
      var posX = random(0.12 * width, 0.87 * width);
      var posY = random(0.12 * height, 0.87 * height);
      var position = new PVector(posX, posY);
      var radius = 0.66 * sun.radius;
      var clockId = Clock.values()[p % 3];

      planets[p] = new Planet(position, radius, clockId);
    }
  }

  public void update()
  {
    if (this.planets != null)
    {
      this.attractOriginStar();
      this.attractNeighborPlanets();
    }
  }

  private void attractOriginStar()
  {
    var starForces = new Forces(this.sun);
    for (var planet : this.planets)
    {
      var mutualAttraction = starForces.getAttraction(planet);
      planet.applyForce(mutualAttraction);
      planet.orbit();
    }
  }

  private void attractNeighborPlanets()
  {
    for (var planet : this.planets)
    {
      for (var otherPlanet : this.planets)
      {
        var planetIsNotItself = (otherPlanet != planet);
        if (planetIsNotItself)
        {
          var planetForces = new Forces(otherPlanet);
          var mutualAttraction = planetForces.getAttraction(planet);
          planet.applyForce(mutualAttraction);

          this.connectPlanets(planet, otherPlanet);
        }
      }
    }
  }

  private void connectPlanets(Attractor planet, Attractor otherPlanet)
  {
    var originDistance = dist(planet.position.x, planet.position.y,
                              otherPlanet.position.x, otherPlanet.position.y);
    var hue = map(sin(originDistance), -1, 1, 0, 255);

    stroke(hue, 255, 255, 180);
    strokeWeight(3);
    line(otherPlanet.position.x, otherPlanet.position.y,
         planet.position.x, planet.position.y);
  }

  public void show()
  {
    if (this.planets != null)
    {
      //this.sun.show();
      for (var planet : this.planets) planet.show();
    }
  }
}
