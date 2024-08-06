class Spaceship
{

  private PVector position;
  private PVector velocity;
  private PVector acceleration;

  private float radius;
  private float mass;

  private float maxSpeed;
  private float angle;
  private float damping;

  private boolean boost = false;

  /* Constructor definition */
  public Spaceship(float radius, PVector position)
  {
    this.radius = radius * 2;
    this.mass = HALF_PI * (float)Math.sqrt(this.radius);

    this.position = position;
    this.velocity = new PVector();
    this.acceleration = new PVector();

    this.maxSpeed = 12f;
    this.angle = 0f;
    this.damping = 0.994f;
  }

  /* Function definition */
  public void applyForce(PVector outerForce)
  {
    var force = PVector.div(outerForce, this.mass);
    this.acceleration.add(force);
  }

  public void fly()
  {
    this.velocity.add(this.acceleration);
    this.velocity.mult(this.damping);
    this.velocity.limit(this.maxSpeed);
    this.position.add(this.velocity);

    this.acceleration.mult(0);
  }

  public void thrust()
  {
    this.boost = true;

    var thrustAngle = this.angle - PI / 2;
    var thrust = new PVector(cos(thrustAngle), sin(thrustAngle));
    thrust.mult(3.9);

    this.applyForce(thrust);
  }

  public void turn(float deltaAngle)
  {
    this.angle += deltaAngle;
  }

  public void checkBounds()
  {
    if (this.position.x >= width - this.radius)
      this.position.x = width - this.radius;

    if (this.position.x <= this.radius)
      this.position.x = this.radius;

    if (this.position.y >= height - this.radius)
      this.position.y = height - this.radius;

    if (this.position.y <= this.radius)
      this.position.y = this.radius;
  }

  public void show()
  {
    pushMatrix();
    translate(this.position.x, this.position.y);
    rectMode(CENTER);
    rotate(this.angle);

    this.createBoosters();
    this.createBody();
    popMatrix();

    this.boost = false;
  }

  private void createBoosters()
  {
    fill(255, 90);

    strokeWeight(2);
    if (this.boost)
      fill(180, 0, 0, 120);

    rect(-this.radius / 3, this.radius / 1.7,
         this.radius / 5.4, this.radius / 5.4);
    rect(this.radius / 3, this.radius / 1.7,
         this.radius / 5.4, this.radius / 5.4);
  }

  private void createBody()
  {
    fill(255, 150);
    noStroke();

    var vertice1 = new PVector(0, -this.radius / 2);
    var vertice2 = new PVector(-this.radius / 2, this.radius / 2);
    var vertice3 = new PVector(this.radius / 2, this.radius / 2);

    triangle(vertice1.x, vertice1.y,
             vertice2.x, vertice2.y,
             vertice3.x, vertice3.y);
  }
  
}
