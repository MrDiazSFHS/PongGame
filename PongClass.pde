//import java.util.ArrayList;

Ball ball1;
Bar bar1;


public void setup()
{
  //size(1600, 1600);
  fullScreen();
  background(255);
  fill(120);
  ball1 = new Ball();
  bar1 = new Bar();
}

public void draw()
{
  background(255);
  ball1.drawBall();
  ball1.updateBall();
  bar1.drawBar();
  bar1.updateBar();
  
  if(                         ball1.x > (width - ball1.radius - bar1.w/2) 
        && Math.abs(ball1.y - bar1.y) < bar1.h/2    )
  {
    ball1.xD *= -1;
    bar1.c1 = color( (int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255)); 
  }
  
  if(ball1.x > width + 10)
    ball1.x = 100;
  
  
}

class Ball{

  int x;
  int y;
  int xD;
  int yD;
  int radius;
    
  public Ball(){
    radius = 20;
    x = (int)(Math.random()*(width-radius*4) + radius*2);
    y = (int)(Math.random()*(height-radius*4)+ radius*2);
    xD = 10;
    yD = 10;
  }
  
  public Ball(int x, int y, int speed, int radius)
  {
    this.x = x;
    this.y = y;
    this.xD = speed;
    this.yD = speed;
    this.radius = radius;
  }
  
  public void drawBall(){
    ellipse(x, y, radius*2, radius*2);    
  }
  
  
  public void updateBall(){
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
  int w;
  int h;
  color c1;

  public Bar()
  {
    this.w = 40;
    this.h = 200;
    this.x = width - w/2;
    this.y = height/2;
    c1 = color(120, 50, 255);
  }
  

  
  public void drawBar()
  {
    rectMode(CENTER);
    fill(c1);
    rect(x, y, w, h);
  }
  
  public void updateBar()
  {
    y = mouseY;
  }


}
