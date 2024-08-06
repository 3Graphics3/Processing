PrimeSpiral primeSpiral;

void setup()
{
  surface.setTitle("Prime Spiral");
  primeSpiral = new PrimeSpiral();

  fullScreen(P2D);
  colorMode(HSB, 360, 255, 255);
}

void draw()
{
  background(0);

  primeSpiral.render();
  primeSpiral.animate();
}
