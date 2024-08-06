MathRose mathRose;

void setup()
{
  surface.setTitle("Math Roses");
  createMathRose();

  fullScreen(P2D);
  colorMode(HSB, 360, 255, 255);
}

void createMathRose()
{
  var resolution = 600;
  mathRose = new MathRose(resolution);
}

void draw()
{
  background(0);
  
  mathRose.animate();
  mathRose.render();
}
