/*

 Intro to IM
 Homework due April 21
 
 The homework is to experiment with Professor Aaron Sherwood's example 
 by making changes.
 Created by Yoki Xue
 2020/04/19
 
 Citation:
 https://github.com/aaronsherwood/introduction_interactive_media/blob/master/processingExamples/drawing/connectedLines/connectedLines.pde
 */

Rotater[] rotaters;


void setup() {
  strokeWeight(3);
  size(600, 600);
  rotaters = new Rotater[300];
  for (int i=0; i< rotaters.length; i++) {
    float x = random(width);
    float y = random(height);
    float lineDistance = random(20, 50);
    //initiate with i for index
    rotaters[i]= new Rotater(x, y, i, lineDistance);
  }
}

void draw() {
  background(0);
  
  //text:
  fill(#F25B0F);
  textSize(30);
  textAlign(CENTER);
  text("Press the mouse", width/5, height/10);
  
  for (Rotater r : rotaters) { 
    r.rotate();
    r.distance(rotaters);
  }
}

class Rotater {
  color c;
  float centerX, centerY, x, y, angle, radius, speed, lineDistance, acceleration, direction;
  int index;
  Rotater(float _x, float _y, int i, float ld) {

    //generate a random value from 0 to 8
    int colorValue =(int)random(0, 8);

    //initialize colors to be displayed for different i generated
    if (colorValue == 0) c = color(#E35245);//red
    if (colorValue == 1) c = color(#45E586);//green
    if (colorValue == 2) c = color(#FA6A9C);//pink
    if (colorValue == 3) c = color(#69ECFC);//light blue
    if (colorValue == 4) c = color(#1279FC);//blue
    if (colorValue == 5) c = color(#DFE53F);//yellow
    if (colorValue == 6) c = color(#857FCE);//purple
    if (colorValue == 7) c = color(#F58F23);//orange

    centerX= _x;
    centerY=_y;
    x=y=angle=0;
    radius=random(60, 80);
    speed = 0;
    index = i;
    lineDistance = ld;
    acceleration=0;
    //each rotater has a direction, make a coin flip initially to determine dir.
    float coinflip = random(1);
    if (coinflip > .5) {
      direction = 1;
    } else {
      direction = -1;
    }
  }

  void rotate() {
    //get cartesian coords from polar angle
    //add to center point of rotater to rotate around the actual spot
    x = cos(angle)*radius+centerX;
    y = sin(angle)*radius+centerY;
    //same as normal: vel+=acc
    speed+=acceleration;
    //angle is our pos now, mult by our direction
    angle+=speed*direction;
    //dampen it a little
    speed*=0.98;
    acceleration=0;
  }

  void distance(Rotater[] rotaters) {
    //check the mouse, if close enough add some acceleration
    checkMouse();
    //check distance with all rotaters, if close enough draw line
    for (Rotater r : rotaters) {
      if (r.index != index) {
        if (dist(x, y, r.x, r.y)<lineDistance) {
          line(x, y, r.x, r.y);
          stroke(c);
          if (mousePressed) {
            noStroke(); //No lines
            ellipse( r.x, r.y, 7,7);
            fill(r.c, 50);//fill the circles with color c
          }
        }
      }
    }
  }

  void checkMouse() {
    //if mouse is close enough give some acceleration
    if (dist(mouseX, mouseY, x, y)<100 && mouseX!=pmouseX && mouseY!=pmouseY) {
      acceleration=.002;
    }
  }
}
