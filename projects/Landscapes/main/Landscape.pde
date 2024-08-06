class Landscape
{

  private int resolution;
  private int sideLength;
  private float spacing;

  private Vertice[][] borderLand;
  private ArrayList<ArrayList<Vertice>> innerLand;

  private NoiseField noiseField;
  private Utility utility;

  /* Constructor definition */
  public Landscape(int resolution)
  {
    this.resolution = resolution;
    this.sideLength = width / this.resolution;

    /*
     * Alternative values for spacing, in
     * order to create some really aesthetic
     * view in the eyes of the spectator:
     *
     * --> 0.39f
     * --> 1.2f
     */
    this.spacing = 0.39f;

    this.createBorderLand();
    this.innerLand = new ArrayList<ArrayList<Vertice>>();

    this.noiseField = new NoiseField(this.resolution);
    this.utility = new Utility(this.sideLength);
  }

  /* Function definition */
  private void createBorderLand()
  {
    this.borderLand = new Vertice[this.resolution][this.resolution];
    var padding = this.sideLength / 2;

    for (int row = 0; row < this.resolution; row++)
    {
      var posX = row * this.sideLength + padding;
      for (int col = 0; col < this.resolution; col++)
      {
        var posY = col * this.sideLength + padding;
        var position = new PVector(posX, posY);
        var sideLength = this.spacing * this.sideLength;
        var weight = random(-1, 1);
        this.borderLand[row][col] = new Vertice(position, sideLength, weight);
      }
    }
  }

  public void update()
  {
    this.noiseField.update();
    this.updateBorderLand();
    this.updateInnerLand();
  }

  private void updateBorderLand()
  {
    if (this.borderLand != null)
    {
      for (int row = 0; row < this.resolution; row++)
      {
        for (int col = 0; col < this.resolution; col++)
        {
          var noiseWeight = this.noiseField.getValue(row, col);
          this.borderLand[row][col].weight = noiseWeight;
        }
      }
    }
  }

  private void updateInnerLand()
  {
    this.innerLand.clear();

    for (int row = 0; row < this.resolution; row += 2)
    {
      for (int col = 0; col < this.resolution; col += 2)
      {
        var innerPoints = this.getInnerPoints(row, col);
        this.innerLand.add(innerPoints);
      }
    }
  }

  private ArrayList<Vertice> getInnerPoints(int row, int col)
  {
    var position = this.borderLand[row][col].origin;
    var pointMap = this.utility.constructPointMap(position);

    var weights = new int[4];
    weights[0] = ceil(this.borderLand[row][col].weight);
    weights[1] = ceil(this.borderLand[row + 1][col].weight);
    weights[2] = ceil(this.borderLand[row + 1][col + 1].weight);
    weights[3] = ceil(this.borderLand[row][col + 1].weight);

    var binaryString = this.utility.toStringArray(weights);
    return pointMap.get(binaryString);
  }

  public void render()
  {
    this.renderBorderLand();
    this.renderInnerLand();
  }

  private void renderBorderLand()
  {
    if (this.borderLand != null)
    {
      for (int row = 0; row < this.resolution; row++)
        for (int col = 0; col < this.resolution; col++)
          this.borderLand[row][col].render();
    }
  }

  private void renderInnerLand()
  {
    if (this.innerLand != null)
    {
      for (var innerCell : this.innerLand)
        this.connectInnerPoints(innerCell);
    }
  }

  private void connectInnerPoints(ArrayList<Vertice> innerCell)
  {
    var noPointExists = (innerCell.size() == 0);
    if (noPointExists) return;

    strokeWeight(5);
    stroke(150, 255);

    var onlyTwoPointsExist = (innerCell.size() == 2);
    if (onlyTwoPointsExist)
    {
      var pointA = innerCell.get(0);
      var pointB = innerCell.get(1);

      this.utility.pointLine(pointA.origin, pointB.origin);
      return;
    }

    var pointA = innerCell.get(0);
    var pointA1 = innerCell.get(1);
    var pointB = innerCell.get(2);
    var pointB1 = innerCell.get(3);

    this.utility.pointLine(pointA.origin, pointA1.origin);
    this.utility.pointLine(pointB.origin, pointB1.origin);
  }
}
