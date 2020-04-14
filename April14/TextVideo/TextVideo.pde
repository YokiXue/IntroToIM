/*

 Intro to IM
 Homework due April 14
 
 The homework is a generative text program which 
 automatically displays the lyrics of the song "Yesterday Once more".
 
 Created by Yoki Xue
 2020/04/13
 
 reference:
 array access: https://processing.org/reference/arrayaccess.html
 Two-dimensional Arrays: https://processing.org/tutorials/2darray/
 PGraphics:  https://processing.org/reference/PGraphics.html
 createGraphics():  https://processing.org/reference/createGraphics_.html
 set():  https://processing.org/reference/set_.html
 imageMode():  https://processing.org/reference/imageMode_.html
 split() :   https://processing.org/reference/split_.html
 
 Citation:
  music&lyrics:  https://www.youtube.com/watch?v=75p-N9YKqNo
 */
 
String textPath = "./desktop/lyrics.txt";  //the pathway of the lyrics file

color[] textsColor ={#C5F7CB,#85F591,#35A041,#0F7E1B};  //color array for texts colors  

float[] textsSize = {60, 110};  //the range of text font size

int speedMove = 7;  //moving speed

float speedZoom = 0.07;  //zooming speed

float speedRotate = 0.07;  //rotating speed

int limitRotateSwitch = 4;  //rotate after 4 lines displayed

int readyTime = 3000;  // time before starting


Object[][]  textMain;  
//2D array of text to be displayed: time(float), content(String)


void setup(){
    size(1200,800);  //background size
    frameRate(50);  //50f rames every second
    
    IniShow();      //display parameter initialization
    
    GetTextMain();  //get text from the file
    
}

void draw(){
    background(0);
    
    if( readyTime < (millis())) //once the ready time passed, start displaying
    { 
     Run();
   } 
}
