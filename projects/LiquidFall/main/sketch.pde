Liquid liquid;
ArrayList<Drop> drops;
float groundY = 0.2 * height;

float liquidResistance = 0.003f;
PVector gravityAcceleration = new PVector(0, 0.3);

void setup()
{
  surface.setTitle("Liquid Fall");
  //fullScreen();
  size(690, 750);

  createLiquid();
  createDrops();
}

void createLiquid()
{
  var fillColor = color(30, 60, 120, 120);
  var position = new PVector(0, height / 2);
  var dimension = new PVector(width, 0.66 * height);

  liquid = new Liquid(fillColor, position, dimension, liquidResistance);
}

void mousePressed()
{
  drops.clear();
  createDrops();
}

void createDrops()
{
  drops = new ArrayList<Drop>();

  for (int d = 0; d < 12; d++)
  {
    var position = new PVector(random(0, width), random(0, 0.45 * height));
    var dimension = new PVector(random(24, 45), random(24, 36));

    drops.add(new Drop(position, dimension));
  }
}

void draw()
{
  background(255);

  liquid.show();

  for (var drop : drops)
  {
    if (liquid.contains(drop))
    {
      var drag = liquid.getDragForce(drop);
      drop.applyForce(drag);
    }

    var gravity = applyGravity(true, drop);
    drop.applyForce(gravity);

    drop.fall();
    drop.show();
    drop.checkBounds();
  }
}

PVector applyGravity(boolean apply, Drop drop)
{
  if (!apply)
    return new PVector(0, 0);

  return PVector.mult(gravityAcceleration, drop.mass);
}
