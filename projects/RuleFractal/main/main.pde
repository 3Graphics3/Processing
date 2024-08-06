RuleFractal ruleFractal;

void setup()
{
  surface.setTitle("Rule Fractal");
  createRuleFractal();

  fullScreen(P2D);
  colorMode(HSB, 360, 255, 255);
}

void createRuleFractal()
{
  var depth = 6;
  ruleFractal = new RuleFractal(depth);
}

void draw()
{
  background(0);

  ruleFractal.render();
}
