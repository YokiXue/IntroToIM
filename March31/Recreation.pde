void setup() {

  //size of the background
  size(1000, 1000);


  noFill();
}

void draw() {

  //interprets the first two parameters of ellipse() as the shape's center point
  ellipseMode(CENTER);

  //initialize the circle size to be 180
  int circleSize = 180;

  int minSize = 20;

  //create circles every 100 frames
  if (frameCount %  100 == 0) {

    //color of the backgound to be black
    background(0);

    //for loop for continuous drawing
    for (int y = 0; y< height; y +=circleSize) {
      for (int x = 0; x<width; x +=circleSize) {

        //Pushes the current transformation matrix onto the matrix stack
        pushMatrix();

        //Specifies x and y to displace objects within the display window. 
        translate(x, y);

        //stroke color is white
        stroke(255);

        //draw the outer circle
        ellipse(circleSize/2, circleSize/2, circleSize, circleSize);

        // create variables for the center point
        float x1 = random(minSize/2, circleSize - minSize/2);
        float y1 = random(minSize/3, circleSize - minSize/2);

        //draw the smallest circle
        ellipse(x1, y1, minSize, minSize);

        // set the random number of sqares in each block
        float density =int( random(20));

        //create new variables to store x1 and y1
        float x2 = x1;
        float y2 = y1;

        float size = minSize;

        //draw certain numbers of square
        for (int count = 1; count < density; count ++) {

          x2 += (circleSize/2-x1)/density;
          y2 += (circleSize/2-y1)/density;

          size += (circleSize - minSize)/density;

          ellipse(x2, y2, size, size);
        }

        //Pops the current transformation matrix off the matrix stack
        popMatrix();
      }
    }
  }
}
