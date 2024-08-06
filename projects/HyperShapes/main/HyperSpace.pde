class HyperSpace
{

  private HyperVector vectorX;
  private HyperVector vectorY;

  /* Constructor definition */
  public HyperSpace()
  {
    this.createAxesVectors();
  }

  /* Function definition */
  private void createAxesVectors()
  {
    /*
     * The following parameters are of the form
     * [f, a, b, n1, n2, n3], where each variable
     * defines a certain aspect of the resulting
     * hyper-shape. Below are given some examples
     * that produce, unique and mesmerizing shapes!
     *
     * --> [[7, 1, 1, 1.7, 0.2, 1.7], same]
     * --> [[13, 1, 1, PI / 4, 0.6, 0.12], same]
     * --> [[PI, PI / 3, PI / 2, 1 / (2 * PI), 1.65, 1], same]
     * --> [[[TAU, 1, 1, PI / 12, 1, 2.1], same]
     */
    this.vectorX = new HyperVector(13, 1, 1, PI / 4, 0.6, 0.12);
    this.vectorY = new HyperVector(13, 1, 1, PI / 4, 0.6, 0.12);
  }

  public PVector getPosition(PVector theta)
  {
    /*
     * Changing the signs of the powers of
     * the trigonometric equations below,
     * produce, some really interesting
     * results! The possible values, of the
     * form (n, m), are given below:
     *
     * --> [1, 1]
     * --> [-1, 1]
     * --> [1, -1]
     * --> [-1, -1]
     */
    var n = 1;
    var m = -1;

    /*
     * Below are given some equations, of the form
     * [posX, posY, posZ], that produce
     * amazing and intricate super-shapes:
     *
     * Using only combinations of 2 equations we have:
     *
     * --> [pow(cos(theta.x | y), n) * pow(sin(theta.y | x), m),;
     *      pow(sin(theta.x | y), n) * pow(sin(theta.y | x), m),;
     *      pow(sin(theta.y | x), m)];
     *
     * Using only combinations of 3 equations we have:
     *
     * --> [pow(cos(theta.x), n) * pow(sin(theta.y), m) * pow(sin(theta.y), m),;
     *      pow(sin(theta.x), n) * pow(sin(theta.y), m) * pow(cos(theta.x), n),;
     *      pow(sin(theta.y), m) * pow(cos(theta.x), n)];
     *
     * We can then multiply the equation of the 3rd plane(Z axis), with one of
     * the following power equations: [pow(cos(theta.x, n | m),
     *                                 pow(sin(theta.y, n | m),
     *                                 pow(tan(theta.x | y), n | m),
     *                                 pow(floor(theta.x | y), n | m),
     *                                 pow((float)Math.cbrt(theta.x | y), n | m),
     *                                 pow((float)Math.cosh(theta.x | y), n | m),
     *                                 pow((float)Math.sinh(theta.x | y), n | m),
     *                                 pow((float)Math.tanh(theta.x | y), n | m)]
     *
     * In order to create more intricate shapes we can follow
     * the corresponding symmetric examples:
     *
     * sin(x | y) ^ n, cos(x | y) ^ m,
     * sin(x | y) ^ m, cos(x | y) ^ m,
     * sin(x | y) ^ n, cos(x | y) ^ n,
     * sin(x | y) ^ m, cos(x | y) ^ n,
     * ||
     * cos(x | y) ^ n, sin(x | y) ^ m,
     * cos(x | y) ^ m, sin(x | y) ^ m,
     * cos(x | y) ^ n, sin(x | y) ^ n,
     * cos(x | y) ^ m, sin(x | y) ^ n,
     *
     * Another option is to play with either the theta
     * or the exponents, using the following matrix
     * tables as maps, for the equations above:
     *
     * [n, m, m     [m, n, n     [x, y, y     [y, x, x
     *  m, n, m  or  n, m, n  or  y, x, y  or  x, y, x
     *  m, m, n]     n, n, m]     y, y, x]     x, x, y]
     */

    var sinXN = pow(sin(theta.x), n);
    var sinXM = pow(sin(theta.x), m);
    var sinYN = pow(sin(theta.y), n);
    var sinYM = pow(sin(theta.y), m);

    var cosXN = pow(cos(theta.x), n);
    var cosXM = pow(cos(theta.x), m);
    var cosYN = pow(cos(theta.y), n);
    var cosYM = pow(cos(theta.y), m);

    /*
     * [(cosXM * sinYN * sinYN), (sinYN * sinXN * cosYM), (sinYN * cosYM * cosXN)]
     * [(cosXN * cosYN), (sinXN * cosYN), (sinYN)]
     * [(cosXM * sinYN * sinYN), (sinYN * sinXN * cosYM), (sinYN * cosYM * cosXN)]
     * [(cosXM * sinYN * sinYN), (sinYN * sinXN * cosYM), (sinYN * cosYM * cosXN)]
     */

    var trigXFactor = cosXM * sinYN * sinYN;
    var trigYFactor = sinYN * sinXN * cosYM;
    var trigZFactor = sinYN * cosYM * cosXN;

    var rX = this.vectorX.getSuperRadius(theta.x);
    var rY = this.vectorY.getSuperRadius(theta.y);

    var scaleX = rX * rY;
    var scaleY = rX * rY;
    var scaleZ = rX * rY;

    var posX = scaleX * trigXFactor;
    var posY = scaleY * trigYFactor;
    var posZ = scaleZ * trigZFactor;
    var position = new PVector(posX, posY, posZ);

    var scalar = 369f;
    position.mult(scalar);

    return position;
  }
}
