void setup() {
  Serial3.begin(9600);
}


void loop() {
  serial_read();
}


void serial_read()
{
  if(Serial.available() > 0 )
    {
      Serial3.println("Reading serial data...");
      int command = Serial.parseint();
      Serial3.println(command);
      Serial3.write(command);
    }
}
