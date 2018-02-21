// what to do with incoming data
volatile byte command = 0;

int ss1 = 22;


void setup (void) {

  // have to send on master in, *slave out*
  pinMode(MISO, OUTPUT);

  // turn on SPI in slave mode
  SPCR |= _BV(SPE);

  // turn on interrupts
  SPCR |= _BV(SPIE);

  Serial.begin(115200);
  Serial.println("slave");
  pinMode(LED_BUILTIN, OUTPUT);

  pinMode(ss1, INPUT);
}  // end of setup


// SPI interrupt routine
ISR (SPI_STC_vect)
{
  byte c = SPDR;

  command = c;

  Serial.println(command);

  switch (command) {
      // no command? then this is the command
    case 0:
      Serial.println("==0");
      digitalWrite(LED_BUILTIN, LOW);
      break;

      // add to incoming byte, return result
    case 1:
      digitalWrite(LED_BUILTIN, HIGH);
      break;

      // subtract from incoming byte, return result
    default:
      Serial.println("ii");
      break;

    } // end of switch

}  // end of interrupt service routine (ISR) SPI_STC_vect

void loop (void)
{
  // if SPI not active, clear current command
}  // end of loop
