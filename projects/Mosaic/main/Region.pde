class Region
{

  private PVector centroid;
  private int id;

  private MPolygon contour;

  private float hue;
  private float deltaHue;
  private float deltaPrimeHue;

  /* Constructor definition */
  public Region(PVector centroid, int id)
  {
    this.centroid = centroid;
    this.id = id;

    this.hue = 0f;
    this.deltaHue = 0f;
    this.deltaPrimeHue = PI / 321;
  }

  /* Function definition */
  public PVector getCentroid()
  {
    return this.centroid;
  }
  
  public void animate()
  {
    var sineValue = sin(this.id + this.deltaHue);
    this.hue = map(sineValue, -1, 1, 0, 360);

    this.deltaHue += this.deltaPrimeHue;
  }

  public void render()
  {
    /*
     * If we "remove" the contour rendering,
     * then a star sky appears to come to
     * life, due to the centroids.
     */
    
    this.renderContour();
    //this.renderCentroid();
  }

  private void renderContour()
  {
    strokeWeight(3);
    stroke(0, 150);

    beginShape();
    var contourPoints = this.contour.getCoords();
    for (int c = 0; c < this.contour.count(); c++)
    {
      var posX = contourPoints[c][0];
      var posY = contourPoints[c][1];

      fill(this.hue, 153, 180);
      vertex(posX, posY);
    }
    endShape(CLOSE);
  }

  private void renderCentroid()
  {
    noFill();
    strokeWeight(3);
    stroke(this.hue);

    point(this.centroid.x, this.centroid.y);
  }
}
