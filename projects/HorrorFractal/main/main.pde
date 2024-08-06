HorrorFractal horrorFractal;

void setup()
{
  surface.setTitle("Horror Fractal");
  horrorFractal = new HorrorFractal();

  fullScreen(P2D);
}

void draw()
{
  background(0);

  horrorFractal.animate();
  horrorFractal.render();
}
