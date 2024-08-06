class Pixeltope
{

  private PImage bioImage;
  private PVector pixelDim;

  private ArrayList<BioCell> biotope;

  /* Constructor definition */
  public Pixeltope(String imagePath, int resolution)
  {
    this.bioImage = loadImage(imagePath);
    this.bioImage.resize(resolution, resolution);

    var shrinkFactor = 0.42;
    resolution *= shrinkFactor;
    var pxWidth = this.bioImage.width / resolution;
    var pxHeight = this.bioImage.height / resolution;
    this.pixelDim = new PVector(pxWidth, pxHeight);

    this.generateBiotope();
  }

  /* Function definition */
  private void generateBiotope()
  {
    if (this.bioImage != null)
    {
      this.biotope = new ArrayList<BioCell>();

      for (int px = 0; px < this.bioImage.width; px += this.pixelDim.x)
      {
        for (int py = 0; py < this.bioImage.height; py += this.pixelDim.y)
        {
          var posX = px;
          var posY = py;
          var origin = new PVector(posX, posY);
          var radius = this.pixelDim.x;
          var bioColor = this.getBioColor(px, py);

          this.biotope.add(new BioCell(origin, radius, bioColor));
        }
      }
    }
  }

  private color getBioColor(int px, int py)
  {
    var avgRed = 0f;
    var avgGreen = 0f;
    var avgBlue = 0f;
    for (int k = px; k < px + this.pixelDim.x; k++)
    {
      for (int l = py; l < py + this.pixelDim.y; l++)
      {
        var currentPixel = this.bioImage.get(k, l);

        avgRed += red(currentPixel) / 3;
        avgGreen += green(currentPixel) / 3;
        avgBlue += blue(currentPixel) / 3;
      }
    }

    return color(avgRed, avgGreen, avgBlue);
  }

  public void render()
  {
    if (this.biotope != null)
    {
      for (var bioCell : this.biotope)
        bioCell.render();
    }
  }
}
