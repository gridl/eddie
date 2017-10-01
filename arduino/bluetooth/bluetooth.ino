void setup() {
  Serial.begin(9600);
  Serial2.begin(9600);
  Serial3.begin(9600);
}


void loop() {
  serial_read();
}


void serial_read() {

  if(Serial.available() > 0 ) {
    Serial.println("Reading serial data...");
    char command = Serial.read();
    Serial.println(command);
    Serial.write(command);
  }

  if(Serial2.available() > 0 ) {
    Serial2.println("Reading serial data...");
    char command = Serial2.read();
    Serial2.println(command);
    Serial2.write(command);
  }

  if(Serial3.available() > 0 ) {
    Serial3.println("Reading serial data...");
    char command = Serial3.read();

    Serial.println(command);
    Serial3.println(command);
  }

}
