class Liquid
{

  private color fillColor;

  private PVector position;
  private PVector dimension;

  private float resistance;
  private float density;

  /* Constructor definition */
  public Liquid(color fillColor, PVector position,
                PVector dimension, float resistance)
  {
    this.fillColor = fillColor;

    this.position = position;
    this.dimension = dimension;

    this.resistance = resistance;
    this.density = (float)Math.sqrt(this.dimension.x * this.dimension.y);
  }

  /* Function definition */
  public boolean contains(Drop drop)
  {
    var isHorizontallyIn = (drop.position.x >= this.position.x - drop.dimension.x &&
                            drop.position.x <= this.position.x + this.dimension.x - drop.dimension.x);
    var isVerticallyIn = (drop.position.y >= this.position.y + drop.dimension.y &&
                          drop.position.y <= this.position.y + this.dimension.y - drop.dimension.y);

    return (isHorizontallyIn && isVerticallyIn);
  }

  public PVector getDragForce(Drop drop)
  {
    var drag = drop.velocity.copy();

    var dragSpeed = drag.magSq();
    var dragStrength = this.resistance * this.density * dragSpeed * drop.dimension.x / 2;

    drag.normalize();
    drag.mult(-1);

    drag.setMag(dragStrength);

    return drag;
  }

  public void show()
  {
    noStroke();
    fill(this.fillColor);

    rect(this.position.x, this.position.y,
         this.dimension.x, this.dimension.y);
  }
  
}
