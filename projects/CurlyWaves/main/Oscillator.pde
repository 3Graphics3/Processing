class Oscillator
{
  
  private PVector position;
  private float radius;
  
  private color fillColor;
  
  /* Constructor definition */
  public Oscillator(PVector position, float radius, color fillColor)
  {
    this.position = position;
    this.radius = radius * 1.2;
    
    this.fillColor = fillColor;
  }
  
  /* Function definition */
  public void oscillate(float theta, float amplitude)
  {
    var newY = map(sin(theta), -1, 1, -amplitude, amplitude); 
    this.position.y = newY;
  }
  
  public void show()
  {
    pushMatrix();
    translate(this.position.x, this.position.y);
    
    noStroke();
    fill(this.fillColor);
    
    circle(0, 0, this.radius);
    popMatrix();
  }
  
}
