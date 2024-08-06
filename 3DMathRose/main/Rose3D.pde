class Rose3D
{

  private int density;

  private PVector range;
  private float roseRadius;
  private ArrayList<RosePoint> rosePoints;
  
  private float time;
  private float deltaTime;

  /* Constructor definition */
  public Rose3D(int density)
  {
    this.density = density;

    var rX = PI / 2;
    var rY = PI / 2;
    var rZ = PI / 2;
    this.range = new PVector(rX, rY, rZ);

    this.roseRadius = 9 * TAU;
    this.rosePoints = new ArrayList<RosePoint>();
    
    this.time = 0f;
    this.deltaTime = 0.003f;
  }

  /* Function definition */
  public void animate()
  {
    if (this.rosePoints != null)
    {
      this.rosePoints.clear();
      this.createRose();
      this.time += this.deltaTime;
    }
  }

  private void createRose()
  {
    for (int x = 0; x < this.density; x++)
    {
      for (int y = 0; y < this.density; y++)
      {
        for (int z = 0; z < this.density; z++)
        {
          var posX = map(x, 0, this.density, -this.range.x, this.range.x);
          var posY = map(y, 0, this.density, -this.range.y, this.range.y);
          var posZ = map(z, 0, this.density, -this.range.z, this.range.z);
          var position = new PVector(posX, posY, posZ);

          var sphericalV = new Spherical(position);
          position = sphericalV.get3DPosition(position, this.time);
          var radius = sphericalV.rho;
          
          var origin = new PVector();
          var distance = position.sub(origin);
          distance.mult(radius);

          var noiseValue = noise(distance.mag());
          var hue = map(noiseValue, 0, 1, 0, 360);
          position.mult(this.roseRadius);

          this.rosePoints.add(new RosePoint(position, hue));
        }
      }
    }
  }

  public void render()
  {
    if (this.rosePoints != null)
    {
      for (var galaxyPoint : this.rosePoints)
        galaxyPoint.render();
    }
  }
}
