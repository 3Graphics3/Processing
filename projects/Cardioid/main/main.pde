Cardiod cardiod;

void setup()
{
  surface.setTitle("Cardioid");
  surface.setResizable(false);
  surface.setLocation(displayWidth / 3, floor(0.1 * displayHeight));

  createCardiod();

  size(780, 780, P2D);
  colorMode(HSB, 360, 255, 255);
}

void createCardiod()
{
  var resolution = 210;
  cardiod = new Cardiod(resolution);
}

void draw()
{
  background(0);

  cardiod.render();
}
