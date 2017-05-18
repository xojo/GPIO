# GPIO
A module for accessing the Raspberry Pi GPIO connector from Xojo apps.

http://www.xojo.com

Requires the wiringPi library to be installed so that libwiringPi.so is available.

http://wiringpi.com

## Usage
Copy the GPIO module from this project to your own project. For additional information and examples refer to the Xojo Dev Center:

* [Pi Overview][1]
* [GPIO][2]

## Tutorials
* [Blinking LED][3]
* [Button LED][4]
* [Desktop GPIO][5]
* [RGB LED][6]
* [Servo][7]
* [Buzzer][8]
* [LCD][9]

[1]: http://developer.xojo.com/raspberry-pi	"PiOverview"
[2]: http://developer.xojo.com/gpio "GPIO"
[3]: http://developer.xojo.com/rpi-blinking-led-tutorial "Blinking LED"
[4]: http://developer.xojo.com/button-led-tutorial "Button LED"
[5]: http://developer.xojo.com/desktop-gpio-app "Desktop"
[6]: http://developer.xojo.com/rpi-using-rgb-led "RGB LED"
[7]: http://developer.xojo.com/rpi-controlling-a-servo "Servo"
[8]: http://developer.xojo.com/rpi-using-a-buzzer "Buzzer"
[9]: http://developer.xojo.com/rpi-lcd-character-display "LCD"

## Changes
### v1.7.3
* Corrected Xojo method signature for SPIDataRW to use CString to fix compile error.

### v1.7.2
* Corrected Declare method signature for SPIDataRW so that you can actually get the output.

### v1.7.1
* Setup, SetupPhys and SetupSys now also initialize PinDict.

### v1.7
* Commented out WiringPiISR method as it makes its callback in a pre-emptive thread making it unsafe to use with Xojo.

### v1.6
* Added WiringPiISR implementation and related constants (thanks to Bjorn@Einhugur).

### v1.5
* Added GPIO.Cleanup method
* Added GPIO.SoftPwmCreate method
* Added GPIO.SoftPwmWrite method
* Added GPIO.RGBLED class
* Added GPIO.Servo class
* Added GPIO.SoftToneCreate method
* Added GPIO.SoftToneWrite method
* Added GPIO.Version property
* Added GPIO.LCD class
