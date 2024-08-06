class PolarFlower
{

  private int frequency;

  private int currentLeaf;
  private ArrayList<Leaf> leafs;

  /* Constructor definition */
  public PolarFlower(int frequency)
  {
    this.frequency = frequency;

    this.currentLeaf = 0;
    this.leafs = new ArrayList<Leaf>();
  }

  /* Function definition */
  public void animate()
  {
    for (int f = 0; f < this.frequency; f++)
    {
      this.createNewLeaf(this.currentLeaf);
      this.currentLeaf++;
    }

    if (this.leafs != null)
    {
      for (var leaf : this.leafs)
        leaf.animate();
    }
  }

  private void createNewLeaf(int index)
  {
    /*
     * Below lie some parametric functions,
     * that when assigned to the indexFactor,
     * some really amazing shapes emerge:
     *
     * --> k
     * --> sin(k)
     * --> tan(k)
     * --> log(k)
     * --> pow(k, n), n (e) (0, 1)
     * --> k % pow(k, n), n (e) (0, 1):
     *
     * For some unknown reason, when n = 0.99
     * | n = 0.999, the flower produces some
     * curves, that beautify the shape even
     * more!!
     */
    var indexFactor = pow(index, 0.99);
    var factor = 137.6f;
    var angle = indexFactor * factor;
    var theta = radians(angle);

    var sineValue = sin(theta);
    var hue = map(sineValue, -1, 1, 0, 360);

    var radius = pow(index + PI, 0.81);
    var posX = radius * cos(theta);
    var posY = radius * sin(theta);
    var position = new PVector(posX, posY);

    this.leafs.add(new Leaf(position, hue));
  }

  public void render()
  {
    if (this.leafs != null)
    {
      pushMatrix();
      translate(width / 2, height / 2);

      for (var leaf : this.leafs)
        leaf.render();
      popMatrix();
    }
  }
}
