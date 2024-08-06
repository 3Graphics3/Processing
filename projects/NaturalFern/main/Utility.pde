class Utility
{

  private HashMap<String, ConstMatrix> matrixMap;

  /* Constructor definition */
  public Utility()
  {
    this.createMatrixMap();
  }

  /* Function definition */
  private void createMatrixMap()
  {
    this.matrixMap = new HashMap<String, ConstMatrix>();

    var rangeString = "0.00-0.06";
    var const0 = new Matrix2(0, 0, 0.199, 0.159);
    var const1 = new PVector(0, 0);
    var constMatrix = new ConstMatrix(const0, const1);
    this.matrixMap.put(rangeString, constMatrix);

    rangeString = "0.06-0.69";
    const0 = new Matrix2(0.72, 0.039, -0.15, 0.84);
    const1 = new PVector(0, (1 + sqrt(5)) / 2);
    constMatrix = new ConstMatrix(const0, const1);
    this.matrixMap.put(rangeString, constMatrix);

    rangeString = "0.69-0.87";
    const0 = new Matrix2(0.3, -0.231, 0.282, 0.273);
    const1 = new PVector(0, 0.93);
    constMatrix = new ConstMatrix(const0, const1);
    this.matrixMap.put(rangeString, constMatrix);

    rangeString = "0.87-1.00";
    const0 = new Matrix2(-0.153, 0.182, 0.282, 0.252);
    const1 = new PVector(0, 0.84);
    constMatrix = new ConstMatrix(const0, const1);
    this.matrixMap.put(rangeString, constMatrix);
  }

  public PVector getNextPoint(PVector previous)
  {
    var probability = random(1);
    var rangeString = this.getRangeString(probability);
    var constMatrix = this.matrixMap.get(rangeString);
    return constMatrix.transform(previous);
  }

  private String getRangeString(float probability)
  {
    if (probability < 0.06) return "0.00-0.06";
    if (probability < 0.69) return "0.06-0.69";
    if (probability < 0.87) return "0.69-0.87";
    return "0.87-1.00";
  }
}
