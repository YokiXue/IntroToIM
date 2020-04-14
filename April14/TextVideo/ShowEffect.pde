//get index for the current displayed text
int getIndex() {
  if (textMain.length ==0) 
  {
    return -1;
  }
  for (int x=0; x<textMain.length; x++) {
    if ( (float)textMain[x][0]*1000 + readyTime > (millis()))  
    return x;
  }
  return textMain.length-1;
}//check if all text has been displayed

//calculate the angle of rotation randomly
float GetRotateNext(float AngleState) {
  if ( AngleState > PI/4  )     return PI/2;
  if ( AngleState < -PI/4 )     return -PI/2;
  if (random(0, 1)>0.5)  return PI/2;
  else                 return -PI/2;
}

void CoorMove(PGraphics text, PVector vecStep, PVector vecRecord, float RotateNow) {
  text.translate( vecStep.x, vecStep.y );  //Transfer coordinates
  if ( RotateNow ==0 ) vecRecord.add( vecStep.x, vecStep.y );
  if ( RotateNow > 0 ) vecRecord.add( 0-vecStep.y, vecStep.x );
  if ( RotateNow < 0 ) vecRecord.add( vecStep.y, 0-vecStep.x );
}


void EffectMove(PVector vecNow, PVector vecAim, PVector vecStep, int speedUp) {
  for (int h=0; h< speedUp; h++) {
    if ( PVector.dist(vecAim, vecNow)<=1 ) {
      vecNow = vecAim.copy();
      break;
    } else if ( PVector.dist(vecAim, vecNow) >30*speedUp )  vecNow.add(vecStep.copy().mult(15)); 
    //if the moving speed is too slow, add speed
    vecNow.add(vecStep);
  }
}


float EffectScale(float sNow, float sAim, float sOffest) {
  if ( abs(sAim-sNow) <= sOffest )   return sAim;
  for (int s=0; s<1; s++) {
    if ( sAim > sNow )            sNow += sOffest;
    else                         sNow -= sOffest;
  }
  return sNow;
}

float EffectRotate(float rNow, float rAim, float rOffest) {
  if ( abs(rAim-rNow) <= rOffest )   return rAim;
  for (int s=0; s<1; s++) {
    if ( rAim > rNow )            rNow += rOffest;
    else                         rNow -= rOffest;
  }
  return rNow;
}
