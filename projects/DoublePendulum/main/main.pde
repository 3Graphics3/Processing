PathTracer pathTracer;
ChaoticPendulum chaoticPendulum;

void setup()
{
  surface.setTitle("Double Pendulum");
  surface.setResizable(false);
  surface.setLocation(displayWidth / 3, floor(0.1 * displayHeight));

  createChaoticPendulum();
  createPathTracer();

  size(720, 720, P2D);
  colorMode(HSB, 360, 255, 255);
}

void createChaoticPendulum()
{
  var posX = width / 2;
  var posY = 0.35 * height;
  var position = new PVector(posX, posY);

  chaoticPendulum = new ChaoticPendulum(position);
}

void createPathTracer()
{
  var posX = width / 2;
  var posY = 0.35 * height;
  var position = new PVector(posX, posY);
  
  pathTracer = new PathTracer(position, chaoticPendulum);
}

void draw()
{
  background(0);
  image(pathTracer.getTracer(), 0, 0);

  chaoticPendulum.animate();
  chaoticPendulum.render();
  
  pathTracer.update();
  pathTracer.render();
}
