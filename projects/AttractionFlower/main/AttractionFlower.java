class AttractionFlower
{

  private int totalPetals;

  private Seed ovary;
  private ArrayList<Seed> seeds;

  /* Constructor definition */
  public AttractionFlower(int totalPetals)
  {
    this.totalPetals = totalPetals;

    var position = new PVector();
    var radius = pow(PI, 2.71);
    this.ovary = new Seed(position, radius);

    this.seeds = new ArrayList<Seed>();
    this.seeds.add(this.ovary);
  }

  /* Function definition */
  public void animate()
  {
    if (this.seeds != null)
    {
      for (var seed : this.seeds)
        seed.animate();
      this.observeMotion();

      var movingSeeds = this.countMovingSeeds();
      var seedsAreMoving = (movingSeeds != this.seeds.size());
      if (seedsAreMoving) return;

      this.addNewSeed();
    }
  }

  private void observeMotion()
  {
    for (var seed : this.seeds)
    {
      for (var otherSeed : this.seeds)
      {
        if (seed.isTheSameWith(otherSeed)) continue;

        if (seed.collidesWith(otherSeed) ||
          seed.collidesWith(this.ovary))
          seed.stopMoving();
      }
    }
  }

  private int countMovingSeeds()
  {
    var movingSeeds = 0;
    for (var seed : this.seeds)
    {
      if (seed.isMoving) continue;
      movingSeeds++;
    }

    return movingSeeds;
  }

  private void addNewSeed()
  {
    var posX = random(width);
    var posY = random(0.2 * height, 0.25 * height);
    var position = new PVector(posX, posY);
    var radius = pow(PI, 3);

    this.seeds.add(new Seed(this.ovary, position, radius));
  }

  public void render()
  {
    if (this.seeds != null)
    {
      var deltaTheta = TAU / this.totalPetals;
      for (float theta = 0; theta < TAU; theta += deltaTheta)
      {
        pushMatrix();
        translate(width / 2, height / 2);
        rotate(theta);

        for (var seed : this.seeds)
          seed.render();
        popMatrix();
      }
    }
  }
}
