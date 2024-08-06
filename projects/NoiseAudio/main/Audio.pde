import java.util.Collections;

class NoiseAudio
{

  private ArrayList<Disc> discs;

  /* Constructor definition. */
  public NoiseAudio(int numberOfDiscs)
  {
    this.createDiscs(numberOfDiscs);
    Collections.reverse(this.discs);
  }

  /* Function definition. */
  private void createDiscs(int numberOfDiscs)
  {
    this.discs = new ArrayList<Disc>();

    for (int d = 0; d < numberOfDiscs; d++)
    {
      var posX = width / 2;
      var posY = height / 2;
      var position = new PVector(posX, posY);
      var radius = PI + pow(PI, 5) * d / numberOfDiscs;
      var id = d;

      this.discs.add(new Disc(position, radius, id));
    }
  }

  public void animate()
  {
    if (this.discs != null)
    {
      for (var disc : this.discs)
        disc.animate();
    }
  }

  public void render()
  {
    if (this.discs != null)
    {
      for (var disc : this.discs)
        disc.render();
    }
  }
}
