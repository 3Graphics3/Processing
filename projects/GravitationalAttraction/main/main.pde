ArrayList<Planet> planetSystem;
ArrayList<Attractor> attractors;
int moonBound = 12;

float gravitationalConstant = 0.42;

void setup()
{
  surface.setTitle("Gravitational Attraction");

  attractors = new ArrayList<Attractor>();
  createAttractor(new PVector(width / 2, height / 2));
  createPlanetSystem();

  //fullScreen();
  size(999, 720);
}

void mouseClicked()
{
  createAttractor(new PVector(mouseX, mouseY));
  createPlanetSystem();
}

void createAttractor(PVector position)
{
  var radius = 39f;
  attractors.add(new Attractor(position, radius));
}

void createPlanetSystem()
{
  planetSystem = new ArrayList<Planet>();

  for (int p = 0; p < moonBound; p++)
  {
    var position = new PVector(random(width), random(height));
    var radius = random(15, 18);

    planetSystem.add(new Planet(position, radius));
  }
}

void draw()
{
  background(0);

  for (var attractor : attractors)
  {
    attractor.show();

    for (var planet : planetSystem)
    {
      var attraction = attractor.attract(planet);
      planet.applyForce(attraction);

      planet.move();
      planet.show();
    }
  }

  for (var planet : planetSystem)
  {
    for (var otherPlanet : planetSystem)
    {
      var planetIsNotItself = (otherPlanet != planet);
      if (planetIsNotItself)
      {
        var mutualAttraction = otherPlanet.attract(planet);
        planet.applyForce(mutualAttraction);
      }

      /*
       * Connect each planet with a line to
       * see a beautiful triangular trail.
       *
       * line(planet.position.x, planet.position.y,
       *      otherPlanet.position.x, otherPlanet.position.y);
       */
    }
  }
}
