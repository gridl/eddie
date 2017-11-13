String tmp;
float command;
int foo;


void setup() {
  Serial.begin(9600);
  Serial2.begin(9600);
  Serial3.begin(9600);
}


void loop() {

  if (Serial.available()) {
    command = Serial.parseFloat();
    print_message(String(command));
  }

  /* bluetooth */
  if (Serial2.available()) {
    foo = Serial2.parseInt();
    print_message(String(foo));
  }

  /* bluetooth */
  if (Serial3.available()) {
    command = Serial3.parseFloat();
    print_message(String(command));
  }

}


void print_message(String msg) {
  Serial.println(msg);
  Serial2.println(msg);
  Serial3.println(msg);
}
