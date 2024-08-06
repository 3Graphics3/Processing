AttractionFlower flower;

void setup()
{
  surface.setTitle("Attraction Flower");
  createFlower();

  fullScreen();
  colorMode(HSB, 360, 255, 255);
}

void createFlower()
{
  var totalPetals = 6;
  flower = new AttractionFlower(totalPetals);
}

void draw()
{
  background(0);

  flower.animate();
  flower.render();
}
