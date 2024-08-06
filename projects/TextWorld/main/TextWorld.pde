class TextWorld
{

  private Utility utility;

  private String textMap;
  private PVector pixelDim;

  private Capture video;

  /* Constructor definition */
  public TextWorld(Capture video, int resolution)
  {
    this.utility = new Utility();

    this.textMap = "   `.,_+-=*^!()@#&$%$cART";

    var pX = width / resolution;
    var pY = height / resolution;
    this.pixelDim = new PVector(pX, pY);

    this.video = video;
  }

  /* Function definition */
  public void render()
  {
    this.video.start();
    if (!this.video.available()) return;

    this.renderVideo();
  }

  public void renderVideo()
  {
    this.video.read();
    this.video.loadPixels();

    for (int x = 0; x < this.video.width; x++)
    {
      var pX = x * this.pixelDim.x;
      for (int y = 0; y < this.video.height; y++)
      {
        var pY = y * this.pixelDim.y;

        var pixelIndex = x + y * this.video.width;
        var pixel = this.video.pixels[pixelIndex];
        var pixelAvg = this.utility.getPixelAvg(pixel);

        var b = this.textMap.length() - 1;
        var charIndex = floor(map(pixelAvg, 0, 360, 0, b));
        var character = this.textMap.charAt(charIndex);

        var weight = floor(this.pixelDim.x);
        textSize(weight);

        var noiseValue = noise(pixelAvg + PI / 2);
        var hue = map(noiseValue, 0, 1, 0, 360);
        fill(hue, 150, 180);

        text(character, pX, pY);
      }
    }
  }
}
