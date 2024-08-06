class Utility
{

  /* Constructor definition */
  public Utility()
  {
  }

  /* Function definition */
  public float getPixelAvg(color pixel)
  {
    var r = red(pixel);
    var g = green(pixel);
    var b = blue(pixel);

    var j = 0.254;
    var i = 0.432;
    var k = 0.314;

    r = (i * r + j * g + k * b);
    g = (i * g + j * r + k * b);
    b = (i * g + j * b + k * r);

    return (r + g + b) / 3;
  }
}
