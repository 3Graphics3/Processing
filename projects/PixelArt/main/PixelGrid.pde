class PixelGrid {

  private Utility utility;

  private int generation;
  private int resolution;
  private ArrayList<Pixel[]> pixelGrid;

  /* Constructor definition */
  public PixelGrid(int resolution, int configuration)
  {
    this.utility = new Utility(configuration);

    this.generation = 0;
    this.resolution = resolution;
    this.createPixelGrid();
  }

  /* Function definition */
  private void createPixelGrid()
  {
    this.pixelGrid = new ArrayList<Pixel[]>();

    var pixelRow = this.utility.createPixelRow(this.resolution, this.generation);
    var rowCenter = this.resolution / 2;
    pixelRow[rowCenter].state = 1;

    this.pixelGrid.add(pixelRow);
  }

  public void animate()
  {
    this.generation++;

    var prevPixelRow = this.pixelGrid.get(this.generation - 1);   
    var nextPixelRow = this.utility.createPixelRow(this.resolution, this.generation);

    var rowLength = prevPixelRow.length;
    for (var p = 0; p < rowLength; p++)
    {
      var leftPixel = prevPixelRow[(p - 1 + rowLength) % rowLength];
      var centerPixel = prevPixelRow[p];
      var rightPixel = prevPixelRow[(p + 1) % rowLength];

      var binaryTriplet = "" + leftPixel.state +
        centerPixel.state + rightPixel.state;

      var binaryDigit = this.utility.getMappedDigit(binaryTriplet);
      nextPixelRow[p].state = binaryDigit;
    }

    this.pixelGrid.add(nextPixelRow);
  }

  public void render()
  {
    if (this.pixelGrid != null)
    {
      for (var pixelRow : this.pixelGrid)
        for (var pixel : pixelRow)
          pixel.render();
    }
  }
}
