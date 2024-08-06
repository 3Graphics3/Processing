int pendulumBound = 9;
ArrayList<Pendulum> pendulums;

void setup()
{
  surface.setTitle("Connected Pendulums");
  surface.setResizable(false);
  surface.setLocation(displayWidth / 3, floor(0.1 * displayHeight));

  createPendulums();

  size(1200, 900);
}

void createPendulums()
{
  pendulums = new ArrayList<Pendulum>();

  var originX = width / 2;
  var originY = 0f;
  for (int p = 0; p < pendulumBound; p++)
  {
    var origin = new PVector(originX, originY);
    var ropeLength = 0.05 * height + map(p, 0, pendulumBound, 0, 0.05 * height);
    var startAngle = random(QUARTER_PI, HALF_PI);

    pendulums.add(new Pendulum(origin, ropeLength, startAngle));

    // Keep track of the previous pendulum origin.
    var currentPendulum = pendulums.get(p);
    originX += currentPendulum.ropeLength * sin(currentPendulum.angle);
    originY += currentPendulum.ropeLength * cos(currentPendulum.angle) + currentPendulum.radius / 2;
  }
}

void draw()
{
  background(0);

  var originX = width / 2;
  var originY = 0f;
  for (int p = 0; p < pendulums.size(); p++)
  {
    var currentPendulum = pendulums.get(p);
    
    var isNotFirstPendulum = (p != 0);
    if (isNotFirstPendulum) currentPendulum.origin = new PVector(originX, originY);

    var isLastPendulum = (p == pendulums.size() - 1);
    if (isLastPendulum) currentPendulum.drag();

    if (!currentPendulum.isDragged) currentPendulum.swing();
    currentPendulum.show();

    // Keep track of the previous pendulum origin.
    originX += currentPendulum.ropeLength * sin(currentPendulum.angle);
    originY += currentPendulum.ropeLength * cos(currentPendulum.angle) + currentPendulum.radius / 2;
  }
}

void mousePressed()
{
  var lastPendulum = pendulums.get(pendulums.size() - 1);
  lastPendulum.checkDrag(new PVector(mouseX, mouseY));

  if (lastPendulum.isDragged)
  {
    for (var pendulum : pendulums)
      pendulum.isDragged = true;
  }
}

void mouseReleased()
{
  var lastPendulum = pendulums.get(pendulums.size() - 1);
  if (!lastPendulum.isDragged)
  {
    for (var pendulum : pendulums)
      pendulum.isDragged = false;
  }
}
