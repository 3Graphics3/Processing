class BioSystem
{

  private ArrayList<Organism> bioSystem;
  private int capacity;

  /* Constructor definition */
  public BioSystem()
  {
    this.bioSystem = new ArrayList<Organism>();
    this.capacity = floor(pow(PI, 12));
  }

  /* Function definition */
  public void generateOrganism(PVector origin, float radius,
    color bioColor)
  {
    var bioOrganism = new Organism(origin, radius, bioColor);
    this.bioSystem.add(bioOrganism);
  }

  public void grow()
  {
    if (this.bioSystem != null)
    {
      this.monitorStrength();
      this.monitorGrowth();
      this.performGrowth();
    }
  }

  private void monitorStrength()
  {
    var strengthExceeded = (this.bioSystem.size() >= this.capacity);
    if (strengthExceeded)
    {
      var randomIndex = (int)random(this.bioSystem.size());
      this.bioSystem.remove(randomIndex);
    }
  }

  private void monitorGrowth()
  {
    for (var i = 0; i < this.bioSystem.size(); i++)
    {
      var organism = this.bioSystem.get(i);

      if (organism.radius > 30)
      {
        organism.stopGrowth();
        continue;
      }

      for (var j = 0; j < this.bioSystem.size(); j++)
      {
        var otherOrganism = this.bioSystem.get(j);
        var isItself = (organism == otherOrganism);
        if (isItself) continue;

        if (organism.collidesWith(otherOrganism))
        {
          organism.stopGrowth();
          otherOrganism.stopGrowth();
        }
      }
    }
  }

  private void performGrowth()
  {
    for (var organism : this.bioSystem)
      organism.grow();
  }

  public void render()
  {
    if (this.bioSystem != null)
    {
      for (var organism : this.bioSystem)
        organism.render();
    }
  }
}
