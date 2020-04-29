/*

 Intro to IM
 Homework due April 30
 
 The homework is to do something creative with the image.
 Created by Yoki Xue
 2020/04/27
 
 Image:
 https://pixabay.com/images/search/steve%20jobs/
 */

PImage img;
int spacing=5; //spacing between dots

void setup() {
  size(600, 550);
  img = loadImage("steve.jpeg");
}

void draw() {
  image(img, 0, 0);
  img.loadPixels();
  for (int x=spacing; x<= width; x+=spacing) { 
    for (int y=spacing; y<= height; y+=spacing) {
      int loc= x+y;
      float r=red(img.pixels[loc]); 
      float g=green(img.pixels[loc]);
      float b=blue(img.pixels[loc]);
      if (mousePressed) {
        fill(r, g, b);
        noStroke();
        ellipse(x, y, spacing*0.6, spacing*0.6);
      }
    }
  }
}
