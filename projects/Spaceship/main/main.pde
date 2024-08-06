Spaceship spaceship;

float deltaTheta = 0.09;

void setup()
{
  surface.setTitle("Spaceship");
  surface.setResizable(false);
  surface.setLocation(displayWidth / 3, floor(0.1 * displayHeight));

  createSpaceship();

  size(810, 810);
}

void createSpaceship()
{
  var radius = random(21, 24);
  var position = new PVector(width / 2, height / 2);

  spaceship = new Spaceship(radius, position);
}

void draw()
{
  background(0, 120);

  spaceship.show();
  spaceship.fly();
  spaceship.checkBounds();
}

void keyPressed()
{
  var specialKeyPressed = (key == CODED);
  if (specialKeyPressed)
  {
    if (keyCode == RIGHT)
      spaceship.turn(deltaTheta);

    if (keyCode == LEFT)
      spaceship.turn(-deltaTheta);
  }

  var isSpaceshipBoosting = (key == ' ');
  if (isSpaceshipBoosting)
    spaceship.thrust();
}
