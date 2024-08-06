Biotope bioTope;
Pixeltope pixelTope;

void setup()
{
  surface.setTitle("BioSystem");
  surface.setResizable(false);
  surface.setLocation(displayWidth / 3, floor(0.1 * displayHeight));

  createBioTope();
  //createPixelTope();

  size(720, 720);
}

void createBioTope()
{
  var imagePath = "images/Coder.jpg";
  var resolution = height;

  bioTope = new Biotope(imagePath, resolution);
}

void createPixelTope()
{
  var imagePath = "images/Coder.jpg";
  var resolution = height;

  pixelTope = new Pixeltope(imagePath, resolution);
}

void draw()
{
  background(0);

  bioTope.generate();
  bioTope.grow();
  bioTope.render();

  //pixelTope.render();
}
