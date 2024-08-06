import megamu.mesh.*;

class Mosaic
{

  private Utility utility;
  private Region[] regions;

  /* Constructor definition */
  public Mosaic(int totalRegions)
  {
    this.utility = new Utility();
    
    this.createSeedPoints(totalRegions);
    this.createMosaic();
  }

  /* Function definition */
  private void createSeedPoints(int totalRegions)
  {
    this.regions = new Region[totalRegions];

    for (int p = 0; p < this.regions.length; p++)
    {
      var posX = random(width);
      var posY = random(height);
      var centroid = new PVector(posX, posY);
      var id = p;

      this.regions[p] = new Region(centroid, id);
    }
  }

  private void createMosaic()
  {
    var centroids = new PVector[this.regions.length];
    for (int r = 0; r < this.regions.length; r++)
      centroids[r] = this.regions[r].getCentroid();

    var floatMatrix = this.utility.toFloatMatrix(centroids);
    var mosaic = new Voronoi(floatMatrix);

    var polygonRegions = mosaic.getRegions();
    for (int r = 0; r < this.regions.length; r++)
      this.regions[r].contour = polygonRegions[r];
  }

  public void animate()
  {
    if (this.regions != null)
    {
      for (var region : this.regions)
        region.animate();
    }
  }

  public void render()
  {
    if (this.regions != null)
    {
      for (var region : this.regions)
        region.render();
    }
  }
}
