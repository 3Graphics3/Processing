class SpaceDome
{

  private float theta;
  private float deltaTheta;

  private Star[] space;

  /* Constructor definition */
  public SpaceDome(int numberOfStars)
  {
    this.theta = 0f;
    this.deltaTheta = PI / (2 * 321);

    this.createSpaceDome(numberOfStars);
  }

  /* Function definition */
  private void createSpaceDome(int numberOfStars)
  {
    this.space = new Star[numberOfStars];

    var scalar = pow(PI, 4);
    for (int s = 0; s < this.space.length; s++)
    {
      var radius = random(PI / 4, 4 * PI);
      radius *= scalar;

      var position = PVector.random3D();
      position.normalize();
      position.mult(radius);

      this.space[s] = new Star(position);
    }
  }

  public void animate()
  {
    if (this.space != null)
    {
      for (var star : this.space) star.animate();
      this.theta += this.deltaTheta;
    }
  }

  public void render()
  {
    if (this.space != null)
    {
      pushMatrix();
      rotate(this.theta);

      noFill();
      for (var star : this.space)
        star.render();
      popMatrix();
    }
  }
}
