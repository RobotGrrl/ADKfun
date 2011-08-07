// Just having some fun with the
// Google Android Accessory Demo Shield!
// ---
// RobotGrrl.com
// June 3, 2011
//
// Used this gist for pin refs:
// https://gist.github.com/975769

#include <Wire.h>
#include <Servo.h>
#include <CapSense.h>
#include <Streaming.h>

#define  LED3_RED       2
#define  LED3_GREEN     4
#define  LED3_BLUE      3

#define  LED2_RED       5
#define  LED2_GREEN     7
#define  LED2_BLUE      6

#define  LED1_RED       8
#define  LED1_GREEN     10
#define  LED1_BLUE      9

#define  SERVO1         11
#define  SERVO2         12
#define  SERVO3         13

#define  TOUCH_RECV     14
#define  TOUCH_SEND     15

#define  RELAY1         A0
#define  RELAY2         A1

#define  LIGHT_SENSOR   A2
#define  TEMP_SENSOR    A3

#define  BUTTON1        A6
#define  BUTTON2        A7
#define  BUTTON3        A8

#define  JOY_SWITCH     A9      // pulls line down when pressed
#define  JOY_nINT       A10     // active low interrupt input
#define  JOY_nRESET     A11     // active low reset output

Servo servos[3];

// 10M ohm resistor on demo shield
CapSense   touch_robot = CapSense(TOUCH_SEND, TOUCH_RECV);

byte b1, b2, b3, b4, c;

int i=0;
int j=0;
boolean fadingRainbow = true;

void setup() {
  
        Serial.begin(9600); // 115200
	Serial << "Welcome Android" << endl;

	init_leds();
	init_relays();
	init_buttons();
	init_joystick(5);

	// autocalibrate OFF
	touch_robot.set_CS_AutocaL_Millis(0xFFFFFFFF);

	servos[0].attach(SERVO1);
	servos[0].write(90);
	servos[1].attach(SERVO2);
	servos[1].write(90);
	servos[2].attach(SERVO3);
	servos[2].write(90);


	b1 = digitalRead(BUTTON1);
	b2 = digitalRead(BUTTON2);
	b3 = digitalRead(BUTTON3);
	b4 = digitalRead(JOY_SWITCH);
	c = 0;

        for(i = 0 ; i <= 15; i+=1) {
          
          if(fadingRainbow) {
          
            analogWrite(LED1_RED, 255-i);
            analogWrite(LED2_RED, 255-i);
            analogWrite(LED3_RED, 255-i);
            
            analogWrite(LED1_GREEN, 255-i);
            analogWrite(LED2_GREEN, 255-i);
            analogWrite(LED3_GREEN, 255-i);
            
            analogWrite(LED1_BLUE, 255-i);
            analogWrite(LED2_BLUE, 255-i);
            analogWrite(LED3_BLUE, 255-i);
            /*
            
            digitalWrite(LED1_GREEN, LOW);
            digitalWrite(LED2_GREEN, LOW);
            digitalWrite(LED3_GREEN, LOW);
            
            digitalWrite(LED1_BLUE, LOW);
            digitalWrite(LED2_BLUE, LOW);
            digitalWrite(LED3_BLUE, LOW);
            
            */
            
          } else {
            
          analogWrite(LED1_RED, 255-i);
          analogWrite(LED1_GREEN, 255-i);
          analogWrite(LED1_BLUE, 255-i);
          
          analogWrite(LED2_RED, 255-i);
          analogWrite(LED2_GREEN, 255-i);
          analogWrite(LED2_BLUE, 255-i);
          
          analogWrite(LED3_RED, 255-i);
          analogWrite(LED3_GREEN, 255-i);
          analogWrite(LED3_BLUE, 255-i);
          
          }
          
          delay(5);
        }

}

void loop() {
  
  /*
  
  long touchcount;
  
  touchcount = touch_robot.capSense(5);
  if(touchcount > 50) {
    Serial << "That tickles!" << endl;
  }
  
  if(digitalRead(BUTTON1) == LOW) {
    int x;
    int y;
    read_joystick(&x, &y);
  
    int xpos = constrain(x, -128, 127);
    int ypos = constrain(y, -128, 127);
    Serial << "X: " << xpos << " Y: " << ypos << endl;
  }
  
  if(digitalRead(BUTTON2) == LOW) {
    int temp = analogRead(TEMP_SENSOR);
    Serial << "Temp: " << temp << endl;
  }
  
  if(digitalRead(BUTTON3) == LOW) {
    int light = analogRead(LIGHT_SENSOR);
    Serial << "Light: " << light << endl;
  }
  
  if(digitalRead(JOY_SWITCH) == LOW) {
    int x;
    int y;
    read_joystick(&x, &y);
  
    int xpos = constrain(x, -128, 127);
    int ypos = constrain(y, -128, 127);
    Serial << "X: " << xpos << " Y: " << ypos << endl;
  }
  
  int omgbright = 254;
  
  */
  
  /*
  
  for(int i=255; i>0; i--) {
    analogWrite(LED1_RED, i);
    analogWrite(LED1_GREEN, i);
    analogWrite(LED1_BLUE, i);
    delay(10);
  }
  
  //delay(500);
  
  for(int i=0; i<255; i++) {
    analogWrite(LED1_RED, i);
    analogWrite(LED1_GREEN, i);
    analogWrite(LED1_BLUE, i);
    delay(10);
  }
  
  //delay(500);
  
  */
  
  /*
  
  analogWrite(LED1_RED, omgbright);
  analogWrite(LED1_GREEN, 255);
  analogWrite(LED1_BLUE, omgbright);
  
  analogWrite(LED2_RED, omgbright);
  analogWrite(LED2_GREEN, 255);
  analogWrite(LED2_BLUE, omgbright);
  
  analogWrite(LED3_RED, omgbright);
  analogWrite(LED3_GREEN, 255);
  analogWrite(LED3_BLUE, omgbright);
  
  delay(100);
  
  */
  
  for(i = 15 ; i <= 255; i+=1)
  { 
    
    if(fadingRainbow) {
    
    
    // Red: 0,1,5,6
    if(j == 0 || j == 1 || j == 5 || j == 6) {
      analogWrite(LED1_RED, 255-i);
      analogWrite(LED2_RED, 255-i);
      analogWrite(LED3_RED, 255-i);
    } else {
      analogWrite(LED1_RED, 255-15);
      analogWrite(LED2_RED, 255-15);
      analogWrite(LED3_RED, 255-15);
      //digitalWrite(LED1_RED, HIGH);
      //digitalWrite(LED2_RED, HIGH);
      //digitalWrite(LED3_RED, HIGH);
    }
    
    // Green: 1,2,3,6
    if(j == 1 || j == 2 || j == 3 || j == 6) {
      Serial << "g";
      analogWrite(LED1_GREEN, 255-i);
      analogWrite(LED2_GREEN, 255-i);
      analogWrite(LED3_GREEN, 255-i);
    } else {
      analogWrite(LED1_GREEN, 255-15);
      analogWrite(LED2_GREEN, 255-15);
      analogWrite(LED3_GREEN, 255-15);
      //digitalWrite(LED1_GREEN, HIGH);
      //digitalWrite(LED2_GREEN, HIGH);
      //digitalWrite(LED3_GREEN, HIGH);
    }
    
    // Blue: 3,4,5,6
    if(j == 3 || j == 4 || j == 5 || j == 6) {
      Serial << "b";
      analogWrite(LED1_BLUE, 255-i);
      analogWrite(LED2_BLUE, 255-i);
      analogWrite(LED3_BLUE, 255-i);
    } else {
      analogWrite(LED1_BLUE, 255-15);
      analogWrite(LED2_BLUE, 255-15);
      analogWrite(LED3_BLUE, 255-15);
      //digitalWrite(LED1_BLUE, HIGH);
      //digitalWrite(LED2_BLUE, HIGH);
      //digitalWrite(LED3_BLUE, HIGH);
    }
      
    
    } else {
      
      analogWrite(LED1_RED, 255-i);
      analogWrite(LED1_GREEN, 255-i);
      analogWrite(LED1_BLUE, 255-i);
      
      analogWrite(LED2_RED, 255-i);
      analogWrite(LED2_GREEN, 255-i);
      analogWrite(LED2_BLUE, 255-i);
      
      analogWrite(LED3_RED, 255-i);
      analogWrite(LED3_GREEN, 255-i);
      analogWrite(LED3_BLUE, 255-i);
      
    }
    
    if (i > 150) {
      delay(4);
    }
    if ((i > 125) && (i < 151)) {
      delay(5);
    }
    if (( i > 100) && (i < 126)) {
      delay(7);
    }
    if (( i > 75) && (i < 101)) {
      delay(10);
    }
    if (( i > 50) && (i < 76)) {
      delay(14);
    }
    if (( i > 25) && (i < 51)) {
      delay(18);
    }
    if (( i > 1) && (i < 26)) {
      delay(19);
    }
  }
  
  for(i = 255; i >=15; i-=1)
  {
    
    if(fadingRainbow) {
    
    // Red: 0,1,5,6
    if(j == 0 || j == 1 || j == 5 || j == 6) {
      analogWrite(LED1_RED, 255-i);
      analogWrite(LED2_RED, 255-i);
      analogWrite(LED3_RED, 255-i);
    } else {
      analogWrite(LED1_RED, 255-15);
      analogWrite(LED2_RED, 255-15);
      analogWrite(LED3_RED, 255-15);
      //digitalWrite(LED1_RED, HIGH);
      //digitalWrite(LED2_RED, HIGH);
      //digitalWrite(LED3_RED, HIGH);
    }
    
    // Green: 1,2,3,6
    if(j == 1 || j == 2 || j == 3 || j == 6) {
      Serial << "g";
      analogWrite(LED1_GREEN, 255-i);
      analogWrite(LED2_GREEN, 255-i);
      analogWrite(LED3_GREEN, 255-i);
    } else {
      analogWrite(LED1_GREEN, 255-15);
      analogWrite(LED2_GREEN, 255-15);
      analogWrite(LED3_GREEN, 255-15);
      //digitalWrite(LED1_GREEN, HIGH);
      //digitalWrite(LED2_GREEN, HIGH);
      //digitalWrite(LED3_GREEN, HIGH);
    }
    
    // Blue: 3,4,5,6
    if(j == 3 || j == 4 || j == 5 || j == 6) {
      Serial << "b";
      analogWrite(LED1_BLUE, 255-i);
      analogWrite(LED2_BLUE, 255-i);
      analogWrite(LED3_BLUE, 255-i);
    } else {
      analogWrite(LED1_BLUE, 255-15);
      analogWrite(LED2_BLUE, 255-15);
      analogWrite(LED3_BLUE, 255-15);
      //digitalWrite(LED1_BLUE, HIGH);
      //digitalWrite(LED2_BLUE, HIGH);
      //digitalWrite(LED3_BLUE, HIGH);
    }
    
    } else {
     
      analogWrite(LED1_RED, 255-i);
      analogWrite(LED1_GREEN, 255-i);
      analogWrite(LED1_BLUE, 255-i);
      
      analogWrite(LED2_RED, 255-i);
      analogWrite(LED2_GREEN, 255-i);
      analogWrite(LED2_BLUE, 255-i);
      
      analogWrite(LED3_RED, 255-i);
      analogWrite(LED3_GREEN, 255-i);
      analogWrite(LED3_BLUE, 255-i);
      
    }
    
    if (i > 150) {
      delay(4);
    }
    if ((i > 125) && (i < 151)) {
      delay(5);
    }
    if (( i > 100) && (i < 126)) {
      delay(7);
    }
    if (( i > 75) && (i < 101)) {
      delay(10);
    }
    if (( i > 50) && (i < 76)) {
      delay(14);
    }
    if (( i > 25) && (i < 51)) {
      delay(18);
    }
    if (( i > 1) && (i < 26)) {
      delay(19);
    }
  }
  
  j++;
  if(j == 7) j=0;
  
  delay(970);
  /*
  if(!fadingRainbow) {
  delay(970);
  } else {
    delay(885);
    for(i = 0 ; i <= 15; i+=1) {
          
      // Red: 0,1,5,6
    if(j == 0 || j == 1 || j == 5 || j == 6) {
      analogWrite(LED1_RED, 255-i);
      analogWrite(LED2_RED, 255-i);
      analogWrite(LED3_RED, 255-i);
    } else {
      digitalWrite(LED1_RED, HIGH);
      digitalWrite(LED2_RED, HIGH);
      digitalWrite(LED3_RED, HIGH);
    }
    
    // Green: 1,2,3,6
    if(j == 1 || j == 2 || j == 3 || j == 6) {
      Serial << "g";
      analogWrite(LED1_GREEN, 255-i);
      analogWrite(LED2_GREEN, 255-i);
      analogWrite(LED3_GREEN, 255-i);
    } else {
      digitalWrite(LED1_GREEN, HIGH);
      digitalWrite(LED2_GREEN, HIGH);
      digitalWrite(LED3_GREEN, HIGH);
    }
    
    // Blue: 3,4,5,6
    if(j == 3 || j == 4 || j == 5 || j == 6) {
      Serial << "b";
      analogWrite(LED1_BLUE, 255-i);
      analogWrite(LED2_BLUE, 255-i);
      analogWrite(LED3_BLUE, 255-i);
    } else {
      digitalWrite(LED1_BLUE, HIGH);
      digitalWrite(LED2_BLUE, HIGH);
      digitalWrite(LED3_BLUE, HIGH);
    }
      
      delay(5);
    }
   
  
  }
  */
  
}


void init_buttons()
{
	pinMode(BUTTON1, INPUT);
	pinMode(BUTTON2, INPUT);
	pinMode(BUTTON3, INPUT);
	pinMode(JOY_SWITCH, INPUT);

	// enable the internal pullups
	digitalWrite(BUTTON1, HIGH);
	digitalWrite(BUTTON2, HIGH);
	digitalWrite(BUTTON3, HIGH);
	digitalWrite(JOY_SWITCH, HIGH);
}


void init_relays()
{
	pinMode(RELAY1, OUTPUT);
	pinMode(RELAY2, OUTPUT);
}


void init_leds()
{
	digitalWrite(LED1_RED, 1);
	digitalWrite(LED1_GREEN, 1);
	digitalWrite(LED1_BLUE, 1);

	pinMode(LED1_RED, OUTPUT);
	pinMode(LED1_GREEN, OUTPUT);
	pinMode(LED1_BLUE, OUTPUT);

	digitalWrite(LED2_RED, 1);
	digitalWrite(LED2_GREEN, 1);
	digitalWrite(LED2_BLUE, 1);

	pinMode(LED2_RED, OUTPUT);
	pinMode(LED2_GREEN, OUTPUT);
	pinMode(LED2_BLUE, OUTPUT);

	digitalWrite(LED3_RED, 1);
	digitalWrite(LED3_GREEN, 1);
	digitalWrite(LED3_BLUE, 1);

	pinMode(LED3_RED, OUTPUT);
	pinMode(LED3_GREEN, OUTPUT);
	pinMode(LED3_BLUE, OUTPUT);
}

void init_joystick(int threshold);

// ==============================================================================
// Austria Microsystems i2c Joystick
void init_joystick(int threshold)
{
	byte status = 0;

	pinMode(JOY_SWITCH, INPUT);
	digitalWrite(JOY_SWITCH, HIGH);

	pinMode(JOY_nINT, INPUT);
	digitalWrite(JOY_nINT, HIGH);

	pinMode(JOY_nRESET, OUTPUT);

	digitalWrite(JOY_nRESET, 1);
	delay(1);
	digitalWrite(JOY_nRESET, 0);
	delay(1);
	digitalWrite(JOY_nRESET, 1);

	Wire.begin();

	do {
		status = read_joy_reg(0x0f);
	} while ((status & 0xf0) != 0xf0);

	// invert magnet polarity setting, per datasheet
	write_joy_reg(0x2e, 0x86);

	calibrate_joystick(threshold);
}


int offset_X, offset_Y;

void calibrate_joystick(int dz)
{
	char iii;
	int x_cal = 0;
	int y_cal = 0;

	// Low Power Mode, 20ms auto wakeup
	// INTn output enabled
	// INTn active after each measurement
	// Normal (non-Reset) mode
	write_joy_reg(0x0f, 0x00);
	delay(1);

	// dummy read of Y_reg to reset interrupt
	read_joy_reg(0x11);

	for(iii = 0; iii != 16; iii++) {
		while(!joystick_interrupt()) {}

		x_cal += read_joy_reg(0x10);
		y_cal += read_joy_reg(0x11);
	}

	// divide by 16 to get average
	offset_X = -(x_cal>>4);
	offset_Y = -(y_cal>>4);

	write_joy_reg(0x12, dz - offset_X);  // Xp, LEFT threshold for INTn
	write_joy_reg(0x13, -dz - offset_X);  // Xn, RIGHT threshold for INTn
	write_joy_reg(0x14, dz - offset_Y);  // Yp, UP threshold for INTn
	write_joy_reg(0x15, -dz - offset_Y);  // Yn, DOWN threshold for INTn

	// dead zone threshold detect requested?
	if (dz)
		write_joy_reg(0x0f, 0x04);
}


void read_joystick(int *x, int *y)
{
	*x = read_joy_reg(0x10) + offset_X;
	*y = read_joy_reg(0x11) + offset_Y;  // reading Y clears the interrupt
}

char joystick_interrupt()
{
	return digitalRead(JOY_nINT) == 0;
}


#define  JOY_I2C_ADDR    0x40

char read_joy_reg(char reg_addr)
{
	char c;

	Wire.beginTransmission(JOY_I2C_ADDR);
	Wire.send(reg_addr);
	Wire.endTransmission();

	Wire.requestFrom(JOY_I2C_ADDR, 1);

	while(Wire.available())
		c = Wire.receive();

	return c;
}

void write_joy_reg(char reg_addr, char val)
{
	Wire.beginTransmission(JOY_I2C_ADDR);
	Wire.send(reg_addr);
	Wire.send(val);
	Wire.endTransmission();
}


