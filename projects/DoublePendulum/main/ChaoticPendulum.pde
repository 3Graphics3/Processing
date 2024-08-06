class ChaoticPendulum
{

  private Utility utility;

  private PVector position;
  private Pendulum top;
  private Pendulum bottom;

  /* Constructor definition */
  public ChaoticPendulum()
  {
  }

  public ChaoticPendulum(PVector position)
  {
    this.utility = new Utility();

    this.position = position;
    this.createSystem();
  }

  /* Function definition */
  private void createSystem()
  {
    var theta = PI / 2;
    var wireLength = pow(PI, 4.2);
    this.top = new Pendulum(theta, wireLength);

    theta = PI;
    wireLength = pow(PI, 4.2);
    this.bottom = new Pendulum(theta, wireLength);
  }

  public Pendulum getBottomPendulum()
  {
    return this.bottom;
  }

  public void animate()
  {
    var r1 = this.top.wireLength;
    var r2 = this.bottom.wireLength;
    var radiusVector = new PVector(r1, r2);

    var m1 = this.top.ball.mass;
    var m2 = this.bottom.ball.mass;
    var massVector = new PVector(m1, m2);

    var a1 = this.top.theta;
    var a2 = this.bottom.theta;
    var angleVector = new PVector(a1, a2);

    var a1V = this.top.delta1Theta;
    var a2V = this.bottom.delta1Theta;
    var angularVelocityVector = new PVector(a1V, a2V);

    var angularVector = this.utility.getAngularVector(radiusVector, massVector,
      angleVector, angularVelocityVector);

    var start = new PVector();
    this.top.animate(angularVector.x, start);

    start = this.top.getBall().getPosition();
    this.bottom.animate(angularVector.y, start);
  }

  public void render()
  {
    pushMatrix();
    translate(this.position.x, this.position.y);

    var start = new PVector();
    this.top.render(start);

    start = this.top.getBall().getPosition();
    this.bottom.render(start);

    popMatrix();
  }
}
