class Ball {
  PVector pos, vel;
  PVector[] oriPos; 
  //a vector array stores the target locations of the balls on each of the three images.

  color c;
  float sz;

  Ball() {
    sz = 3.5;
    pos = new PVector(random(sz/2, width-sz/2), random(sz/2, height-sz/2));

    oriPos = new PVector[3];
    oriPos[0] = new PVector(random(width), random(height));
    oriPos[1] = new PVector(random(width), random(height));
    oriPos[2] = new PVector(random(width), random(height));


    vel = PVector.random2D().mult(2);
    //Returns a new 2D unit vector with a random direction

    c = color(255, random(10, 90), random(90, 200), 200);
    //generate a random color
  }

  void display() {
    fill(c); 
    ellipse( pos.x, pos.y, sz*1.25, sz*1.25);
  }

  // restrict the balls with in the edges
  void move() {
    // when the x value of the position of the ball is less than 0:
    pos.add(vel);
    if (pos.x-sz/2<0) {                                   
      pos.x= sz/2;
      vel.x *= -1;
    }
    //when x value is greater than the width:
    if (pos.x+sz/2>width) {
      pos.x = width-sz/2;
      vel.x *= -1;
    }
    
    //when the y value is less than zero:
    if (pos.y-sz/2<0) {
      pos.y = sz/2;
      vel.y *= -1;
    }
    
    //when the y value is greater than the height:
    if (pos.y+sz/2>height) {
      pos.y = height-sz/2;
      vel.y *= -1;
    }
  }

  void attract() {
    //keep the position of the ball close to the oriPos
    pos.x += (oriPos[count].x-pos.x)/20;
    pos.y += (oriPos[count].y-pos.y)/20;
  }

  boolean colid(Ball b, int s ) {
    PVector p = b.oriPos[s];
    //Determine if there is any overlap between the current ball and ball b
    float d = PVector.dist(oriPos[s], p);
    float overlap = (sz/2 + b.sz/2) - d;
    //The sum of the radius values of two small balls 
    //minus the distance value is the overlap

    if (overlap>0) {
      return true;
    } else { 
      return false;
    }
  }
}
