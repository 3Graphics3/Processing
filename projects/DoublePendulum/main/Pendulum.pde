class Pendulum
{

  private float wireLength;
  private float delta1Theta;
  private float theta;

  private Ball ball;

  /* Constructor definition */
  public Pendulum(float theta, float wireLength)
  {
    this.wireLength = wireLength;
    this.delta1Theta = 0f;
    this.theta = theta;

    var mass = 0.54 * this.wireLength;
    this.ball = new Ball(mass);
  }

  /* Function definition */
  public float getLength()
  {
    return this.wireLength;
  }

  public float getAngle()
  {
    return this.theta;
  }
  
  public Ball getBall()
  {
    return this.ball;
  }

  public void animate(float delta2Theta, PVector start)
  {
    this.delta1Theta += delta2Theta;
    this.theta += this.delta1Theta;

    var posX = start.x + this.wireLength * sin(this.theta);
    var posY = start.y + this.wireLength * cos(this.theta);
    this.ball.animate(new PVector(posX, posY));
  }

  public void render(PVector wirePosition)
  {
    this.renderWire(wirePosition);
    this.ball.render();
  }

  private void renderWire(PVector wirePosition)
  {
    noFill();
    stroke(255);
    strokeWeight(5);
    line(wirePosition.x, wirePosition.y, this.ball.getPosition().x,
      this.ball.getPosition().y);
  }
}
