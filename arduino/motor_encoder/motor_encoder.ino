/* MD10C */

const int motor_a_pwm = 9;
const int motor_a_direction = 32;

const int forward = 1;
const int stop = 0;
const int reverse = -1;

const int analog_high = 255;
const int analog_medium = 127;
const int analog_low = 0;

int speed;


void setup(){
  Serial.begin(9600);

  pinMode(motor_a_pwm, OUTPUT);
  pinMode(motor_a_direction, OUTPUT);
}


void loop() {
  rotate(forward, analog_medium);
  rotate(forward, analog_high);

  rotate(reverse, analog_medium);
  rotate(reverse, analog_high);
}


void rotate(int direction, int speed) {
  Serial.println(direction);
  Serial.println(speed);
  if(direction==forward){
    digitalWrite(motor_a_direction, HIGH);
    analogWrite(motor_a_pwm, speed);
  }
  if(direction==reverse){
    digitalWrite(motor_a_direction, LOW);
    analogWrite(motor_a_pwm, speed);
  }

  delay(2000);
  analogWrite(motor_a_pwm, analog_low);
  delay(1000);
}
