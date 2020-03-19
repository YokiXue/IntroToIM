void setup() {  

  //Set size to 600 x 600
  size(500, 500);

  //Setting background to light green
  background(124, 245, 171);
}

//print point(x,y) on the screen when click
void mouseClicked() {

  println(mouseX, mouseY);
}

void draw() {

  //print name
  String name = "Yoki Xue 2020/03/18";

  fill(0);

  text(name, 410, 460, 75, 60);

  //hair
  stroke(0);
  fill(0);
  rect(width/2 - 80, height/2-80, 160, 250);

  //set the color of lines to be skin color
  stroke(253, 241, 212);

  //Fill rect with skin color
  fill(253, 241, 212);

  ellipse(250, 250, 180, 220);

  //forehair
  stroke(0);
  fill(0);
  arc(width/2, height/2 - 80, 162, 120, radians(180), radians(360));

  //eye arc

  noFill();
  stroke(0);
  strokeWeight(5);
  arc(200, 215, 45, 30, radians(220), radians(320));
  arc(300, 215, 45, 30, radians(220), radians(320));

  //eyes
  fill(0);
  ellipse(200, 215, 20, 25);
  ellipse(300, 215, 20, 25);

  //mouse&&smile
  noFill();
  stroke(0);
  strokeWeight(2);
  fill(255);
  arc(250, 310, 60, 40, 0, PI);
  line(225, 320, 275, 320);
  line(225, 310, 225, 320);
  line(235, 310, 235, 325);
  line(245, 310, 245, 328);
  line(255, 310, 255, 328);
  line(265, 310, 265, 325);
  line(275, 310, 275, 320);
  line(220, 310, 281, 310);

  //eyelash:

  strokeWeight(2);
  //left
  line(181, 206, 178, 200);
  line(186, 206, 182, 200);
  line(191, 205, 186, 198);
  line(195, 203, 191, 197);

  //right
  line(305, 201, 310, 195);
  line(309, 203, 314, 197);
  line(313, 205, 319, 198);
  line(318, 207, 321, 200);

  //Nose
  stroke(#B75557);
  fill(#D89091);
  triangle(250, 250, 245, 270, 255, 270);


  //ear
  fill(253, 241, 212);
  stroke(253, 241, 212);
  ellipse(158, 245, 30, 50);
  ellipse(340, 245, 30, 50);

  //eyebrow
  beginShape();
  fill(0);
  vertex(278, 191);
  bezierVertex(295, 182, 302, 184, 325, 192);
  endShape();
  beginShape();
  vertex(177, 191);
  bezierVertex(189, 182, 204, 184, 220, 192);
  endShape();

  //neck
  beginShape();
  stroke(253, 241, 212);
  fill(253, 241, 212);
  rect(230, 332, 40, 70);
  endShape();

  //clothe
  beginShape();
  stroke(#F5BED6);
  fill(#F5BED6);
  arc(width/2, height-35, 240, 160, radians(180), radians(360));
  endShape();
  beginShape();
  fill(#F57CB0);
  rect(171, 403, 157, 62);
  endShape();
  beginShape();
  stroke(#BC2A69);
  strokeWeight(5);
  line(204, 393, 204, 404);
  line(297, 393, 297, 404);
  endShape();

  //blush
  stroke(255, 150, 120);
  fill(255, 150, 120);
  ellipse((width/2-50), (height/2+20), 50, 30);  
  fill(255, 150, 120);
  ellipse((width/2+50), (height/2+20), 50, 30);
}
