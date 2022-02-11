// Paste all your files here
import java.util.ArrayList;

ArrayList<Ball> ballArray;
Bar gameBar;

public void setup()
{
  fullScreen();
//  size(800, 800);
  background(255);
//  fill(120);
  ballArray = new ArrayList<Ball>();
  ballArray.add( new Ball() );
  gameBar = new Bar();
}

public void draw()
{
  background(255);
  for(Ball b : ballArray){
    b.drawBall();
    b.updateBall();
  }
  gameBar.drawBar();
  gameBar.updateBar();
  if(ballArray.size() > 0)
    for(int i = ballArray.size() - 1; i >= 0; i--)
      if(ballArray.get(i).getX() > (width - ballArray.get(i).getRadius() - gameBar.getBwidth()/2)
          && Math.abs(ballArray.get(i).getY() - gameBar.getY()) < gameBar.getBheight()/2 )
      {
        ballArray.get(i).setXdOpp();
        ballArray.get(i).c1 = color((int)(Math.random()*255), (int)(Math.random()*255),(int)(Math.random()*255));
        ballArray.get(i).increaseSpeed();
      }
  if(ballArray.size() > 0)
    for(int i = ballArray.size() - 1; i >= 0; i--)
      if(ballArray.get(i).getX() > width){
        ballArray.remove(i);
        ballArray.add(new Ball() );
        if(ballArray.size() < 10)
          ballArray.add(new Ball() );
      }
  
}


class Ball{

  int x;
  int y;
  int xD;
  int yD;
  int radius;
  color c1;
  
  public Ball(){
    radius = 20;
    x = (int)(Math.random()*(width-radius*2));
    y = (int)(Math.random()*(height-radius*2));
    xD = 10;
    yD = 10;
    
    c1 = color((int)(Math.random()*255), (int)(Math.random()*255),(int)(Math.random()*255)); 
  }
  
  public Ball(int x, int y, int speed, int radius)
  {
    this.x = x;
    this.y = y;
    this.xD = speed;
    this.yD = speed;
    this.radius = radius;
  }
  
  public void setX(int x)
  {
    this.x = x;
  }
  
  public void setY(int y)
  {
    this.y = y;
  }
  
  public void setXD(int xD)
  {
    this.xD = xD;
  }
  
  public void setRadius(int radius)
  {
    this.radius = radius;
  }
  
  public void setXdOpp(){
    xD *= -1;
  }
  
  public int getX()
  {
    return x;
  }
  
  public int getY()
  {
    return y;
  }
  
  public int getXD()
  {
    return xD;
  }
  
  public int getYD()
  {
    return yD;
  }
  
  public int getRadius()
  {
    return radius;
  }
  
  public void increaseSpeed()
  {
    if(xD > 0)
      xD++;
    else
      xD--;
    if(yD > 0)
      yD++;
    else
      xD--;
  }
  
  public void drawBall()
  {
    fill(c1);
    println(c1);
    ellipse(x, y, radius*2, radius*2);
    
  }
  
  
  public void updateBall()
  {
    if(x < 0 + radius)
      xD *= -1;
      
    if(y < 0 + radius || y > height - radius){
      yD *= -1;
    }
    x += xD;
    y += yD;
  }
  
}

class Bar
{

  int x;
  int y;
  int bWidth;
  int bHeight;

  public Bar()
  {
    this.bWidth = 40;
    this.bHeight = 200;
    this.x = width - bWidth/2;
    this.y = height/2;
  }
  
  public int getX()
  {
    return x;
  }
  
  public int getY()
  {
    return y;
  }
  
  public int getBwidth()
  {
    return bWidth;
  }
  
  public int getBheight()
  {
    return bHeight;
  }
  
  public void setX(int x)
  {
    this.x = x;
  }
  
  public void setY(int y)
  {
  
  }
  
  public void drawBar()
  {
    rectMode(CENTER);
    fill(0);
    rect(x, y, bWidth, bHeight);
  }
  
  public void updateBar()
  {
    y = mouseY;
  }


}
