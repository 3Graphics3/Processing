class Rotation
{

  private Utility utility;

  /* Constructor definition */
  public Rotation()
  {
    this.utility = new Utility();
  }

  /* Function definition */
  public PVector rotateAround(PVector vector,
    float angle, String plane)
  {
    var rotationMap = this.getRotationMap(angle);
    var rotationMatrix = rotationMap.get(plane);
    return this.utility.multiply(rotationMatrix, vector);
  }

  private HashMap<String, float[][]> getRotationMap(float angle)
  {
    var rotationMap = new HashMap<String, float[][]>();

    var rotationMatrix = new float[][] {
      {cos(angle), -sin(angle), 0},
      {sin(angle), cos(angle), 0},
      {0, 0, 1}
    };
    var planeString = "xy";
    rotationMap.put(planeString, rotationMatrix);

    rotationMatrix = new float[][] {
      {cos(angle), 0, -sin(angle)},
      {0, 1, 0},
      {sin(angle), 0, cos(angle)}
    };
    planeString = "xz";
    rotationMap.put(planeString, rotationMatrix);

    rotationMatrix = new float[][] {
      {1, 0, 0},
      {0, cos(angle), -sin(angle)},
      {0, sin(angle), cos(angle)}
    };
    planeString = "yz";
    rotationMap.put(planeString, rotationMatrix);

    return rotationMap;
  }
}
