Cube cube;

void setup()
{
  surface.setTitle("Cube");
  createCube();

  fullScreen();
}

void createCube()
{
  var totalVertices = floor(pow(2, 3));
  var originPoints = new PVector[totalVertices];

  originPoints[0] = new PVector(1, 1, -1.1);
  originPoints[1] = new PVector(-1, 1, -1.1);
  originPoints[2] = new PVector(-1, -1, -1.1);
  originPoints[3] = new PVector(1, -1, -1.1);
  originPoints[4] = new PVector(1, 1, 1.1);
  originPoints[5] = new PVector(-1, 1, 1.1);
  originPoints[6] = new PVector(-1, -1, 1.1);
  originPoints[7] = new PVector(1, -1, 1.1);
  var radius = 150f;

  cube = new Cube(originPoints, radius);
}

void draw()
{
  background(0);

  cube.animate();
  cube.render();
}
