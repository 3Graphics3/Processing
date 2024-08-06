class Utility {

  private String binaryString;

  /* Constructor definition */
  public Utility(int configuration)
  {
    this.binaryString = Integer.toBinaryString(configuration);
  }

  /* Function definition */
  public Pixel[] createPixelRow(int resolution, int currentGen)
  {
    var radius = width / resolution;
    var pixelRow = new Pixel[resolution];
    for (var p = 0; p < pixelRow.length; p++)
    {
      var posX = p * radius;
      var posY = currentGen * radius;
      var position = new PVector(posX, posY);
      var state = 0;

      pixelRow[p] = new Pixel(position, radius, state);
    }

    return pixelRow;
  }

  public int getMappedDigit(String binaryTriplet)
  {
    var binaryIndex = Integer.parseInt(binaryTriplet, 2);
    var builder = new StringBuilder(this.binaryString).reverse();
    var reverseString = builder.toString();
    
    return reverseString.charAt(binaryIndex) - '0';
  }
}
