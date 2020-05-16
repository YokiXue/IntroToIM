/*
 Intro to IM
 Final project_2 Due May 16
 
 Created by Yoki Xue
 2020/05/16
 
 Image:
 https://pixabay.com/images/search/see%20you%20again/
 
 Song:
 https://see-you-again.mp3quack.com/
 
 Reference:
 colorMode():   https://processing.org/reference/colorMode_.html
 super:         https://processing.org/reference/super.html
 Inspiration:   https://poanchen.github.io/blog/2016/11/15/how-to-add-background-music-in-processing-3.0
 minim library: http://artandtech.aalto.fi/wp-content/uploads/2012/06/minim.pdf
 
 Instruction:
 Enjoy the music!
 */

import ddf.minim.*;

AudioPlayer player;  //// set up audio player
Minim minim;   // define the audio object

PImage album, background;
int r = 200;  //the radius of the disc
float albumTheta = 0.0;  // rotation angle of the coordinate axis
color c; // dynamic color


void setup() {
  size(800, 800);
  colorMode(HSB, 360, 100, 100, 100);
  myAlbum();  //import the album picture

  minim = new Minim(this); 
  player = minim.loadFile("song.mp3", 1024); 
  //load the audio file, specifying a cache sampling frequency of 1024
  player.play(); // play the file
}

void draw() {
  translate(width/2, height/2);   // place the origin in the center of the canvas
  background(360);   //set the background color
  // backGround();   //Set the gradient background
  rotate(albumTheta);    // rotation of axes
  image(album, 0, 0);   // draw the album cover

  // draw dynamic sound effects

  stroke(c);      // thread color
  strokeWeight(4);   //thickness
  for (int i=0; i<player.left.size(); i+=6) {
    float rTheta = map(i, 0, player.left.size()-1, 0, 2*PI);  // rotation angle
    pushMatrix();   // put the origin data and rotation data into the matrix stack
    rotate(rTheta);
    line(0, r+10, 0, r + 10 + abs(player.left.get(i))*200);
    popMatrix();    // release the stack
  }

  albumTheta += 0.02;  // increse the rotation angle by 0.02
}

void stop() {
  player.close(); // turn off the player
  minim.stop();   // stop the audio
  super.stop();
}

//import the album picture
void myAlbum() {
  imageMode(CENTER); 
  album = loadImage("cover.png");  
  background = loadImage("background.jpg");
  album.resize(2*r, 2*r); 
  background.resize(2*r, 2*r);
  // change the length and width of the picture to twice the radius
  c = album.get(0, 0);  //extract the color from the record
}
