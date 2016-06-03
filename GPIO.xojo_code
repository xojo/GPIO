#tag Module
Protected Module GPIO
	#tag Method, Flags = &h1
		Protected Function AnalogRead(pin As Integer) As Integer
		  // analogRead (int pin) ;
		  // This returns the value read on the supplied analog input pin. 
		  // You will need to register additional analog modules to enable
		  // this function for devices such as the Gertboard, quick2Wire analog board, etc.
		  
		  #If TargetARM And TargetLinux Then
		    Soft Declare Function wpAnalogRead Lib "libwiringPi.so" Alias "analogRead" (pin As Integer) As Integer
		    Return wpAnalogRead(pin)
		  #Endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub AnalogWrite(pin As Integer, value As Integer)
		  // analogWrite (int pin, int value) ;
		  // This writes the given value to the supplied analog pin.
		  // You will need to register additional analog modules to
		  // enable this function for devices such as the Gertboard.
		  
		  #If TargetARM And TargetLinux Then
		    Soft Declare Sub wpAnalogWrite Lib "libwiringPi.so" Alias "analogWrite" (pin As Integer, value As Integer)
		    wpAnalogWrite(pin, value)
		  #Endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Cleanup()
		  If PinDict <> Nil Then
		    Dim pins() As Integer
		    For Each p As Xojo.Core.DictionaryEntry In PinDict
		      pins.Append(p.Key)
		    Next
		    
		    For Each p As Integer In pins
		      PinMode(p, GPIO.INPUT)
		    Next
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Delay(howLong As UInteger)
		  // void delay (unsigned int howLong)
		  // This causes program execution to pause for at least howLong milliseconds. 
		  // Due to the multi-tasking nature of Linux it could be longer. 
		  // Note that the maximum delay is an unsigned 32-bit integer or approximately 49 days.
		  
		  #If TargetARM And TargetLinux Then
		    Soft Declare Sub wpDelay Lib "libwiringPi.so" Alias "delay" (howLong As UInteger)
		    wpDelay(howLong)
		  #Endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DelayMicroseconds(howLong As UInteger)
		  // void delayMicroseconds (unsigned int howLong)
		  // This causes program execution to pause for at least howLong microseconds.
		  // Due to the multi-tasking nature of Linux it could be longer.
		  // Note that the maximum delay is an unsigned 32-bit integer microseconds
		  // or approximately 71 minutes.
		  // 
		  // Delays under 100 microseconds are timed using a hard-coded
		  // loop continually polling the system time, Delays over 100 microseconds
		  // are done using the system nanosleep() function – You may need to
		  // consider the implications of very short delays on the overall
		  // performance of the system, especially if using threads.
		  
		  #If TargetARM And TargetLinux Then
		    Soft Declare Sub wpDelayMicroseconds Lib "libwiringPi.so" Alias "delayMicroseconds" (howLong As UInteger)
		    wpDelayMicroseconds(howLong)
		  #Endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function DigitalRead(pin As Integer) As Integer
		  // int digitalRead (int pin) ;
		  // This function returns the value read at the given pin.
		  // It will be HIGH or LOW (1 or 0) depending on the logic level at the pin.
		  
		  #If TargetARM And TargetLinux Then
		    Soft Declare Function wpDigitalRead Lib "libwiringPi.so" Alias "digitalRead" (pin As Integer) As Integer
		    Return wpDigitalRead(pin)
		  #Endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DigitalWrite(pin As Integer, mode As Integer)
		  // void digitalWrite (int pin, int value) ;
		  // Writes the value HIGH or LOW (1 or 0) to the given pin which
		  // must have been previously set as an output.
		  // 
		  // WiringPi treats any non-zero number as HIGH, however 0 is
		  // the only representation of LOW.
		  
		  #If TargetARM And TargetLinux Then
		    Soft Declare Sub wpDigitalWrite Lib "libwiringPi.so" Alias "digitalWrite" (pin As Integer, mode As Integer)
		    wpDigitalWrite(pin, mode)
		  #Endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DigitalWriteByte(value As Integer)
		  // void digitalWriteByte (int value) ;
		  // This writes the 8-bit byte supplied to the first 8 GPIO pins.
		  // It’s the fastest way to set all 8 bits at once to a particular value,
		  // although it still takes two write operations to the Pi’s GPIO hardware.
		  
		  #If TargetARM And TargetLinux Then
		    Soft Declare Sub wpDigitalWriteByte Lib "libwiringPi.so" Alias "digitalWriteByte" (value As Integer)
		    wpDigitalWriteByte(value)
		  #Endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function I2CRead(fd As Integer) As Integer
		  // int wiringPiI2CRead (int fd) ;
		  // Simple device read. Some devices present data when you read them without having to do any register transactions.
		  
		  #If TargetARM And TargetLinux Then
		    Soft Declare Function wpWiringPiI2CRead Lib "libwiringPi.so" Alias "wiringPiI2CRead" (fd As Integer) As Integer
		    Return wpWiringPiI2CRead(fd)
		  #Endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function I2CReadReg16(fd As Integer, reg As Integer) As Int16
		  // int wiringPiI2CReadReg16 (int fd, int reg) ;
		  // Reads a 16-bit value from the device register indicated.
		  
		  #If TargetARM And TargetLinux Then
		    Soft Declare Function wpWiringPiI2CReadReg16 Lib "libwiringPi.so" Alias "wiringPiI2CReadReg16" (fd As Integer, reg As Integer) As Int16
		    
		    Return wpWiringPiI2CReadReg16(fd, reg)
		  #Endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function I2CReadReg8(fd As Integer, reg As Integer) As Int8
		  // int wiringPiI2CReadReg8 (int fd, int reg) ;
		  // Reads an 8-bit value from the device register indicated.
		  
		  #If TargetARM And TargetLinux Then
		    Soft Declare Function wpWiringPiI2CReadReg8 Lib "libwiringPi.so" Alias "wiringPiI2CReadReg8" (fd As Integer, reg As Integer) As Int8
		    Return wpWiringPiI2CReadReg8(fd, reg)
		  #Endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function I2CSetup(devID As Integer) As Integer
		  // int wiringPiI2CSetup (int devId) ;
		  // This initialises the I2C system with your given device identifier.
		  // The ID is the I2C number of the device and you can use the i2cdetect program
		  // to find this out. wiringPiI2CSetup() will work out which revision Raspberry Pi
		  // you have and open the appropriate device in /dev.
		  // 
		  // The return value is the standard Linux filehandle, or -1 if any error – in which case,
		  // you can consult errno as usual.
		  // 
		  // E.g. the popular MCP23017 GPIO expander is usually device Id 0x20,
		  // so this is the number you would pass into wiringPiI2CSetup().
		  
		  #If TargetARM And TargetLinux Then
		    Soft Declare Function wpWiringPiI2CSetup Lib "libwiringPi.so" Alias "wiringPiI2CSetup" (devID As Integer) As Integer
		    Return wpWiringPiI2CSetup(devID)
		  #Endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function I2CWrite(fd As Integer, data As Integer) As Integer
		  // int wiringPiI2CWrite (int fd, int data) ;
		  // Simple device write. Some devices accept data this way without needing to access any internal registers.
		  
		  #If TargetARM And TargetLinux Then
		    Soft Declare Function wpWiringPiI2CWrite Lib "libwiringPi.so" Alias "wiringPiI2CWrite" (fd As Integer, data As Integer) As Integer
		    Return wpWiringPiI2CWrite(fd, data)
		  #Endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function I2CWriteReg16(fd As Integer, reg As Int16, data As Integer) As Integer
		  // int wiringPiI2CWriteReg16 (int fd, int reg, int data) ;
		  // These write a 16-bit data value into the device register indicated.
		  
		  #If TargetARM And TargetLinux Then
		    Soft Declare Function wpWiringPiI2CWriteReg16 Lib "libwiringPi.so" Alias "wiringPiI2CWriteReg16" (fd As Integer, reg As Int16, data As Integer) As Integer
		    Return wpWiringPiI2CWriteReg16(fd, reg, data)
		  #Endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function I2CWriteReg8(fd As Integer, reg As Int8, data As Integer) As Integer
		  // int wiringPiI2CWriteReg8 (int fd, int reg, int data) ;
		  // These write an 8-bit data value into the device register indicated.
		  
		  #If TargetARM And TargetLinux Then
		    Soft Declare Function wpWiringPiI2CWriteReg8 Lib "libwiringPi.so" Alias "wiringPiI2CWriteReg8" (fd As Integer, reg As Int8, data As Integer) As Integer
		    Return wpWiringPiI2CWriteReg8(fd, reg, data)
		  #Endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Micros() As UInteger
		  // unsigned int micros (void)
		  // This returns a number representing the number of microseconds
		  // since your program called one of the wiringPiSetup functions.
		  // It returns an unsigned 32-bit number which wraps after approximately 71 minutes.
		  
		  #If TargetARM And TargetLinux Then
		    Soft Declare Function wpMicros Lib "libwiringPi.so" Alias "micros" () As UInteger
		    Return wpMicros()
		  #Endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Millis() As UInteger
		  // unsigned int millis (void)
		  // This returns a number representing the number of milliseconds
		  // since your program called one of the wiringPiSetup functions.
		  // It returns an unsigned 32-bit number which wraps after 49 days.
		  
		  #If TargetARM And TargetLinux Then
		    Soft Declare Function wpMillis Lib "libwiringPi.so" Alias "millis" () As UInteger
		    Return wpMillis()
		  #Endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function PhysPinToGPIO(physPin As Integer) As Integer
		  // int physPinToGpio (int physPin) ;
		  // This returns the BCM_GPIO pin number of the supplied physical pin on the P1 connector.
		  
		  #If TargetARM And TargetLinux Then
		    Soft Declare Function wpPhysPinToGpio Lib "libwiringPi.so" Alias "physPinToGpio" (physPin As Integer) As Integer
		    Return wpPhysPinToGpio(physPin)
		  #Endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function PiBoardRev() As Integer
		  // int piBoardRev (void) ;
		  // This returns the board revision of the Raspberry Pi.
		  // It will be either 1 or 2. Some of the BCM_GPIO pins changed
		  // number and function when moving from board revision 1 to 2,
		  // so if you are using BCM_GPIO pin numbers, then you need to be aware of the differences.
		  
		  #If TargetARM And TargetLinux Then
		    Soft Declare Function wpPiBoardRev Lib "libwiringPi.so" Alias "piBoardRev" () As Integer
		    Return wpPiBoardRev()
		  #Endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub PiHiPri(priority As Integer)
		  // int piHiPri (int priority) ;
		  // This attempts to shift your program (or thread in a multi-threaded program)
		  // to a higher priority and enables a real-time scheduling.
		  // The priority parameter should be from 0 (the default) to 99 (the maximum).
		  // This won’t make your program go any faster, but it will give it a bigger
		  // slice of time when other programs are running.
		  // The priority parameter works relative to others – so you can make
		  // one program priority 1 and another priority 2 and it will have the same
		  // effect as setting one to 10 and the other to 90 (as long as no other programs
		  // are running with elevated priorities)
		  // 
		  // The return value is 0 for success and -1 for error.
		  // If an error is returned, the program should then consult the
		  // errno global variable, as per the usual conventions.
		  // 
		  // Note: Only programs running as root can change their priority.
		  // If called from a non-root program then nothing happens.
		  
		  #If TargetARM And TargetLinux Then
		    Soft Declare Sub wpPiHiPri Lib "libwiringPi.so" Alias "piHiPri" (priority As Integer)
		    wpPiHiPri(priority)
		  #Endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub PinMode(pin As Integer, mode As Integer)
		  // void pinMode (int pin, int mode) ;
		  // This sets the mode of a pin to either INPUT, OUTPUT, PWM_OUTPUT or GPIO_CLOCK. 
		  // Note that only wiringPi pin 1 (BCM_GPIO 18) supports PWM output and only 
		  // wiringPi pin 7 (BCM_GPIO 4) supports CLOCK output modes.
		  //
		  // This function has no effect when in Sys mode. 
		  // If you need to change the pin mode, then you can do it with the gpio program
		  // in a script before you start your program.
		  
		  #If TargetARM And TargetLinux Then
		    Soft Declare Sub wpPinMode Lib "libwiringPi.so" Alias "pinMode" (pin As Integer, mode As Integer)
		    wpPinMode(pin, mode)
		    
		    // Save the pins to reset to INPUT when Cleanup is called
		    If mode = GPIO.OUTPUT Then
		      PinDict.Value(pin) = ""
		    ElseIf PinDict.HasKey(pin) Then
		      PinDict.Remove(pin)
		    End If
		  #Endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub PullUpDnControl(pin As Integer, pud As Integer)
		  // void pullUpDnControl (int pin, int pud) ;
		  // This sets the pull-up or pull-down resistor mode on the given pin,
		  // which should be set as an input. Unlike the Arduino,
		  // the BCM2835 has both pull-up an down internal resistors.
		  // The parameter pud should be; PUD_OFF, (no pull up/down),
		  // PUD_DOWN (pull to ground) or PUD_UP (pull to 3.3v)
		  // The internal pull up/down resistors have a value of
		  // approximately 50KΩ on the Raspberry Pi.
		  // 
		  // This function has no effect on the Raspberry Pi’s GPIO pins
		  // when in Sys mode. If you need to activate a pull-up/pull-down,
		  // then you can do it with the gpio program in a script before you start your program.
		  
		  #If TargetARM And TargetLinux Then
		    Soft Declare Sub wpPullUpDnControl Lib "libwiringPi.so" Alias "pullUpDnControl" (pin As Integer, pud As Integer)
		    wpPullUpDnControl(pin, pud)
		  #Endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub PwmSetClock(divisor As Integer)
		  // pwmSetClock (int divisor) ;
		  // This sets the divisor for the PWM clock.
		  
		  // Note: The PWM control functions can not be used when in Sys mode. 
		  // To understand more about the PWM system, you’ll need to read the
		  // Broadcom ARM peripherals manual.
		  
		  #If TargetARM And TargetLinux Then
		    Soft Declare Sub wpPwmSetClock Lib "libwiringPi.so" Alias "pwmSetClock" (divisor As Integer)
		    wpPwmSetClock(divisor)
		  #Endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub PwmSetMode(mode As Integer)
		  // pwmSetMode (int mode) ;
		  // The PWM generator can run in 2 modes – “balanced” and “mark:space”.
		  // The mark:space mode is traditional, however the default mode in the
		  // Pi is “balanced”. You can switch modes by supplying the parameter:
		  // PWM_MODE_BAL or PWM_MODE_MS.
		  
		  #If TargetARM And TargetLinux Then
		    Soft Declare Sub wpPwmSetMode Lib "libwiringPi.so" Alias "pwmSetMode" (mode As Integer)
		    wpPwmSetMode(mode)
		  #Endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub PwmSetRange(range As Integer)
		  // pwmSetRange (unsigned int range) ;
		  // This sets the range register in the PWM generator. The default is 1024.
		  
		  #If TargetARM And TargetLinux Then
		    Soft Declare Sub wpPwmSetRange Lib "libwiringPi.so" Alias "pwmSetRange" (range As Integer)
		    wpPwmSetRange(range)
		  #Endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub PwmWrite(pin As Integer, value As Integer)
		  // void pwmWrite (int pin, int value) ;
		  // Writes the value to the PWM register for the given pin.
		  // The Raspberry Pi has one on-board PWM pin, pin 1 (BMC_GPIO 18, Phys 12)
		  // and the range is 0-1024. Other PWM devices may have other PWM ranges.
		  // 
		  // This function is not able to control the Pi’s on-board PWM when in Sys mode.
		  
		  #If TargetARM And TargetLinux Then
		    Soft Declare Sub wpPwmWrite Lib "libwiringPi.so" Alias "pwmWrite" (pin As Integer, value As Integer)
		    wpPwmWrite(pin, value)
		  #Endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SetPadDrive(group As Integer, value As Integer)
		  // setPadDrive (int group, int value) ;
		  // This sets the “strength” of the pad drivers for a particular group of pins.
		  // There are 3 groups of pins and the drive strength is from 0 to 7.
		  // Do not use this unless you know what you are doing.
		  
		  #If TargetARM And TargetLinux Then
		    Soft Declare Sub wpSetPadDrive Lib "libwiringPi.so" Alias "setPadDrive" (group As Integer, value As Integer)
		    wpSetPadDrive(group, value)
		  #Endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Setup()
		  // wiringPiSetup (void) ;
		  // This initialises wiringPi and assumes that the calling program
		  // is going to be using the wiringPi pin numbering scheme.
		  // This is a simplified numbering scheme which provides a mapping
		  // from virtual pin numbers 0 through 16 to the real underlying
		  // Broadcom GPIO pin numbers. See the pins page for a table which
		  // maps the wiringPi pin number to the Broadcom GPIO pin number
		  // to the physical location on the edge connector.
		  // 
		  // This function needs to be called with root privileges.
		  
		  #If TargetARM And TargetLinux Then
		    Soft Declare Sub wiringPiSetup Lib "libwiringPi.so"
		    wiringPiSetup
		  #Else
		    #Pragma Error "wiringPi library only works on Raspberry Pi"
		  #Endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SetupGPIO()
		  // wiringPiSetupGpio (void) ;
		  // This is identical to above, however it allows the calling programs
		  // to use the Broadcom GPIO pin numbers directly with no re-mapping.
		  // 
		  // As above, this function needs to be called with root privileges,
		  // and note that some pins are different from revision 1 to revision 2 boards.
		  
		  #If TargetARM And TargetLinux Then
		    Soft Declare Sub wiringPiSetupGpio Lib "libwiringPi.so"
		    wiringPiSetupGpio
		    
		    PinDict = New Xojo.Core.Dictionary
		  #Else
		    #Pragma Error "wiringPi library only works on Raspberry Pi"
		  #Endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SetupPhys()
		  // wiringPiSetupPhys (void) ;
		  // Identical to above, however it allows the calling programs to
		  // use the physical pin numbers on the P1 connector only.
		  // 
		  // As above, this function needs to be called with root priviliges.
		  
		  #If TargetARM And TargetLinux Then
		    Soft Declare Sub wiringPiSetupPhys Lib "libwiringPi.so"
		    wiringPiSetupPhys
		  #Else
		    #Pragma Error "wiringPi library only works on Raspberry Pi"
		  #Endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SetupSys()
		  // wiringPiSetupSys (void) ;
		  // This initialises wiringPi but uses the /sys/class/gpio interface
		  // rather than accessing the hardware directly.
		  // This can be called as a non-root user provided the GPIO pins
		  // have been exported before-hand using the gpio program.
		  // Pin numbering in this mode is the native Broadcom GPIO numbers – the same
		  // as wiringPiSetupGpio() above, so be aware of the differences
		  // between Rev 1 and Rev 2 boards.
		  // 
		  // Note: In this mode you can only use the pins which have
		  // been exported via the /sys/class/gpio interface before
		  // you run your program. You can do this in a separate shell-script,
		  // or by using the system() function from inside your program to call the gpio program.
		  // 
		  // Also note that some functions have no effect when using
		  // this mode as they’re not currently possible to action unless
		  // called with root privileges. (although you can use system() to
		  // call gpio to set/change modes if needed)
		  
		  #If TargetARM And TargetLinux Then
		    Soft Declare Sub wiringPiSetupSys Lib "libwiringPi.so"
		    wiringPiSetupSys
		  #Else
		    #Pragma Error "wiringPi library only works on Raspberry Pi"
		  #Endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ShiftIn(dPin As UInt8, cPin As UInt8, order As UInt8) As Uint8
		  // uint8_t shiftIn (uint8_t dPin, uint8_t cPin, uint8_t order) ;
		  // This shifts an 8-bit data value in with the data appearing
		  // on the dPin and the clock being sent out on the cPin.
		  // Order is either LSBFIRST or MSBFIRST. The data is sampled after
		  // the cPin goes high. (So cPin high, sample data, cPin low, repeat for 8 bits)
		  // The 8-bit value is returned by the function.
		  
		  #If TargetARM And TargetLinux Then
		    Soft Declare Function wpShiftIn Lib "libwiringPi.so" Alias "shiftIn" (dPin As UInt8, cPin As UInt8, order As UInt8) As Int8
		    Return wpShiftIn(dPin, cPin, order)
		  #Endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ShiftOut(dPin As UInt8, cPin As Uint8, order As Uint8, val As UInt8)
		  // void shiftOut (uint8_t dPin, uint8_t cPin, uint8_t order, uint8_t val) ;
		  // The shifts an 8-bit data value val out with the data being sent out
		  // on dPin and the clock being sent out on the cPin. 
		  // order is as above. Data is clocked out on the rising or 
		  // falling edge – ie. dPin is set, then cPin is taken high then
		  // low – repeated for the 8 bits.
		  
		  #If TargetARM And TargetLinux Then
		    Soft Declare Sub wpShiftOut Lib "libwiringPi.so" Alias "shiftOut" (dPin As UInt8, cPin As UInt8, order As UInt8, val As UInt8)
		    wpShiftOut(dPin, cPin, order, val)
		  #Endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SoftPwmCreate(pin As Integer, initialValue As Integer, pwmRange As Integer) As Integer
		  // int softPwmCreate (int pin, int initialValue, int pwmRange) ;
		  // This creates a software controlled PWM pin.
		  // You can use any GPIO pin and the pin numbering will be
		  // that of the wiringPiSetup() function you used.
		  // Use 100 for the pwmRange, then the value can be
		  // anything from 0 (off) to 100 (fully on) for the given pin.
		  
		  // The return value is 0 for success.
		  // Anything else and you should check the global
		  // errno variable to see what went wrong.
		  
		  #If TargetARM And TargetLinux Then
		    Soft Declare Function wpSoftPwmCreate Lib "libwiringPi.so" Alias "softPwmCreate" (pin As Integer, initialValue As Integer, pwmRange As Integer) As Integer
		    Return wpSoftPwmCreate(pin, initialValue, pwmRange)
		  #Endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SoftPwmWrite(pin As Integer, value As Integer)
		  // void softPwmWrite (int pin, int value) ;
		  // This updates the PWM value on the given pin.
		  // The value is checked to be in-range and pins that
		  // haven’t previously been initialised via softPwmCreate
		  // will be silently ignored.
		  
		  #If TargetARM And TargetLinux Then
		    Soft Declare Sub wpSoftPwmWrite Lib "libwiringPi.so" Alias "softPwmWrite" (pin As Integer, value As Integer)
		    wpSoftPwmWrite(pin, value)
		  #Endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SoftToneCreate(pin As Integer) As Integer
		  // int softToneCreate (int pin) ;
		  // This creates a software controlled tone pin.
		  // You can use any GPIO pin and the pin numbering
		  // will be that of the wiringPiSetup() function you used.
		  
		  // The return value is 0 for success.
		  // Anything else and you should check the
		  // global errno variable to see what went wrong.
		  
		  #If TargetARM And TargetLinux Then
		    Soft Declare Function wpSoftToneCreate Lib "libwiringPi.so" Alias "softToneCreate" (pin As Integer) As Integer
		    Return wpSoftToneCreate(pin)
		  #Endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SoftToneWrite(pin As Integer, freq As Integer)
		  // void softToneWrite (int pin, int freq) ;
		  // This updates the tone frequency value on the given pin.
		  // The tone will be played until you set the frequency to 0.
		  
		  #If TargetARM And TargetLinux Then
		    Soft Declare Sub wpSoftToneWrite Lib "libwiringPi.so" Alias "softToneWrite" (pin As Integer, freq As Integer)
		    wpSoftToneWrite(pin, freq)
		  #Endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SPIDataRW(channel As Integer, data As CString, len As Integer) As Integer
		  // int wiringPiSPIDataRW (int channel, unsigned char *data, int len) ;
		  // This performs a simultaneous write/read transaction over the selected SPI bus.
		  // Data that was in your buffer is overwritten by data returned from the SPI bus.
		  // 
		  // That’s all there is in the helper library. It is possible to do simple
		  // read and writes over the SPI bus using the standard read() and write() system
		  // calls though – write() may be better to use for sending data to chains of
		  // shift registers, or those LED strings where you send RGB triplets of data.
		  // Devices such as A/D and D/A converters usually need to perform a concurrent
		  // write/read transaction to work.
		  // http://wiringpi.com/reference/spi-library/
		  
		  #If TargetARM And TargetLinux Then
		    Soft Declare Function wpWiringPiSPIDataRW Lib "libwiringPi.so" Alias "wiringPiSPIDataRW" (channel As Integer, data As CString, len As Integer) As Integer
		    Return wpWiringPiSPIDataRW(channel, data, len)
		  #Endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SPISetup(channel As Integer, speed As Integer) As Integer
		  // int wiringPiSPISetup (int channel, int speed) ;
		  // This is the way to initialise a channel (The Pi has 2 channels; 0 and 1).
		  // The speed parameter is an integer in the range 500,000 through 32,000,000
		  // and represents the SPI clock speed in Hz.
		  // 
		  // The returned value is the Linux file-descriptor for the device, or -1 on error.
		  // If an error has happened, you may use the standard errno global variable to see why.
		  // http://wiringpi.com/reference/spi-library/
		  
		  #If TargetARM And TargetLinux Then
		    Soft Declare Function wpWiringPiSPISetup Lib "libwiringPi.so" Alias "wiringPiSPISetup" (channel As Integer, speed As Integer) As Integer
		    Return wpWiringPiSPISetup(channel, speed)
		  #Endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function WIringPiISR(pin As Integer, edgeType As Integer, p As Ptr) As Integer
		  // int wiringPiISR (int pin, int edgeType,  void (*function)(void)) ;
		  // This function registers a function to received interrupts on the specified pin.
		  // The edgeType parameter is either INT_EDGE_FALLING, INT_EDGE_RISING,
		  // INT_EDGE_BOTH or INT_EDGE_SETUP. If it is INT_EDGE_SETUP then no
		  // initialisation of the pin will happen – it’s assumed that you have already
		  // setup the pin elsewhere (e.g. with the gpio program), but if you specify one
		  // of the other types, then the pin will be exported and initialised as specified.
		  // This is accomplished via a suitable call to the gpio utility program,
		  // so it need to be available.
		  // 
		  // The pin number is supplied in the current mode – native wiringPi, BCM_GPIO,
		  // physical or Sys modes.
		  // 
		  // This function will work in any mode, and does not need root privileges to work.
		  // 
		  // The function will be called when the interrupt triggers.
		  // When it is triggered, it’s cleared in the dispatcher before calling your
		  // function, so if a subsequent interrupt fires before you finish your handler,
		  // then it won’t be missed. (However it can only track one more interrupt,
		  // if more than one interrupt fires while one is being handled then they will be ignored)
		  // 
		  // This function is run at a high priority (if the program is run
		  // using sudo, or as root) and executes concurrently with the main program.
		  // It has full access to all the global variables, open file handles and so on.
		  // 
		  // See the isr.c example program for more details on how to use this feature.
		  
		  // Unfortunately, wiringPiISR runs the callback on a preemptive thread
		  // making this method unsafe to use with Xojo.
		  // #If TargetARM And TargetLinux Then
		  // Soft Declare Function wpISR Lib "libwiringPi.so" Alias "wiringPiISR" (pin As Integer, mode As Integer, p as ptr) As Integer
		  // Return wpISR(pin, edgeType, p)
		  // #Endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function WpiPinToGPIO(wPiPin As Integer) As Integer
		  // int wpiPinToGpio (int wPiPin) ;
		  // This returns the BCM_GPIO pin number of the supplied wiringPi pin.
		  // It takes the board revision into account.
		  
		  #If TargetARM And TargetLinux Then
		    Soft Declare Function wpWpiPinToGpio Lib "libwiringPi.so" Alias "wpiPinToGpio" (wPiPin As Integer) As Integer
		    Return wpWpiPinToGpio(wPiPin)
		  #Endif
		End Function
	#tag EndMethod


	#tag Note, Name = wiringPi GPIO
		Requires wiringPi to be installed so that libwiringPi.so is available.
		
		http://wiringpi.com
		http://wiringpi.com/reference/
		
	#tag EndNote


	#tag Property, Flags = &h21
		Private PinDict As Xojo.Core.Dictionary
	#tag EndProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return "1.7"
			End Get
		#tag EndGetter
		Protected Version As Text
	#tag EndComputedProperty


	#tag Constant, Name = EDGE_BOTH, Type = Double, Dynamic = False, Default = \"3", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = EDGE_FALLING, Type = Double, Dynamic = False, Default = \"1", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = EDGE_RISING, Type = Double, Dynamic = False, Default = \"2", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = EDGE_SETUP, Type = Double, Dynamic = False, Default = \"0", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = HIGH, Type = Double, Dynamic = False, Default = \"1", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = INPUT, Type = Double, Dynamic = False, Default = \"0", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = LOW, Type = Double, Dynamic = False, Default = \"0", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = LSBFIRST, Type = Double, Dynamic = False, Default = \"0", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = MSBFIRST, Type = Double, Dynamic = False, Default = \"1", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = NUM_PINS, Type = Double, Dynamic = False, Default = \"17", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = OFF, Type = Double, Dynamic = False, Default = \"0", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ON, Type = Double, Dynamic = False, Default = \"1", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = OUTPUT, Type = Double, Dynamic = False, Default = \"1", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PUD_DOWN, Type = Double, Dynamic = False, Default = \"1", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PUD_OFF, Type = Double, Dynamic = False, Default = \"0", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PUD_UP, Type = Double, Dynamic = False, Default = \"2", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PWM_MODE_BAL, Type = Double, Dynamic = False, Default = \"1", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PWM_MODE_MS, Type = Double, Dynamic = False, Default = \"0", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PWM_OUTPUT, Type = Double, Dynamic = False, Default = \"2", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = WPI_MODE_GPIO, Type = Double, Dynamic = False, Default = \"1", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = WPI_MODE_GPIO_SYS, Type = Double, Dynamic = False, Default = \"2", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = WPI_MODE_PIFACE, Type = Double, Dynamic = False, Default = \"3", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = WPI_MODE_PINS, Type = Double, Dynamic = False, Default = \"0", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = WPI_MODE_UNINITIALISED, Type = Double, Dynamic = False, Default = \"-1", Scope = Protected
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
