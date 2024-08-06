class EpicyclePainter
{

  private PVector origin;

  private WavePattern wavePattern;
  private CircleStruct circleStruct;

  /* Constructor definition */
  public EpicyclePainter(PVector origin)
  {
    this.origin = origin;

    var posX = 7.2 / 5 * this.origin.x;
    var position = new PVector(posX, 0);
    this.wavePattern = new WavePattern(position);

    var approximation = 9;
    this.circleStruct = new CircleStruct(approximation);
  }

  /* Function definition */
  public void animate()
  {
    this.circleStruct.animate();

    var posY = this.circleStruct.getWavePoint();
    this.wavePattern.addPoint(posY);
  }

  public void render()
  {
    pushMatrix();
    translate(this.origin.x, this.origin.y);

    noFill();
    strokeWeight(2);

    var posX = this.wavePattern.getPosition().x;
    var posY = this.wavePattern.getPoint(0);
    var endPoint = new PVector(posX, posY);
    this.circleStruct.render(endPoint);
    this.wavePattern.render();
    popMatrix();
  }
}
