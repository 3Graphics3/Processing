class Pendulum
{

  private PVector origin;
  private PVector objPosition;

  private float ropeLength;
  private float radius;
  private float mass;

  private float angle;
  private float angularVelocity;
  private float angularAcceleration;

  private float dampingRate;

  private boolean isDragged;

  /* Constructor definition */
  public Pendulum(PVector origin, float ropeLength, float startAngle)
  {
    this.origin = origin;

    this.ropeLength = ropeLength;
    this.radius = 0.36 * ropeLength;
    this.mass = PI * (float)Math.pow(this.radius, 0.9);

    this.angle = startAngle;
    this.angularVelocity = 0f;
    this.angularAcceleration = 0f;

    var objX = this.ropeLength * sin(this.angle);
    var objY = this.ropeLength * cos(this.angle);
    this.objPosition = new PVector(objX, objY);

    this.dampingRate = 0.996f;
  }

  /* Function definition */
  public void checkDrag(PVector mousePosition)
  {
    var mapMouseX = mousePosition.x - this.origin.x;
    var mapMouseY = mousePosition.y - this.origin.y;
    var mappedMousePosition = new PVector(mapMouseX, mapMouseY);

    var isHorizontallyAttached = (mappedMousePosition.x > this.objPosition.x - this.radius &&
                                  mappedMousePosition.x < this.objPosition.x + this.radius);
    var isVerticallyAttached = (mappedMousePosition.y > this.objPosition.y - this.radius &&
                                mappedMousePosition.y < this.objPosition.y + this.radius);

    this.isDragged = (isHorizontallyAttached && isVerticallyAttached);
  }

  public void drag()
  {
    if (this.isDragged)
    {
      var mappedMousePosition = new PVector(mouseX, mouseY);
      var pendulumDirection = PVector.sub(this.origin, mappedMousePosition);

      this.angle = atan2(-pendulumDirection.y, pendulumDirection.x) - HALF_PI;
    }
  }

  public void stopDrag()
  {
    this.angularVelocity = 0f;
    this.isDragged = false;
  }
  
  public void swing()
  {
    var forces = new Forces(this);
    var gravity = forces.getGravity(true);

    this.angularAcceleration = -gravity.y * sin(this.angle) / this.ropeLength;
    this.angularVelocity += this.angularAcceleration;
    this.angle += this.angularVelocity;

    this.angularVelocity *= this.dampingRate;
  }

  public void show()
  {
    pushMatrix();
    translate(this.origin.x, this.origin.y);

    var objX = this.ropeLength * sin(this.angle);
    var objY = this.ropeLength * cos(this.angle);
    this.objPosition.set(objX, objY);

    this.renderRope();
    this.renderObject();

    popMatrix();
  }

  private void renderRope()
  {
    stroke(255, 180);
    strokeWeight(4);
    line(0, 0, this.objPosition.x, this.objPosition.y);
  }

  private void renderObject()
  {
    noStroke();
    fill(30, 90, 60);
    circle(this.objPosition.x, this.objPosition.y, this.radius);
  }
}
