
const int buttonPin = 2;//Declare button to be arduino pin 2
const int ledPin1 = 8;
const int ledPin2 = 12;
const int ledPin3 = 13; //Declare LEDpins to be arduino pins
const int potPin=A0;  //Declare the potentiometer to be an arduino pin
int readValue; //Use this variable to read potentiomemter
int writeValue;//Variable for writing to LED
int i = 0;
int led = 0;

int ledState = LOW;
long previousMillis = 0;
long Millisbefore = 0;
long interval1 = 1000;
long interval2 = 100;


void setup() {
  pinMode(ledPin1, OUTPUT);
  pinMode(ledPin2, OUTPUT);
  pinMode(ledPin3, OUTPUT);
  pinMode(buttonPin, INPUT);
  pinMode(potPin, INPUT);
  
}

void loop() { 
  if (digitalRead(buttonPin) == HIGH)
  {
    delay(20);
    if (digitalRead(buttonPin) == LOW)
    {
      i++;
      if (i == 4)
        i = 0;
    }
  }

  if (i == 0)
  {
    digitalWrite(ledPin1, LOW);
    digitalWrite(ledPin2, LOW);
    digitalWrite(ledPin3, LOW);
  }
  if (i == 1)
  {
    digitalWrite(ledPin1, HIGH);
    digitalWrite(ledPin2, HIGH);
    digitalWrite(ledPin3, HIGH);
    readValue=analogRead(potPin);
    writeValue=(255./1023.)*readValue;
    analogWrite(ledPin1, writeValue);
    analogWrite(ledPin2, writeValue);
    analogWrite(ledPin3, writeValue);
    delay(80);
  }


  if (i == 2)
  {
    unsigned long currentMillis = millis();
    if (currentMillis - previousMillis > interval1)
    {
      previousMillis = currentMillis;
      if (ledState == LOW)
        ledState = HIGH;
      else
        ledState = LOW;
      digitalWrite(ledPin1, ledState);
      digitalWrite(ledPin2, ledState);
      digitalWrite(ledPin3, ledState);
    }
  }

  if (i == 3)
  {
    unsigned long Millisnow = millis();
    if (Millisnow - Millisbefore > interval2)
    {
      Millisbefore = Millisnow;
      led++;
      switch (led) {
        case 1:
          digitalWrite(ledPin1, HIGH);
          digitalWrite(ledPin2, LOW);
          digitalWrite(ledPin3, LOW);
          break;

        case 2:
          digitalWrite(ledPin1, LOW);
          digitalWrite(ledPin2, HIGH);
          digitalWrite(ledPin3, LOW);
          break;

        case 3:
          digitalWrite(ledPin1, LOW);
          digitalWrite(ledPin2, LOW);
          digitalWrite(ledPin3, HIGH);
          led = 0;
          break;
      }
    }
  }
}
