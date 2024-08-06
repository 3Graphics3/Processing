class Planet extends Attractor
{

  private PVector velocity;
  private PVector acceleration;

  private Clock clockId;
  private float time;

  private float maxVelocity;

  /* Constructor definition */
  public Planet(PVector position, float radius, Clock clockId)
  {
    super(position, radius);

    this.velocity = new PVector();
    this.acceleration = new PVector();

    this.clockId = clockId;
    this.time = 0f;

    this.maxVelocity = PI * this.radius / 3;
  }

  /* Function definition */
  public void applyForce(PVector outerForce)
  {
    var force = PVector.div(outerForce, this.mass);
    this.acceleration.add(force);
  }

  public void orbit()
  {
    this.updateMass();

    this.velocity.add(this.acceleration);
    this.velocity.limit(this.maxVelocity);
    this.position.add(this.velocity);

    this.acceleration.mult(0);
  }

  private void updateMass()
  {
    if (this.clockId == Clock.Seconds) this.time = second();
    else if (this.clockId == Clock.Minutes) this.time = minute();
    else this.time = hour() % 12;
  }

  public void show()
  {
    pushMatrix();
    translate(this.position.x, this.position.y);

    noStroke();
    var hue = map(sin(this.time), -1, 1, 0, 255);
    fill(hue, 255, 255, 180);
    textSize(2 * this.radius);

    text(this.getTimeText(), 0, 0);
    popMatrix();
  }

  private String getTimeText()
  {
    var timeText = (int)this.time + " ";
    if (this.clockId == Clock.Seconds) timeText += "s";
    else if (this.clockId == Clock.Minutes) timeText += "m";
    else timeText += "h";

    return timeText;
  }
}
