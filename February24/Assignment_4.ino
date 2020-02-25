/*
    Intro to IM
    Assignment 4
    Created by Yoki Xue
    2020/02/04
*/


#include <Servo.h>
//include servo libraries

#define servo 5  //the pin that the servo is attached to

#define Do 262
#define Re 294
#define Mi 330
#define Fa 349
#define Sol 392
#define La 440

//define the musical scale


Servo myservo;  // create servo object to control a servo

const int lightSensor1 = A0;
const int lightSensor2 = A1;
const int lightSensor3 = A2;
const int lightSensor4 = A3;
const int lightSensor5 = A4;

// variable to store the light sensors positions

const int buzzer = 6;// variable to store the buzzer position

int analogValue1 = 0;
int analogValue2 = 0;
int analogValue3 = 0;
int analogValue4 = 0;
int analogValue5 = 0;

//initialize five analog values read from the sensors

int tones1[] = {Do, Do, Sol, Sol};
int tones2[] = {La, La, Sol};
int tones3[] = {Fa, Fa, Mi, Mi};
int tones4[] = {Re, Re, Do};
int tones5[] = {Sol, Sol, Fa, Fa};

//notes in the melody

int noteDurations[] = {
  2, 2, 2, 2, 2
};

//note durations

int pos = 0;

//initialize the starting point of the servo

void setup() {
  Serial.begin(9600);

  // initialize serial communication at 9600 bits per second

  pinMode (lightSensor1, INPUT);
  pinMode (lightSensor2, INPUT);
  pinMode (lightSensor3, INPUT);
  pinMode (lightSensor4, INPUT);
  pinMode (lightSensor5, INPUT);

  pinMode(buzzer, OUTPUT);

  myservo.attach(servo); // attaches the servo on pin 5 to the servo object
}

void loop() {
  analogValue1 = analogRead(lightSensor1);
  analogValue2 = analogRead(lightSensor2);
  analogValue3 = analogRead(lightSensor3);
  analogValue4 = analogRead(lightSensor4);
  analogValue5 = analogRead(lightSensor5);

  //read values from the sensors

  Serial.println(analogValue1);

  // print out the value read

  for (pos = 0; pos <= 20; pos += 1) {   // goes from 0 degrees to 20 degrees
    // in steps of 1 degree
    myservo.write(pos);              // tell servo to go to position in variable 'pos'
    delay(350);                       // waits 200ms for the servo to reach the position
  }

  Serial.println(analogValue1);

  //print out the value from light sensor1

  if (analogValue1 < 800) {
    Serial.println(analogValue1);
    Serial.println("yes");

    // check the state

    for (int notes = 0; notes < 4; notes++) {
      int noteDuration = 1000 / noteDurations[notes];
      tone(buzzer, tones1[notes], noteDuration);
      int pauseBetweenNotes = noteDuration * 1.30;
      delay(pauseBetweenNotes);
      noTone (buzzer);  // stop the tone playing
    }
  }


  Serial.println(analogValue2);

  //print out the value from light sensor2

  for (pos = 20; pos <= 40; pos += 1) { // goes from 20 degrees to 40 degrees
    myservo.write(pos);              // tell servo to go to position in variable 'pos'
    delay(250);                       // waits 200ms for the servo to reach the position
  }

  Serial.println(analogValue2);

  //print out the value from light sensor2

  if (analogValue2 < 800) {

    Serial.println(analogValue2);
    Serial.println("yes");

    // check the state

    for (int notes = 0; notes < 3; notes++) {
      int noteDuration = 1000 / noteDurations[notes];
      tone(buzzer, tones2[notes], noteDuration);
      int pauseBetweenNotes = noteDuration * 1.30;
      delay(pauseBetweenNotes);
      noTone (buzzer);
    }
  }

  for (pos = 40; pos <= 60; pos += 1) { // goes from 40 degrees to 60 degrees
    myservo.write(pos);              // tell servo to go to position in variable 'pos'
    delay(250);                       // waits 250ms for the servo to reach the position
  }

  if (analogValue3 < 800) {
    for (int notes = 0; notes < 4; notes++) {
      int noteDuration = 1000 / noteDurations[notes];
      tone(buzzer, tones3[notes], noteDuration);
      int pauseBetweenNotes = noteDuration * 1.30;
      delay(pauseBetweenNotes);
      noTone (buzzer);
    }
  }
  for (pos = 60; pos <= 80; pos += 1) { // goes from 60 degrees to 80 degrees
    myservo.write(pos);              // tell servo to go to position in variable 'pos'
    delay(250);                       // waits 250ms for the servo to reach the position
  }
  if (analogValue4 < 800) {
    for (int notes = 0; notes < 3; notes++) {
      int noteDuration = 1000 / noteDurations[notes];
      tone(buzzer, tones4[notes], noteDuration);
      int pauseBetweenNotes = noteDuration * 1.30;
      delay(pauseBetweenNotes);
      noTone (buzzer);
    }
  }

  for (pos = 80; pos <= 100; pos += 1) { // goes from 80 degrees to 100 degrees
    myservo.write(pos);              // tell servo to go to position in variable 'pos'
    delay(250);                       // waits 250ms for the servo to reach the position
  }
  if (analogValue5 < 800) {
    for (int notes = 0; notes < 4; notes++) {
      int noteDuration = 1000 / noteDurations[notes];
      tone(buzzer, tones5[notes], noteDuration);
      int pauseBetweenNotes = noteDuration * 1.30;
      delay(pauseBetweenNotes);
      noTone (buzzer);
    }

  }

}
