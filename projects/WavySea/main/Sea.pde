class Sea
{

  private PVector dimension;
  private int resolution;
  private PVector spacing;

  private float motionVelocity;
  private float motionAcceleration;
  private PVector deltaVelocity;

  private float[][] seaAltitude;
  private int altitudeLimit;

  /* Constructor definition */
  public Sea(PVector dimension, int resolution)
  {
    this.dimension = dimension;
    this.resolution = resolution;

    var spaceX = this.dimension.x / this.resolution;
    var spaceY = this.dimension.y / this.resolution;
    this.spacing = new PVector(spaceX, spaceY);

    this.motionVelocity = 0f;
    this.motionAcceleration = 0.012f;
    this.deltaVelocity = new PVector(PI / 24, PI / 24);

    this.seaAltitude = new float[this.resolution][this.resolution];
    this.altitudeLimit = 90;
  }

  /* Function definition */
  public void flow()
  {
    this.createSeaAltitude();
    this.motionVelocity += this.motionAcceleration;
  }

  private void createSeaAltitude()
  {
    var velocityY = this.motionVelocity;
    for (int y = 0; y < this.resolution; y++)
    {
      var velocityX = 0f;
      for (int x = 0; x < this.resolution; x++)
      {
        seaAltitude[y][x] = map(noise(velocityX, velocityY), 0, 1,
                                -this.altitudeLimit, this.altitudeLimit);
        velocityX += this.deltaVelocity.x;
      }
      velocityY += this.deltaVelocity.y;
    }
  }

  public void show()
  {
    pushMatrix();
    translate(-width / 2, -height / 6);
    rotateX(PI / 3);

    noFill();
    strokeWeight(5);
    this.renderSea();
    popMatrix();
  }

  private void renderSea()
  {
    for (int y = 0; y < this.resolution; y++)
    {
      var maxBrightness = (this.resolution - 1) * this.spacing.x;
      var brightness = map(y * this.spacing.y, 0, maxBrightness, 0, 255);
      
      for (int x = 0; x < this.resolution; x++)
      {
        stroke(39, 210, 255, brightness);
        point(x * this.spacing.x, y * this.spacing.y, this.seaAltitude[x][y]);
      }
    }
  }
  
}
