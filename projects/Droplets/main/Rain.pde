class Rain
{

  private ArrayList<Drop> rain;

  /* Constructor definition */
  public Rain()
  {
    this.rain = new ArrayList<Drop>();
  }

  /* Function definition */
  private void animate()
  {
    if (this.rain != null)
    {
      var probability = randomGaussian();
      if (probability < 0.1 || probability > 0.9)
        this.createDrop();

      this.validateRain();

      for (var drop : this.rain)
        drop.animate();
    }
  }

  private void validateRain()
  {
    for (int d = 0; d < this.rain.size(); d++)
    {
      var drop = this.rain.get(d);
      if (drop.hasVanished())
        rain.remove(d);
    }
  }

  private void createDrop()
  {
    var radius = noise(sin(frameRate));

    var posX = random(radius, width - radius);
    var posY = random(radius, height - radius);
    var position = new PVector(posX, posY);

    rain.add(new Drop(position, radius));
  }

  private void render()
  {
    if (this.rain != null)
    {
      for (var drop : this.rain)
        drop.render();
    }
  }
}
