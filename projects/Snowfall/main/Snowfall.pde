class Snowfall
{

  private ArrayList<PImage> snowflakes;

  private float generationRate;
  private ArrayList<Snowflake> snowfall;

  /* Constructor definition */
  public Snowfall(String imagePath, float generationRate)
  {
    var resolution = 3;
    var snowflakes = loadImage(imagePath);
    this.createSnowFlakes(resolution, snowflakes);

    this.generationRate = generationRate;
    this.snowfall = new ArrayList<Snowflake>();
  }

  /* Function definition */
  private void createSnowFlakes(int resolution, PImage snowflakes)
  {
    this.snowflakes = new ArrayList<PImage>();

    var dimX = snowflakes.width / resolution;
    var dimY = snowflakes.height / resolution;
    var dimension = new PVector(dimX, dimY);
    for (int y = 0; y < snowflakes.height; y += dimension.y)
    {
      for (int x = 0; x < snowflakes.width; x += dimension.x)
        this.snowflakes.add(snowflakes.get(x, y,
          (int)dimension.x, (int)dimension.y));
    }
  }

  public void animate()
  {
    if (this.snowfall != null)
    {
      var snowflakeIsCreated = (random(1) < this.generationRate);
      if (snowflakeIsCreated) this.createSnowflake();

      for (var snowflake : this.snowfall)
      {
        var forces = new Forces(snowflake);
        var gravity = forces.getGravity();
        var wind = forces.getWind();

        snowflake.applyForce(gravity);
        snowflake.applyForce(wind);
        snowflake.animate();
      }

      this.observeSnowfall();
    }
  }

  private void createSnowflake()
  {
    var posX = random(width);
    var posY = random(-height / 3, -height / 9);
    var position = new PVector(posX, posY);
    var probRadius = this.getRandomRadius();
    var randomPatternIndex = (int)random(this.snowflakes.size());
    var pattern = this.snowflakes.get(randomPatternIndex);

    this.snowfall.add(new Snowflake(position, probRadius, pattern));
  }

  private float getRandomRadius()
  {
    var scalar = pow(PI, 2.4);
    var randomRadius = randomGaussian() * scalar;
    return PI + abs(randomRadius);
  }

  private void observeSnowfall()
  {
    for (int s = 0; s < this.snowfall.size(); s++)
    {
      var snowflake = this.snowfall.get(s);
      if (snowflake.isOutOfScope()) this.snowfall.remove(s);
      snowflake.rePosition();
    }
  }

  public void render()
  {
    if (this.snowfall != null)
    {
      for (var snowflake : this.snowfall)
        snowflake.render();
    }
  }
}
