class Direction
{

  private HashMap<Integer, PVector> motionMap;

  /* Constructor definition */
  public Direction()
  {
    this.motionMap = new HashMap<Integer, PVector>();

    this.motionMap.put(0, new PVector(-1, 0)); // Left
    this.motionMap.put(1, new PVector(1, 0));  // Right
    this.motionMap.put(2, new PVector(0, -1)); // Up
    this.motionMap.put(3, new PVector(0, 1));  // Down
  }

  /* Function definition */
  public PVector getVector(int randomNumber)
  {
    return this.motionMap.get(randomNumber);
  }
}
