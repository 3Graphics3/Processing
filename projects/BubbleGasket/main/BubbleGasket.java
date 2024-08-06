class BubbleGasket
{

  private Utility utility;

  private int currentDepth;
  private int gasketMapDepth;
  private ArrayList<Bubble[]> gasketMap;

  private ArrayList<Bubble> gasket;

  /* Constructor definition */
  public BubbleGasket(int gasketMapDepth)
  {
    this.utility = new Utility();

    this.currentDepth = 0;
    this.gasketMapDepth = gasketMapDepth;
    this.createGaskets();
  }

  /* Function definition */
  private void createGaskets()
  {
    this.initializeGaskets();
    this.constructGaskets();
  }

  private void initializeGaskets()
  {
    this.gasketMap = new ArrayList<Bubble[]>();
    this.gasket = new ArrayList<Bubble>();

    var cX = 0.5 * width;
    var cY = 0.5 * height;
    var center = new Complex(cX, cY);
    var radius = 300f;
    var bend = -1 / radius;
    var b0 = new Bubble(center, bend);
    this.gasket.add(b0);

    /*
     * Below are given some special
     * values that produce an aesthetic
     * gasketMap of bubbles:
     *
     * --> 0.25
     * --> 0.36
     * --> 0.5
     */
    var percent = 0.36;
    radius = percent * b0.radius;
    bend = 1 / radius;
    cX = (float)b0.center.re() - b0.radius + radius;
    cY = (float)b0.center.im();
    center = new Complex(cX, cY);
    var b1 = new Bubble(center, bend);
    this.gasket.add(b1);

    var b2 = this.utility.findKissingBubble(b0, b1);
    this.gasket.add(b2);

    var triplet0 = new Bubble[3];
    triplet0[0] = b0;
    triplet0[1] = b1;
    triplet0[2] = b2;

    this.gasketMap.add(triplet0);
  }

  private void constructGaskets()
  {
    while (this.currentDepth < this.gasketMapDepth)
    {
      var newGasket = new ArrayList<Bubble[]>();
      newGasket.add(this.gasketMap.get(0));

      for (var triplet : this.gasketMap)
      {
        var tBubble0 = triplet[0];
        var tBubble1 = triplet[1];
        var tBubble2 = triplet[2];

        var newDuplet = this.createKissingCircles(triplet);
        var tBubble30 = newDuplet[0];
        var tBubble31 = newDuplet[1];

        if (this.utility.isTangentToAll(triplet, tBubble30))
        {
          var triplet013_0 = new Bubble[] {tBubble0, tBubble1, tBubble30};
          var triplet023_0 = new Bubble[] {tBubble0, tBubble2, tBubble30};
          var triplet123_0 = new Bubble[] {tBubble1, tBubble2, tBubble30};

          newGasket.add(triplet013_0);
          newGasket.add(triplet023_0);
          newGasket.add(triplet123_0);

          this.gasket.add(tBubble30);
        }

        if (this.utility.isTangentToAll(triplet, tBubble31))
        {
          var triplet013_1 = new Bubble[] {tBubble0, tBubble1, tBubble31};
          var triplet023_1 = new Bubble[] {tBubble0, tBubble2, tBubble31};
          var triplet123_1 = new Bubble[] {tBubble1, tBubble2, tBubble31};

          newGasket.add(triplet013_1);
          newGasket.add(triplet023_1);
          newGasket.add(triplet123_1);

          this.gasket.add(tBubble31);
        }
      }

      this.gasketMap.clear();
      this.gasketMap.addAll(newGasket);

      this.currentDepth++;
    }
  }

  private Bubble[] createKissingCircles(Bubble[] triplet)
  {
    var k3 = this.utility.findKissingBend(triplet);
    var kissingCenters = this.utility.findKissingCenters(triplet, k3);

    var cX = kissingCenters[0].re();
    var cY = kissingCenters[0].im();
    var center = new Complex(cX, cY);
    var bend = k3;
    var b30 = new Bubble(center, bend);

    cX = kissingCenters[1].re();
    cY = kissingCenters[1].im();
    center = new Complex(cX, cY);
    var b31 = new Bubble(center, bend);

    return new Bubble[] {b30, b31};
  }

  public void animate()
  {
    if (this.gasket != null)
    {
      for (var bubble : this.gasket)
        bubble.animate();
    }
  }

  public void render()
  {
    if (this.gasket != null)
    {
      for (var bubble : this.gasket)
        bubble.render();
    }
  }
}
