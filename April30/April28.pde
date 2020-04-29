/*

 Intro to IM
 Homework due April 30
 
 The homework is to do something creative with the image.
 Created by Yoki Xue
 2020/04/27
 
 Image:
 Forest: https://opengameart.org/content/forest-background
 Treasure: https://opengameart.org/content/gold-treasure-icons
 Skeleton: https://opengameart.org/content/animated-skeleton
 Bottle:  https://opengameart.org/content/pink-potion-item
 
 Instruction:
 and make the choice you prefer.
 */
 
int count; //choices being made

PImage background, bottle, devil, skeleton, gold;

void setup() {
  size(700, 400);
  bottle = loadImage("bottle.png");
  background = loadImage("background.jpeg");
  devil = loadImage("devil.png");
  skeleton = loadImage("skeleton.jpeg");
  gold = loadImage("gold.png");

  count = 0; //initialize count value
}

void draw() {
  background(0);
  textSize(20);

  //background
  fill(255);
  imageMode(CENTER);
  image(background, width/2, height/2, 700, 400);

  //translucent background for text
  fill(0, 150);
  rect(0, 250, 700, 80);
  rect(0, 350, 700, 40);

//starting scene
  if (count == 0) {
    fill(255);
    text("You enter the dark forest to look for the treasure", 30, 280);
    text("Suddenly, you and your friend see a mysterious bottle. What are you going to do?", 30, 310);
    fill(150, 150, 255);
    text("1.Kick it away", 30, 380);
    text("2.Drink it", 180, 380);
    text("3.Encourage your friend to drink", 330, 380);

    fill(255);
    image(bottle, width/2, height/3, 100, 100);
  }

//scene after kicking the bottle
  if (count == 1) {
    fill(255);
    text("The bottle tips over and a cloud of smoke comes out.", 30, 280);
    text("The devil appears directly in front of you... You want to", 30, 310);
    fill(150, 150, 255);
    text("1.Run away", 30, 380);
    text("2.Attack him! I am brave!", 240, 380);
    text("3.Talk to him", 500, 380);

    fill(255);
    image(devil, width/2, height/3, 100, 100);
  }

//scene after drinking
  if (count == 2) {
    fill(255);
    text("All of a sudden, you have superpowers", 30, 280);
    text("Sensing the call from the treasure, and encounter the devil. You want to", 30, 310);
    fill(150, 150, 255);
    text("1.Attack him", 30, 380);
    text("2.Talk to him", 250, 380);

    fill(255);
    image(devil, width/2, height/3, 100, 100);
  }

//scene after encouraging
  if (count == 3) {
    fill(255);
    text("Your friend falls to his knees in pain", 30, 280);
    text("Suddenly, he becomes a devil and stands in front of you. You want to", 30, 310);
    fill(150, 150, 255);
    text("1.Run away", 30, 380);
    text("2.Attack him!", 240, 380);
    text("3.Talk to him", 500, 380);

    fill(255);
    image(devil, width/2, height/3, 100, 100);
  }
//scene of attacking
  if (count == 4) {
    fill(255, 0, 0);
    imageMode(CENTER);
    image(background, width/2, height/2, 700, 400);
    fill(255);
    text("Your speed is too slow, the Boss throws a fireball at you", 30, 280);
    text("You can not resist his attack", 30, 310);
    fill(150, 150, 255);
    text("Game Over", 30, 380);

    fill(255);
    image(skeleton, width/2, height/3, 100, 100);
  }

//scene of winning
  if (count == 5) {
    fill(255);
    text("The devil was overwhelmed by your momentum", 30, 280);
    text("The treasure appears", 30, 310);
    fill(150, 150, 255);
    text("You and your friend escape from the dark forest with treasure!", 30, 380);

    fill(255);
    image(gold, width/2, height/3, 170, 150);
  }
// scene of rejecting
  if (count == 6) {
    fill(255, 0, 0);
    imageMode(CENTER);
    image(background, width/2, height/2, 700, 400);
    fill(255);
    text("The devil rejects your request and throws a fireball at you", 30, 280);
    text("You can not resist his attack", 30, 310);
    fill(150, 150, 255);
    text("Game Over", 30, 380);

    fill(255);
    image(skeleton, width/2, height/3, 100, 100);
  }
}

void keyPressed() {
  if (count == 0) {
    if (key == '1') {
      count = 1;
    }
    if (key == '2') {
      count = 2;
    }
    if (key == '3') {
      count = 3;
    }
  } else if (count == 1 || count == 3) {
    if (key == '1') {
      count = 4;
    }
    if (key == '2') {
      count = 5;
    }
    if (key == '3') {
      count = 6;
    }
  } else if (count == 2) {
    if (key == '1') {
      count = 5;
    }
    if (key == '2') {
      count = 6;
    }
  }
}
