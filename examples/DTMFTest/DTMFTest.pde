// DTMF (Dual Tone Multiple Frequency) Demonstration

// http://en.wikipedia.org/wiki/Dual-tone_multi-frequency

// To mix the output of the signals to output to a small speaker (i.e. 8 Ohms or higher),
// simply use 1K Ohm resistors from each output pin and tie them together at the speaker.
// Don't forget to connect the other side of the speaker to ground!

#include <Tone.h>

Tone freq1;
Tone freq2;

const int DTMF_freq1[] = { 1336, 1209, 1336, 1477, 1209, 1336, 1477, 1209, 1336, 1477 };
const int DTMF_freq2[] = {  941,  697,  697,  697,  770,  770,  770,  852,  852,  852 };

void setup()
{
  Serial.begin(9600);
  freq1.begin(11);
  freq2.begin(12);
}

void playDTMF(uint8_t number, long duration)
{
  freq1.play(DTMF_freq1[number], duration);
  freq2.play(DTMF_freq2[number], duration);
}


void loop()
{
  int i;
  uint8_t phone_number[] = { 8, 6, 7, 5, 3, 0 ,9 };

  for(i = 0; i < sizeof(phone_number); i ++)
  {
    Serial.print(phone_number[i], 10);
    Serial.print(' ');
    playDTMF(phone_number[i], 500);
    delay(600);
  }
  
  Serial.println();
  delay(4000);
}
