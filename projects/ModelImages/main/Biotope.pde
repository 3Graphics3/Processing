class Biotope extends Pixeltope
{

  private BioSystem bioSystem;

  /* Constructor definition */
  public Biotope(String imagePath, int resolution)
  {
    super(imagePath, resolution);
    this.bioSystem = new BioSystem();
  }

  /* Function definition */
  public void generate()
  {
    var posX = random(super.bioImage.width);
    var posY = random(super.bioImage.height);
    var origin = new PVector(posX, posY);

    var range = super.pixelDim.x * super.pixelDim.y;
    var radius = random(range - 1, range + 1);
    var bioColor = this.pickBioColor(origin);

    this.bioSystem.generateOrganism(origin, radius, bioColor);
  }

  public void grow()
  {
    this.bioSystem.grow();
  }

  private color pickBioColor(PVector origin)
  {
    var minimumDistance = pow(PI, 9);
    var closestBioCell = super.biotope.get(0);
    for (var bioCell : super.biotope)
    {
      var pointA = origin;
      var pointB = bioCell.origin;
      var currentDistance = this.originDistance(pointA, pointB);

      if (currentDistance <= minimumDistance)
      {
        minimumDistance = currentDistance;
        closestBioCell = bioCell;
      }
    }

    return closestBioCell.bioColor;
  }

  private float originDistance(PVector pointA, PVector pointB)
  {
    var distXSquared = pow(pointA.x - pointB.x, 2);
    var distYSquared = pow(pointA.y - pointB.y, 2);

    return sqrt(distXSquared + distYSquared);
  }

  public void render()
  {
    this.bioSystem.render();
  }
}
