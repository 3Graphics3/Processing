class FernPoint
{

  private PVector position;

  /* Constructor definition */
  public FernPoint(PVector position)
  {
    this.position = position;
    this.normalizeCenter();
  }

  /* Function definition */
  private void normalizeCenter()
  {
    var phi = (1 + sqrt(5)) / 2;
    var posX = map(this.position.x, -PI, PI, 0, width);
    var posY = map(this.position.y, 0, TAU * phi, height, 0);
    this.position = new PVector(posX, posY);
  }

  public void render()
  {
    var posX = width / 2;
    var posY = height;
    var center = new PVector(posX, posY);
    var originDistance = PVector.sub(center, position);
    var noiseValue = noise(originDistance.mag());
    var alpha = map(noiseValue, 0, 1, 255, 0);

    noiseValue = noise(this.position.x);
    var hue = map(noiseValue, 0, 1, 0, 360);

    pushMatrix();
    translate(this.position.x, this.position.y);

    noFill();
    strokeWeight(2);
    stroke(hue, 255, 255, alpha);

    point(0, 0);
    popMatrix();
  }
}
