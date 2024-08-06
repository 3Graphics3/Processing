float period = 120f;
float frequency = 1 / period;
float radius = 0f;

void setup()
{
  surface.setTitle("Throbbing Heart");
  surface.setResizable(false);
  surface.setLocation(displayWidth / 3, floor(0.1 * displayHeight));

  size(540, 540);
  colorMode(HSB, 255, 255, 255);
}

void draw()
{
  background(0, 120);

  translate(width / 2, height / 2);
  rotate(-PI / 4);

  var hue = noise(radius) * 30;
  fill(hue, 255, 255, 210);
  noStroke();

  renderHeart();
}

void renderHeart()
{
  var theta = TWO_PI * frameCount * frequency;
  radius = map(sin(theta), -1, 1, -width / 3, width / 3);

  ellipseMode(CENTER);
  arc(0, -radius / 2, radius, radius, PI, TWO_PI);
  arc(radius / 2, 0, radius, radius, 3 * PI / 2, 5 * PI / 2);

  rectMode(CENTER);
  if (radius > 0) square(0, 0, radius);
}
