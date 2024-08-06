TimeTable timeTable;

void setup()
{
  surface.setTitle("Time Table");
  createTimetimeTable();

  fullScreen();
  colorMode(HSB, 255, 255, 255);
}

void createTimetimeTable()
{
  var pointLimit = 123;
  timeTable = new TimeTable(pointLimit);
}

void draw()
{
  background(0);

  timeTable.animate();
  timeTable.render();
}
