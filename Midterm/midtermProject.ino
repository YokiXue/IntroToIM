/*

    Intro to IM
    Midterm Project
    Created by Yoki Xue
    2020/03/04

    Reference:
    The birthday song notes:
   https://create.arduino.cc/editor/jcurtis/caa3f02d-164c-4c68-969c-0352c3f3dbcc/preview

*/


//include the library codes for lcd and servo

#include<LiquidCrystal.h>
#include <Servo.h>

//initialize the library with the number of the interface pins
LiquidCrystal lcd(12, 11, 5, 4, 3, 2);

//define the pin that the servo is attached to:
#define servo 6

// create servo object to control a servo
Servo myservo;

int pos = 0;

//define the musical scale：

#define Do 262
#define Re 294
#define Mi 330
#define Fa 349
#define Sol 392
#define La 440
#define Si 494
#define Do_h 523
#define Re_h 587
#define Mi_h 659
#define Fa_h 698
#define Sol_h 784
#define La_h 880
#define Si_h 988

//numbers of notes in the birthday song
int length;

//which note is being played;
int thisNote = 0;

//notes for birthday song:

int scale[] = {Sol, Sol, La, Sol, Do_h, Si,
               Sol, Sol, La, Sol, Re_h, Do_h,
               Sol, Sol, Sol_h, Mi_h, Do_h, Si, La,
               Fa_h, Fa_h, Mi_h, Do_h, Re_h, Do_h
              };

//duration time of each note
float durt[] =
{
  0.5, 0.5, 1, 1, 1, 1 + 1,
  0.5, 0.5, 1, 1, 1, 1 + 1,
  0.5, 0.5, 1, 1, 1, 1, 1,
  0.5, 0.5, 1, 1, 1, 1 + 1,
};


// variable to store the speaker, led, and toggle switch
const int tonepin = 8;
const int ledpin = 13;
const int buttom = 7;

//initialize the toggle switch state
int buttonState = LOW;

//store last time servo sweeps
unsigned long previousMillis1 = 0;

//store last time tone sounds
unsigned long previousMillis2 = 0;

// period at which the servo works
const long period1 = 10;

// period at which tone sounds
const long period2 = 10;

void setup() {

  // initialize serial communication at 9600 bits per second
  Serial.begin(9600);

  // set up the LCD's number of columns and rows:
  lcd.begin(16, 2);

  // Print a message to the LCD.
  lcd.print("!Happy Birthday!");

  //print the result
  Serial.println("message printed");

  // initialize pins as an I or O.
  pinMode(buttom, INPUT);
  pinMode(tonepin, OUTPUT);
  pinMode(ledpin, OUTPUT);

  //calcutate the length of the song:
  length = sizeof(scale) / sizeof(scale[0]);

  // attaches the servo on pin 6 to the servo object
  myservo.attach(servo);

}

void loop() {

  //when the toggle switch is on, do all the following command
  while (buttonState = HIGH) {

    //store the current time
    unsigned long currentMillis = millis();

    //check if 10ms passed
    if (currentMillis - previousMillis1 >= period1) {

      //save the last time the servo sweeps
      previousMillis1 = currentMillis;

      for (pos = 0; pos <= 220; pos += 1) { // goes from 0 degrees to 220 degrees
        // in steps of 1 degree
        myservo.write(pos);              // tell servo to go to position in variable 'pos'
        delay(20);                       // waits 20ms for the servo to reach the position
      }
      for (pos = 220; pos >= 0; pos -= 1) { // goes from 220 degrees to 0 degrees
        myservo.write(pos);              // tell servo to go to position in variable 'pos'
        delay(20);  // waits 20ms for the servo to reach the position
      }
    }

    //check if 10ms passed
    if (currentMillis - previousMillis2 >= period2) {

      //save the last time the buzzer sounds
      previousMillis2 = currentMillis;

      //playing the song and blinking led using for loop
      for (int thisNote = 0; thisNote < length; thisNote++)
      {
        //print the length
        Serial.println(length);

        tone(tonepin, scale[thisNote]);

        //turn on the led
        digitalWrite(ledpin, HIGH);

        //Adjust the delay according to the beat
        delay(500 * durt[thisNote]);

        //turn off the led
        digitalWrite(ledpin, LOW);

        delay(100 * durt[thisNote]);
        
        noTone(tonepin);
      }
      delay(100);

    }
  }
}
