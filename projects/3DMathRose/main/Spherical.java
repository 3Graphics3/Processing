class Spherical
{

  private float rho;
  private float theta;
  private float phi;

  /* Constructor definition */
  public Spherical(PVector vector)
  {
    this.rho = 0f;
    this.theta = 0f;
    this.phi = 0f;

    this.convertToSpherical(vector);
  }

  /* Function definition */
  private void convertToSpherical(PVector vector)
  {
    var x = vector.x;
    var y = vector.y;
    var z = vector.z;

    var xSquaredPlusYSquared = pow(x, 2) + pow(y, 2);
    this.rho = sqrt(xSquaredPlusYSquared + pow(z, 2));
    this.theta = atan2(sqrt(xSquaredPlusYSquared), z);
    this.phi = atan2(y, x);
  }

  public PVector get3DPosition(PVector initialV, float time)
  {
    /*
     * Changing the factor variable,
     * produces some really interesting
     * rose patterns! Some example values,
     * are given below:
     *
     * --> PI / 2
     * --> 3 * PI
     * --> PI / 3
     * --> 2 * PI
     */
    var n = 1f/3;
    var sinTheta = sin(this.theta * time);
    var cosTheta = cos(this.theta * time);
    var sinPhi = sin(this.phi * time);
    var cosPhi = cos(this.phi * time);

    /*
     * The following parametric equations, that
     * correspond to the list [posX, posY, posZ],
     * result in really beautiful and
     * interesting galactic shapes, that look
     * like the fabric of space and time!:
     *
     */
    var posX = sinTheta * cosPhi;
    var posY = sinTheta * sinPhi;
    var posZ = cosTheta;
    var newPosition = new PVector(posX, posY, posZ);

    /*
     * The radius can be multiplied with either
     * sin(n * this.theta) | cos(n * this.theta)
     * or with both of them, depending on the value
     * of the factor.
     */
    var radius = 3 * TAU;
    radius *= sin(2 * this.theta);

    newPosition.mult(radius);
    newPosition.dot(initialV);

    return newPosition;
  }
}
