// Global Variables
  Ball b1;
  Ball b2;

// setup method
public void setup()
{
  size(800, 800);
  background(120);
  b1 = new Ball();
  b2 = new Ball();
}


// draw method
public void draw()
{
  background(120);
  b1.update();
  b1.drawBall();
  b1.checkEdges();
  

  textSize(50);
  text("Diaz", 200, 200);
  
  b2.update();
  b2.drawBall();
  b2.checkEdges();
}


public class Ball
{
  // Instance Variables
  private int x;
  private int y;
  
  private int xD;
  private int yD;
  
  private int diameter;
  
  // Assume size(800, 800);
  // Constructors
  public Ball()
  {
    x = (int)(Math.random()*800);
    y = (int)(Math.random()*800);
    xD = 5;
    yD = 5;
    diameter = (int)(Math.random()*50 + 10); 
  }
  
  // Constructor that will in speed (xD & yD) and diameter
  
   
  // methods
  public void update()
  {
    x += xD;
    y += yD;
  }
  
  public void drawBall()
  {
    ellipse(x, y, diameter, diameter);
  }

  public void checkEdges()
  {
    if(x < 0 || x > width)
      xD *= -1;
    if(y < 0 || y > height)
      yD *= -1;      
  }
















}
