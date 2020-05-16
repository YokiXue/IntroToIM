/*
 Intro to IM
 Final project Due May 16
 
 Created by Yoki Xue
 2020/05/16
 
 Image:
 https://pixabay.com/images/search/heart/
 
 Reference:
 random2D():  https://processing.org/reference/PVector_random2D_.html
 brightness:  https://processing.org/reference/brightness_.html
 
 Instruction:
 Click the mouse to control the balls and switch between different images.
 */

PImage[] heart; //background images array

Ball[] ball; //ball array

int ballNum = 2020;

int count = -1; 
// state of the ball:
// -1 is spread out, and 0 to 2 correspond to three images respectively

void setup() {
  size(1000, 800);
  imageMode(CENTER);
  noStroke();

  //read images from heart array
  heart = new PImage[3];

  for (int i=0; i<heart.length; i++) {
    heart[i] = loadImage(i+".png");
  }

  //create a new ball from the array
  ball = new Ball[ballNum];
  //Find the target position on the graph for each ball one by one
  for (int i=0; i<ballNum; i++) {
    ball[i] = new Ball();

    //go through three images
    for (int n=0; n<3; n++) {

      ball[i].oriPos[n] = new PVector(random(width), random(height));
      //pick a position randomly

      color clr = heart[n].get(int(ball[i].oriPos[n].x), int(ball[i].oriPos[n].y));
      //read the color of the pixel on the base image at this random position
      
      boolean flag = true;
      //record whether a location overlaps with a target location that has been identified

      // Extracts the brightness value from a color.
      while (brightness(clr)<200 || flag) {
        ball[i].oriPos[n] = new PVector(random(width), random(height));
        clr = heart[n].get(int(ball[i].oriPos[n].x), int(ball[i].oriPos[n].y));
        flag = false;
        // when the color brightness value is less than 200 
        //or the position is overlapped with the fixed position, search again

        for (int j=0; j<i; j++) {    
          if (ball[i].colid(ball[j], n)) {
            flag = true;
            break;
            //If there is any overlap between the determined target position
            //and the current position, flag is true and the while loop continues
          }
        }
      }
    }
  }
}

void draw() {
  background(0);
  //call functions
  for (int i=0; i<ballNum; i++) {   
    ball[i].display();
    if (count < 0) {
      ball[i].move();
    } else {
      ball[i].attract();
    }
  }
}

//increase the value of the state variable heartFlag when the mouse is clicked
void mousePressed() {
  count ++;
  if (count>2) {
    count=-1;
  }
}
