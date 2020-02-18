#include "pitches.h"

const int redLED = 8;
const int greenLED = 7;
const int blueLED = 13;

const int redButton = 12;
const int greenButton = 4;
const int blueButton = 2;

const int buzzer = 6;

const int potPin = A0;


int tones[] = {NOTE_B2, NOTE_G4, NOTE_G1, NOTE_B3, NOTE_AS3, 0, NOTE_CS8, NOTE_G1};
int tones2[] = {NOTE_A3, NOTE_C4, NOTE_B1, NOTE_A1, NOTE_AS2, 0, NOTE_F6, NOTE_A6};
int tones3[] = {NOTE_GS6, NOTE_A3, NOTE_D6, NOTE_D7, NOTE_D1, 0, NOTE_FS2, NOTE_D7};
int noteDurations[] = {
  4, 8, 8, 4, 4, 4, 4, 4
};
void setup() {
  pinMode (redLED, OUTPUT);
  pinMode (greenLED, OUTPUT);
  pinMode (blueLED, OUTPUT);
  pinMode (buzzer, OUTPUT);
  pinMode(redButton, INPUT_PULLUP);
  pinMode(blueButton, INPUT_PULLUP);
  pinMode(greenButton, INPUT_PULLUP);
  pinMode(potPin, INPUT);
}

void loop() {

  int buttonState1 = digitalRead(redButton);
  int buttonState2 = digitalRead(greenButton);
  int buttonState3 = digitalRead(blueButton);


  if (buttonState1 == 1)
  {
    for (int x = 0; x < 8; x++) {
      digitalWrite(redLED, HIGH);
      delay(20);
      int noteDuration=1000/noteDurations[x];
      tone(buzzer, tones[x],noteDuration);
      int pauseBetweenNotes=noteDuration*1.30;

      int writeValue;
      writeValue = analogRead(potPin);

      int mappedValue;
      mappedValue = map(writeValue, 0, 1023, 0, 8);
      analogWrite(buzzer, mappedValue);
      delay(pauseBetweenNotes);
      noTone (buzzer);
    }
  }

  else {
    digitalWrite(redLED, LOW);
  }



  if (buttonState2 == 1)
 {
    for (int x = 0; x < 8; x++) {
      digitalWrite(greenLED, HIGH);
      delay(20);
      int noteDuration=1000/noteDurations[x];
      tone(buzzer, tones2[x],noteDuration);
      int pauseBetweenNotes=noteDuration*1.30;

      int writeValue;
      writeValue = analogRead(potPin);

      int mappedValue;
      mappedValue = map(writeValue, 0, 1023, 0, 8);
      analogWrite(buzzer, mappedValue);
      delay(pauseBetweenNotes);
      noTone (buzzer);
    }
  }

  else {
    digitalWrite(greenLED, LOW);
  }



  if (buttonState3 == 1)
    {
    for (int x = 0; x < 8; x++) {
      digitalWrite(blueLED, HIGH);
      delay(20);
      int noteDuration=1000/noteDurations[x];
      tone(buzzer, tones3[x],noteDuration);
      int pauseBetweenNotes=noteDuration*1.30;

      int writeValue;
      writeValue = analogRead(potPin);

      int mappedValue;
      mappedValue = map(writeValue, 0, 1023, 0, 8);
      analogWrite(buzzer, mappedValue);
      delay(pauseBetweenNotes);
      noTone (buzzer);
    }
  }

  else {
    digitalWrite(blueLED, LOW);
  }


}
