int command;


void setup() {
  Serial.begin(9600);
  Serial1.begin(9600);
  Serial2.begin(9600);
  Serial3.begin(9600);

  print("start");
}


void loop() {
  /* print("start"); */
  exec_serial_commands();
}


int exec_serial_commands() {

  command = 0;

  if (Serial.available()) {
    command = Serial.parseInt();
  }

  /* bluetooth */
  if (Serial1.available()) {
    command = Serial2.parseInt();
  }

  /* bluetooth */
  if (Serial2.available()) {
    command = Serial2.parseInt();
  }

  /* bluetooth */
  if (Serial3.available()) {
    command = Serial3.parseInt();
  }

  if(command != 0) {
    print(String(command));
  }

  return command;
}


void print(String msg) {
  Serial.println(msg);
  /* Serial1.println(msg); */
  /* Serial2.println(msg); */
  /* Serial3.println(msg); */
}
