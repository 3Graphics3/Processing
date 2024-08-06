class Rain
{

  private ArrayList<Drop> rain;
  private int rainDensity;

  /* Constructor definition */
  public Rain(int rainDensity)
  {
    this.rain = new ArrayList<Drop>();
    this.rainDensity = rainDensity;
  }

  /* Function definition */
  public void animate()
  {
    if (this.rain != null)
    {
      for (var rainDrop : this.rain)
      {
        var forces = new Forces(rainDrop);
        var gravity = forces.getGravity();

        rainDrop.applyForce(gravity);
        rainDrop.animate();
      }
      this.observeRain();

      for (int d = 0; d < this.rainDensity; d++)
        this.addNewDrop();
    }
  }

  private void observeRain()
  {
    for (int d = 0; d < this.rain.size(); d++)
    {
      var drop = this.rain.get(d);
      if (drop.hasSplashed()) this.rain.remove(d);
    }
  }

  private void addNewDrop()
  {
    var randomValue = randomGaussian();
    var size = map(randomValue, 0, 1, 9, 33);

    var posX = random(width);
    var posY = -random(height / 2);
    var start = new PVector(posX, posY);

    var delta = PI;
    var a = 90 - delta;
    var b = 90 + delta;
    randomValue = randomGaussian();
    var theta = map(randomValue, 0, 1, a, b);
    var angle = radians(theta);

    this.rain.add(new Drop(size, start, angle));
  }

  public void render()
  {
    if (this.rain != null)
    {
      for (var rainDrop : this.rain)
        rainDrop.render();
    }
  }
}
