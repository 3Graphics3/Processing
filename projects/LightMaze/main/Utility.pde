class Utility
{

  /* Constructor definition */
  public Utility()
  {
  }

  /* Function definition */
  public PVector findIntersection(PVector position, Beam beam,
    ArrayList<Barrier> barriers)
  {
    var closestPoint = position;
    var minDistance = pow(2, 64);

    for (var barrier : barriers)
    {
      var intersection = beam.getIntersection(barrier);
      if (intersection == null) continue;

      var pointA = position;
      var pointB = intersection;
      var distance = this.getDistance(pointA, pointB);

      var collisionPointIsCloser = (distance <= minDistance);
      if (collisionPointIsCloser)
      {
        minDistance = distance;
        closestPoint = intersection;
      }
    }

    return closestPoint;
  }

  private float getDistance(PVector pointA, PVector pointB)
  {
    var diffXSquared = pow(pointA.x - pointB.x, 2);
    var diffYSquared = pow(pointA.y - pointB.y, 2);
    return sqrt(diffXSquared + diffYSquared);
  }
}
