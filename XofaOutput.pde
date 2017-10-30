import processing.serial.*;
import ddf.minim.*;

Serial myPort;
String val ;
Minim minim;


int oldMeter = 0;
int newMeter = 0;


AudioPlayer opening;
AudioPlayer ending;
AudioPlayer bayou;
AudioPlayer bird;
AudioPlayer ocean;
AudioPlayer old;
AudioPlayer people;
AudioPlayer radio;
AudioPlayer rain;
AudioPlayer sport;
AudioPlayer thunder;
AudioPlayer train;


void setup()
{
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);

  minim = new Minim(this);
  bayou = minim.loadFile("bayou.mp3");
  bird = minim.loadFile("bird.mp3");
  ending = minim.loadFile("ending.mp3");
  ocean = minim.loadFile("ocean.mp3");
  old = minim.loadFile("old.mp3");
  opening = minim.loadFile("opening.mp3");
  people = minim.loadFile("people.mp3");
  radio = minim.loadFile("radio.mp3");
  rain = minim.loadFile("rain.mp3");
  sport = minim.loadFile("sport.mp3");
  thunder = minim.loadFile("thunder.mp3");
  train = minim.loadFile("train.mp3");
}


void draw()
{
  val = myPort.readStringUntil('\n');


  if (val != null)
  {
    val = trim(val);

    println(val); 
    if (int(val) == -1)
    {

      opening.play();
      //     delay(3000);
    } else if (int(val) > 0) 
    {

      newMeter = int(val);
      int index = int(random(1, 10)+0.5);  

      if ((oldMeter - newMeter) > 10)
      {
        opening.pause();
        opening.rewind(); 

        switch(index) {        
        case 1:
          bayou.rewind();
          bayou.play();
          break;
        case 2:
          bird.rewind();
          bird.play();
          break;
        case 3:
          ocean.rewind();
          ocean.play();
          break;
        case 4:
          old.rewind();
          old.play();
          break;
        case 5:
          people.rewind();
          people.play();
          break;
        case 6:
          radio.rewind();
          radio.play();
          break;
        case 7:
          rain.rewind();
          rain.play();
          break;
        case 8:
          sport.rewind();
          sport.play();
          break;
        case 9:
          thunder.rewind();
          thunder.play();
          break;
        case 10:
          train.rewind();
          train.play();
          break;  


          //journey[index].play();
        }
      } 
     } 
      
      else if (int(val) == -2)
      {
        bayou.pause();
        bayou.rewind();
        bird.pause();
        bird.rewind();
        ocean.pause();
        ocean.rewind();
        old.pause();
        old.rewind();
        people.pause();
        people.rewind();
        radio.pause();
        radio.rewind();
        rain.pause();
        rain.rewind();
        sport.pause();
        sport.rewind();
        thunder.pause();
        thunder.rewind();
        train.pause();
        train.rewind();
        opening.pause();
        opening.rewind();


        ending.play();
        delay(6000);
        ending.pause();
        ending.rewind();
      }


      
     else
    {
      val = "-5";
      delay(2000);
    }

     

    oldMeter = newMeter;
  }
}

