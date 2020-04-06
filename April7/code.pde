/*

 Intro to IM
 Homework due April 7
 Created by Yoki Xue
 2020/04/05
 
 reference:
 Kaleidoscope Effect: https://forum.processing.org/one/topic/kaleidoscope-effect.html
 color(): http://iprocessing.cn/2017/08/08/color%e9%a2%9c%e8%89%b2%e5%87%bd%e6%95%b0/
 pvector :https://processing.org/reference/PVector.html
 https://processing.org/examples/accelerationwithvectors.html
 arraylist: https://processing.org/reference/ArrayList.html
 mult():  https://processing.org/reference/PVector_mult_.html
 
 */

PVector randomLocation;  //random coordinate of dots

int num=110; //initialize the number of dots

ArrayList store; //create an arraylist to store objects

int distance =60; //the maxmium distance between two dots

void setup() { 

  size(450, 450);

  background(255);

  frameRate(50);

  store = new ArrayList();

  for (int i=0; i<num; i++)
  {
    // starting point is within the circle
    randomLocation = new PVector(random(-140, 140), random(-140, 140));
    
    Dots dot = new Dots(randomLocation);//initialize objects

    //store each new dot into the arraylist 
    store.add(dot);
  }
}
void draw()
{
  //spescifies the location of the circle to be at the center
  translate(width/2, height/2);

  //color of the circle is black
  fill(0);

  ellipse(0, 0, 400, 400);

  //draw the dots
  for (int i=0; i<num; i++)
  {
    //obtain the dot from the store
    Dots dot1 = (Dots) store.get(i);

    //call methods on the dots
    dot1.displayDots();
    dot1.dynamic();

    for (int j=i; j<num; j++)
    {
      //obtain the second dots
      Dots dot2 = (Dots) store.get(j);
      dot2.dynamic();
      
      //if the distance between the 1st and 2nd dots is smaller than 60
      //draw the 3rd one
      //if the distance between the 1st and 3nd dots is smaller then 60
      //color it to form a triangle
      
      if (dist(dot1.location.x, dot1.location.y, dot2.location.x, dot2.location.y)<distance)
      {
        for (int m=j; m<num; m++)
        {
          //obtain the third dot;
          Dots dot3 = (Dots) store.get(m);
          dot3.dynamic();

          if (dist(dot1.location.x, dot1.location.y, dot3.location.x, dot3.location.y)<distance)
          {
            noStroke();

            //draw the triangle
            beginShape();
            vertex(dot1.location.x, dot1.location.y);
            vertex(dot2.location.x, dot2.location.y);
            vertex(dot3.location.x, dot3.location.y);
            endShape();
            
            fill(dot1.c,30);//fill with dot1's color and opacity is 30
          }
        }
      }
    }
  }
}

class Dots
{
  //Data
  color c;
  PVector location;   // vector for the coordinates
  PVector velocity;   // vector for the velocity

  //Constructor
  Dots(PVector loc) {

    location = loc;

    //generate a random integer from 0 to 8
    int i =(int)random(0, 8);

    //initialize colors to be displayed for different i generated
    if (i == 0) c = color(#E35245);//red
    if (i == 1) c = color(#45E586);//green
    if (i == 2) c = color(#FA6A9C);//pink
    if (i == 3) c = color(#69ECFC);//light blue
    if (i == 4) c = color(#1279FC);//blue
    if (i == 5) c = color(#DFE53F);//yellow
    if (i == 6) c = color(#857FCE);//purple
    if (i == 7) c = color(#F58F23);//orange

    //generate random velocity
    velocity =new PVector(random(-0.01, 0.01), random(-0.01, 0.01));
  }

  //Functionality

  void displayDots()
  {
    fill(c);
    noStroke();
    ellipse(location.x, location.y, 2, 2);
  }

  void dynamic()
  {
    //restrict the dots to be within the circle
    if (dist(location.x, location.y, 0, 0)<200) //the radius of circle is 200 
    {
      location.x += velocity.x;
      location.y += velocity.y;
    } else {

      //multiply the velocity by -1
      velocity=velocity.mult(-1);

      //plus the multiplied velocity so the dots would bounce back within circle
      location.x += velocity.x;
      location.y += velocity.y;
    }
  }
}
