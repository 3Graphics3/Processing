import complexnumbers.*;

BubbleGasket bubbleGasket;

void setup()
{
  surface.setTitle("BubbleGasket");
  surface.setResizable(false);
  surface.setLocation(displayWidth / 3, floor(0.1 * displayHeight));

  createBubbleGasket();

  size(750, 750, P2D);
  colorMode(HSB, 255, 255, 255);
}

void createBubbleGasket()
{
  var gasketDepth = 8;
  this.bubbleGasket = new BubbleGasket(gasketDepth);
}

void draw()
{
  background(0);

  bubbleGasket.render();
  bubbleGasket.animate();
}
