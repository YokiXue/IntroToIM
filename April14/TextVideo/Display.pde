//text display

PGraphics Main;  //Main text and rendering context

PVector PointNow, PointPlan, PointOffest;  
//current coordinate,planned coordinate, offest coordinate
PVector PointNext;  //next point

float ScaleNow, ScalePlan;  //current zoom value, planned zoom value

float RotateNow, RotatePlan, RotateState;  
//current rotate value, planned rotate value, record of rotate state

int IndexNow, IndexOld;  //current index, previous index

float textHeightNow, textHeightOld;  //current text height, previous height 
float textWidthNow, textWidthOld;  //current text width, previous width

void IniShow() {

  //initialize following values:
  IndexNow =0;
  IndexOld =-1;

  PointNow = new PVector(0, 0);
  PointPlan = new PVector(0, 0);
  PointOffest  = new PVector(0, 0);
  PointNext = new PVector(0, 0);
  ScaleNow =1;
  ScalePlan =1;
  RotateNow =0;
  RotatePlan =0;
  RotateState =0;

  Main = createGraphics(5000, 5000);  //creates and returns a new PGraphics object
  Main.beginDraw();  
  Main.textAlign(LEFT, CENTER);  
  //sets the horizontal and vertical alignment for drawing text

  PointNext.set( Main.width/2, 0 );  //change pixel
  CoorMove(Main, PointNext, PointPlan, RotateState); //coordinate variation
  PointNow = PointPlan.copy(); //Copies the region of pixels in plan to current point
  Main.pushMatrix();  
  Main.endDraw();

  imageMode(CORNER);// modify the location of image
}

void Run() {
  IndexNow = getIndex();  //get current index value
  if (IndexNow != IndexOld ) {  // new text needs to be updated
    Main.beginDraw();
    TextUpdate( (String)textMain[IndexNow][1]  ); //update new text
    Main.endDraw();
    IndexOld = IndexNow;  //return to old index value
    PointOffest = PVector.sub(PointPlan, PointNow);  //subtract  planPoint from offest
    PointOffest.normalize();  //make it a unit vector
  }
  Display();  //display text
}


void TextUpdate(String Str) {
  Main.textSize( random(textsSize[0], textsSize[1]) );//generate font size randomly

  Main.fill( textsColor[IndexNow % textsColor.length]); 
  stroke(textsColor[IndexNow % textsColor.length]);
  //generate color by the length of string

  textHeightNow = Main.textAscent()+Main.textDescent() +5 ;  //calculate current height
  textWidthNow = Main.textWidth(Str) ;  //current width
  ScalePlan = 1 / map( Main.textSize, textsSize[0], textsSize[1], 1/1.2, 2);  
  //calculate planned zoom value

  Main.popMatrix();
  if ( IndexNow % limitRotateSwitch ==0 && IndexNow >0 ) {  //if condition for rotate or not
    RotatePlan = GetRotateNext(RotateState ) ;  //planned rotate value

    PointNext.set(-15, 10);  //next coordinate
    
  if ( RotatePlan > 0  ) 
      PointNext.set(textWidthOld+10, 10);  

      CoorMove(Main, PointNext, PointPlan, RotateState);  
      //change coordinate
      Main.rotate(  0-RotatePlan );  //make the coordinate nagative or positive
      RotateState -= RotatePlan;  //record the changed coordinate
    
    if (RotatePlan > 0  ) 
      PointNext.set( 0-textWidthNow, 0 );
      CoorMove(Main, PointNext, PointPlan, RotateState);  //move the coordinate again
  
  } else {
    if ( (textsSize[1]+textsSize[0])/2 > Main.textSize )  
    {
      PointNext.set(0, textHeightNow +10 );   //next coordinate
    }
    else                                                     
    PointNext.set(0, textHeightNow );  //next coordinate
    CoorMove(Main, PointNext, PointPlan, RotateState);  //move coordinate
  }
  
  Main.pushMatrix();
  textWidthOld = textWidthNow;  //previous width=current width
  textHeightOld = textHeightNow;  //previous height=current height

  Main.text(Str, 0, 0);  //draw text to the screen
}

void Display() {
  EffectMove(PointNow, PointPlan, PointOffest, speedMove);  //call effectMove
  ScaleNow = EffectScale(ScaleNow, ScalePlan, speedZoom);  //control zoom effect
  RotateNow = EffectRotate(RotateNow, -RotateState, speedRotate);  //rotate effect

  translate(width/3, height/2);
  scale(ScaleNow);  //zoom
  line(0, textHeightNow, textWidthNow, textHeightNow);  //underline text
  rotate(RotateNow);  //rotate
  image(Main, -PointNow.x, -PointNow.y );  //display the text on the screen
}
