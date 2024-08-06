HyperCube hyperCube;

void setup()
{
  surface.setTitle("HyperCube");
  createHyperCube();

  fullScreen(P3D);
}

void createHyperCube()
{
  var totalVertices = floor(pow(2, 4));
  var originPoints = new P4Vector[totalVertices];

  originPoints[0] = new P4Vector(1, 1, -1, -2.13);
  originPoints[1] = new P4Vector(-1, 1, -1, -2.13);
  originPoints[2] = new P4Vector(-1, -1, -1, -2.13);
  originPoints[3] = new P4Vector(1, -1, -1, -2.13);
  originPoints[4] = new P4Vector(1, 1, 1, -2.13);
  originPoints[5] = new P4Vector(-1, 1, 1, -2.13);
  originPoints[6] = new P4Vector(-1, -1, 1, -2.13);
  originPoints[7] = new P4Vector(1, -1, 1, -2.13);
  originPoints[8] = new P4Vector(1, 1, -1, 2.13);
  originPoints[9] = new P4Vector(-1, 1, -1, 2.13);
  originPoints[10] = new P4Vector(-1, -1, -1, 2.13);
  originPoints[11] = new P4Vector(1, -1, -1, 2.13);
  originPoints[12] = new P4Vector(1, 1, 1, 2.13);
  originPoints[13] = new P4Vector(-1, 1, 1, 2.13);
  originPoints[14] = new P4Vector(-1, -1, 1, 2.13);
  originPoints[15] = new P4Vector(1, -1, 1, 2.13);
  var radius = 180f;

  hyperCube = new HyperCube(originPoints, radius);
}

void draw()
{
  background(0);

  hyperCube.animate();
  hyperCube.render();
}
