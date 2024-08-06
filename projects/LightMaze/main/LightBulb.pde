class LightBulb
{

  private Utility utility;

  private PVector position;
  private float radius;
  private Beam[] beams;

  private PVector delta;
  private PVector deltaPrime;

  /* Constructor definition */
  public LightBulb(PVector position, float radius, int totalBeams)
  {
    this.utility = new Utility();

    this.position = position;
    this.radius = radius;

    this.createLightBulb(totalBeams);

    this.delta = new PVector();
    this.deltaPrime = new PVector(0.0045, 0.009);
  }

  /* Function definition */
  private void createLightBulb(int totalBeams)
  {
    this.beams = new Beam[totalBeams];
    for (int b = 0; b < this.beams.length; b++)
    {
      var start = this.position;
      var angle = map(b, 0, totalBeams, 0, TAU);
      this.beams[b] = new Beam(start, angle);
    }
  }

  public void animate(ArrayList<Barrier> barriers)
  {
    if (this.beams != null)
    {
      this.rePosition();
      this.updateBeams();
      this.shootBeams(barriers);

      this.delta.add(this.deltaPrime);
    }
  }

  private void rePosition()
  {
    var noiseX = noise(this.delta.x);
    var posX = map(noiseX, 0, 1, 0, width);

    var noiseY = noise(this.delta.y);
    var posY = map(noiseY, 0, 1, 0, height);
    this.position = new PVector(posX, posY);
  }

  private void updateBeams()
  {
    for (int b = 0; b < this.beams.length; b++)
    {
      var currentBeam = this.beams[b];
      var start = this.position;
      var theta = currentBeam.getAngle();

      this.beams[b] = new Beam(start, theta);
    }
  }

  private void shootBeams(ArrayList<Barrier> barriers)
  {
    for (var beam : this.beams)
    {
      var optimalPoint = this.utility.findIntersection(this.position, beam, barriers);
      if (optimalPoint == null) continue;

      line(this.position.x, this.position.y,
        optimalPoint.x, optimalPoint.y);
    }
  }

  public void render()
  {
    this.renderBulb();
    this.renderBeams();
  }

  private void renderBulb()
  {
    pushMatrix();
    translate(this.position.x, this.position.y);

    noStroke();
    fill(66, 180, 180);
    circle(0, 0, 2 * this.radius);
    popMatrix();
  }

  private void renderBeams()
  {
    if (this.beams != null)
    {
      for (var beam : this.beams)
        beam.render();
    }
  }
}
