// Define joystick pins
const int joyX = A0;
const int joyY = A1;

// Define motor driver pins
const int motorA1 = 7;
const int motorA2 = 6;
const int motorB1 = 5;
const int motorB2 = 4;
const int enableA = 9;
const int enableB = 10;

// Joystick threshold for movement detection
int joyThreshold = 300;

// Speed value for the motors (0-255)
const int motorSpeed = 150;
const int turnSpeed = 190;

void setup() {
  // Set motor driver pins as outputs
  pinMode(motorA1, OUTPUT);
  pinMode(motorA2, OUTPUT);
  pinMode(motorB1, OUTPUT);
  pinMode(motorB2, OUTPUT);
  pinMode(enableA, OUTPUT);
  pinMode(enableB, OUTPUT);

  // Start serial communication (optional for debugging)
  // Serial.begin(9600);
}

void loop() {
  // Read joystick values
  int joyValX = analogRead(joyX);
  int joyValY = analogRead(joyY);

  // Print joystick values (for debugging)
  // Serial.print("X: ");
  // Serial.print(joyValX);
  // Serial.print(" Y: ");
  // Serial.println(joyValY);

  // Determine motor directions based on joystick input
  if (joyValY < joyThreshold) {
    // Forward
    digitalWrite(motorA1, HIGH);
    digitalWrite(motorA2, LOW);
    digitalWrite(motorB1, HIGH);
    digitalWrite(motorB2, LOW);
    analogWrite(enableA, motorSpeed);
    analogWrite(enableB, motorSpeed);
  } else if (joyValY > 1023 - joyThreshold) {
    // Backward
    digitalWrite(motorA1, LOW);
    digitalWrite(motorA2, HIGH);
    digitalWrite(motorB1, LOW);
    digitalWrite(motorB2, HIGH);
    analogWrite(enableA, motorSpeed);
    analogWrite(enableB, motorSpeed);
  } else if (joyValX < joyThreshold) {
    // Left
    digitalWrite(motorA1, LOW);
    digitalWrite(motorA2, HIGH);
    digitalWrite(motorB1, HIGH);
    digitalWrite(motorB2, LOW);
    analogWrite(enableA, turnSpeed);
    analogWrite(enableB, turnSpeed);
  } else if (joyValX > 1023 - joyThreshold) {
    // Right
    digitalWrite(motorA1, HIGH);
    digitalWrite(motorA2, LOW);
    digitalWrite(motorB1, LOW);
    digitalWrite(motorB2, HIGH);
    analogWrite(enableA, turnSpeed);
    analogWrite(enableB, turnSpeed);
  } else {
    // Stop
    digitalWrite(motorA1, LOW);
    digitalWrite(motorA2, LOW);
    digitalWrite(motorB1, LOW);
    digitalWrite(motorB2, LOW);
    analogWrite(enableA, 0);
    analogWrite(enableB, 0);
  }

  delay(50); // Small delay for stability
}
