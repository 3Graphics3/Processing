Rain rain;

void setup()
{
  surface.setTitle("Rain Fall");
  createRain();

  fullScreen();
  colorMode(HSB, 360, 255, 255);
}

void createRain()
{
  var dropDensity = 39;
  rain = new Rain(dropDensity);
}

void draw()
{
  background(0);

  rain.render();
  rain.animate();
}
