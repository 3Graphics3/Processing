import peasy.*;

PeasyCam camera;
SpaceDome spaceDome;

void setup()
{
  surface.setTitle("Space Dome");

  camera = new PeasyCam(this, 120);
  createSpaceDome();

  fullScreen(P3D);
}

void createSpaceDome()
{
  var starBound = 213;
  spaceDome = new SpaceDome(starBound);
}

void draw()
{
  background(0);

  spaceDome.animate();
  spaceDome.render();
}
