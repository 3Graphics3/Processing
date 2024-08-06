int symmetry = 8;
float angle = TWO_PI / symmetry;

float time = 0f;
float deltaTime = 0.01f;

void setup()
{
  surface.setTitle("Kaleidoscope Snowflake");

  fullScreen();
  
  background(0);
  colorMode(HSB, 255, 255, 255);
}

void draw()
{
  var origin = new PVector(width / 2, height / 2);
  translate(origin.x, origin.y);

  if (mousePressed) drawSnowFlake(origin);
}

void drawSnowFlake(PVector origin)
{
  var prevMouse = new PVector(pmouseX - origin.x, pmouseY - origin.y);
  var curMouse = new PVector(mouseX - origin.x, mouseY - origin.y);

  for (int a = 0; a < symmetry; a++)
  {
    rotate(angle);

    pushMatrix();
    time += deltaTime;
    var hue = map(noise(time), 0, 1, 0, 255);
    stroke(hue, 255, 255);

    var strokeRate = dist(curMouse.x, curMouse.y, prevMouse.x, prevMouse.y);
    var weight = map(strokeRate, 0, width / 2, 7, 1);
    strokeWeight(weight);

    var mirrorEffectIsActive = (a % 2 == 1);
    if (mirrorEffectIsActive) scale(1, -1);

    line(curMouse.x, curMouse.y, prevMouse.x, prevMouse.y);
    popMatrix();
  }
}
