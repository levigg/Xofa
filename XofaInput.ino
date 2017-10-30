#include <Ultrasonic.h>

#define TRIGGER_PIN  12
#define ECHO_PIN     13
Ultrasonic ultrasonic(TRIGGER_PIN, ECHO_PIN);

int forceSensor=A0;
int forceSensorNewval=0;
int forceSensorOldval=30;

void setup()
{
  Serial.begin(9600);
}

void loop()
{
  float cmMsec, inMsec;
  long microsec = ultrasonic.timing();

  cmMsec = ultrasonic.convert(microsec, Ultrasonic::CM);
  forceSensorNewval=analogRead(forceSensor);
  
  if((forceSensorNewval-forceSensorOldval)>40)
  {
    Serial.println(-1); //welcome
    delay(1000); //welcome time
  }
  else if(forceSensorNewval>50 && cmMsec>0)
  {
    Serial.println(int(cmMsec)); //journey
    delay(1000); //set volume time
  }
  else if((forceSensorOldval-forceSensorNewval)>60)
  {
    Serial.println(-2); //goodbye
    delay(1000); //goodbye time
  }
  
  forceSensorOldval = forceSensorNewval;
  delay(1000);
}

