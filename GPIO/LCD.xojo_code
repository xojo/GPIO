#tag Class
Protected Class LCD
	#tag Method, Flags = &h0
		Sub AutoScrollOff()
		  // def noAutoscroll(self):
		  // """ This will 'left justify' text from the cursor """
		  // self.displaymode &= ~self.LCD_kEntryShiftIncrement
		  // self.write4bits(self.LCD_kEntryModeSet | self.displaymode)
		  
		  DisplayModeValue = Bitwise.BitAnd(DisplayModeValue, Not kEntryShiftIncrement)
		  SendByte(Bitwise.BitOr(kEntryModeSet, DisplayModeValue))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AutoScrollOn()
		  // This will 'right justify' text from the cursor
		  
		  // def autoscroll(self):
		  // """ This will 'right justify' text from the cursor """
		  // self.displaymode |= self.LCD_kEntryShiftIncrement
		  // self.write4bits(self.LCD_kEntryModeSet | self.displaymode)
		  
		  DisplayModeValue = Bitwise.BitOr(DisplayModeValue, kEntryShiftIncrement)
		  SendByte(Bitwise.BitOr(kEntryModeSet, DisplayModeValue))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BlinkOff()
		  // Turn the 
		  // def noBlink(self):
		  // """ Turn the blinking cursor off """
		  // self.displaycontrol &= ~self.LCD_BLINKON
		  // self.write4bits(self.LCD_DISPLAYCONTROL | self.displaycontrol)
		  
		  DisplayControlValue = Bitwise.BitAnd(DisplayControlValue, kBlinkOn)
		  SendByte(Bitwise.BitOr(kDisplayControl, DisplayControlValue))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BlinkOn()
		  // Turn the blinking cursor on
		  
		  DisplayControlValue = Bitwise.BitOr(DisplayControlValue, kBlinkOn)
		  SendByte(Bitwise.BitOr(kDisplayControl, DisplayControlValue))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Clear()
		  // Clears the display
		  
		  SendByte(kClearDisplay)
		  GPIO.DelayMicroseconds(3000)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(rs As Integer, e As Integer, d4 As Integer, d5 As Integer, d6 As Integer, d7 As Integer)
		  // Initialize the display
		  RSPin = rs // Register Select
		  EPin = e // Enable
		  D4Pin = d4 // Data 4
		  D5Pin = d5 // Data 5
		  D6Pin = d6 // Data 6
		  D7Pin = d7 // Data 7
		  
		  // Set the pins to accept output
		  GPIO.PinMode(RSPin, GPIO.OUTPUT)
		  GPIO.PinMode(EPin, GPIO.OUTPUT)
		  GPIO.PinMode(D4Pin, GPIO.OUTPUT)
		  GPIO.PinMode(D5Pin, GPIO.OUTPUT)
		  GPIO.PinMode(D6Pin, GPIO.OUTPUT)
		  GPIO.PinMode(D7Pin, GPIO.OUTPUT)
		  
		  SendByte(&h33) // 110011 Initialise
		  SendByte(&h32) // 110010 Initialise
		  SendByte(&h06) // 000110 Cursor move direction
		  SendByte(&h0C) // 001100 Display On,Cursor Off, Blink Off
		  SendByte(&h28) // 101000 Data length, number of lines, font size
		  SendByte(&h01) // 000001 Clear display
		  
		  GPIO.DelayMicroseconds(5000)
		  
		  DisplayControlValue = Bitwise.BitOr(kDisplayOn, kCursorOff, kBlinkOff)
		  DisplayModeValue = Bitwise.BitOr(kEntryLeft, kEntryShiftDecrement)
		  SendByte(Bitwise.BitOr(kEntryModeSet, DisplayModeValue))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CursorOn()
		  // Turns the underline cursor on
		  
		  DisplayControlValue = Bitwise.BitOr(DisplayControlValue, kCursorOn)
		  SendByte(Bitwise.BitOr(kDisplayControl, DisplayControlValue))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DisplayOff()
		  // Turns the display off, hiding its text
		  
		  DisplayControlValue = Bitwise.BitAnd(kDisplayControl, Not kDisplayOn)
		  SendByte(Bitwise.BitOr(DisplayControlValue, kDisplayControl))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DisplayOn()
		  // Turns the display on, redisplaying any text that was there
		  
		  DisplayControlValue = Bitwise.BitOr(DisplayControlValue, kDisplayOn)
		  SendByte(Bitwise.BitOr(kDisplayControl, DisplayControlValue))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Home()
		  // Moves the cursor to the home position (top left, usually)
		  
		  SendByte(kReturnHome)
		  GPIO.DelayMicroseconds(3000)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PulseEnable()
		  // Pulse the enable pin: OFF->ON->OFF
		  GPIO.DigitalWrite(EPin, GPIO.OFF)
		  GPIO.DelayMicroseconds(5)
		  GPIO.DigitalWrite(EPin, GPIO.ON)
		  GPIO.DelayMicroseconds(5)
		  GPIO.DigitalWrite(EPin, GPIO.OFF)
		  GPIO.DelayMicroseconds(5)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ScrollDisplayLeft()
		  // Scrolls the display left without changing the RAM
		  
		  Dim b As Integer
		  b = Bitwise.BitOr(kCursorShift, kDisplayMove, kMoveLeft)
		  
		  SendByte(b)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ScrollDisplayRight()
		  // Scrolls the display right without changing the RAM
		  
		  Dim b As Integer
		  b = Bitwise.BitOr(kCursorShift, kDisplayMove, kMoveRight)
		  
		  SendByte(b)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SendByte(bits As Integer, mode As Boolean = False)
		  // Sends a byte to the LCD by splitting it into 
		  If mode Then
		    GPIO.DigitalWrite(RSPin, GPIO.HIGH)
		  Else
		    GPIO.DigitalWrite(RSPin, GPIO.LOW)
		  End If
		  
		  GPIO.DigitalWrite(D4Pin, GPIO.OFF)
		  GPIO.DigitalWrite(D5Pin, GPIO.OFF)
		  GPIO.DigitalWrite(D6Pin, GPIO.OFF)
		  GPIO.DigitalWrite(D7Pin, GPIO.OFF)
		  
		  If Bitwise.BitAnd(bits, &h10) = &h10 Then
		    GPIO.DigitalWrite(D4Pin, GPIO.ON)
		  End If
		  If Bitwise.BitAnd(bits, &h20) = &h20 Then
		    GPIO.DigitalWrite(D5Pin, GPIO.ON)
		  End If
		  If Bitwise.BitAnd(bits, &h40) = &h40 Then
		    GPIO.DigitalWrite(D6Pin, GPIO.ON)
		  End If
		  If Bitwise.BitAnd(bits, &h80) = &h80 Then
		    GPIO.DigitalWrite(D7Pin, GPIO.ON)
		  End If
		  
		  PulseEnable
		  
		  GPIO.DigitalWrite(D4Pin, GPIO.OFF)
		  GPIO.DigitalWrite(D5Pin, GPIO.OFF)
		  GPIO.DigitalWrite(D6Pin, GPIO.OFF)
		  GPIO.DigitalWrite(D7Pin, GPIO.OFF)
		  
		  If Bitwise.BitAnd(bits, &h01) = &h01 Then
		    GPIO.DigitalWrite(D4Pin, GPIO.ON)
		  End If
		  If Bitwise.BitAnd(bits, &h02) = &h02 Then
		    GPIO.DigitalWrite(D5Pin, GPIO.ON)
		  End If
		  If Bitwise.BitAnd(bits, &h04) = &h04 Then
		    GPIO.DigitalWrite(D6Pin, GPIO.ON)
		  End If
		  If Bitwise.BitAnd(bits, &h08) = &h08 Then
		    GPIO.DigitalWrite(D7Pin, GPIO.ON)
		  End If
		  
		  PulseEnable
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetMessage(msg As String, line As Integer = 1)
		  Select Case line
		  Case 1
		    line = kLine1
		  Case 2
		    line = kLine2
		  Case 3
		    line = kLine3
		  Case 4
		    line = kLine4
		  Else
		    line = kLine1
		  End Select
		  
		  SendByte(line)
		  
		  Dim chars() As String = msg.Split("")
		  
		  'Dim maxWidth As Integer = Min(chars.Ubound, kCharWidth-1)
		  Dim maxWidth As Integer = chars.Ubound
		  
		  For i As Integer = 0 To maxWidth
		    SendByte(chars(i).Asc, True)
		  Next
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		The LCD class should work with LCD character displays that
		use the HD44780 LCD controller.
		
		The code for the LCD module is based on Python code from these sites:
		
		https://github.com/adafruit/Adafruit-Raspberry-Pi-Python-Code/blob/master/Adafruit_CharLCD/Adafruit_CharLCD.py
		
		http://www.raspberrypi-spy.co.uk/2012/08/20x4-lcd-module-control-using-python/
		
		
	#tag EndNote


	#tag Property, Flags = &h21
		Private D4Pin As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private D5Pin As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private D6Pin As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private D7Pin As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private DisplayControlValue As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private DisplayModeValue As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private EPin As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private RSPin As Integer
	#tag EndProperty


	#tag Constant, Name = kBlinkOff, Type = Double, Dynamic = False, Default = \"0", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kBlinkOn, Type = Double, Dynamic = False, Default = \"1", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kCharWidth, Type = Double, Dynamic = False, Default = \"20", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kClearDisplay, Type = Double, Dynamic = False, Default = \"1", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kCursorOff, Type = Double, Dynamic = False, Default = \"0", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kCursorOn, Type = Double, Dynamic = False, Default = \"&h02", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kCursorShift, Type = Double, Dynamic = False, Default = \"&h10", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDisplayControl, Type = Double, Dynamic = False, Default = \"&h08", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDisplayMove, Type = Double, Dynamic = False, Default = \"&h08", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDisplayOff, Type = Double, Dynamic = False, Default = \"0", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDisplayOn, Type = Double, Dynamic = False, Default = \"&h04", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kEntryLeft, Type = Double, Dynamic = False, Default = \"2", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kEntryModeSet, Type = Double, Dynamic = False, Default = \"4", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kEntryShiftDecrement, Type = Double, Dynamic = False, Default = \"0", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kEntryShiftIncrement, Type = Double, Dynamic = False, Default = \"1", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kLine1, Type = Double, Dynamic = False, Default = \"&h80", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kLine2, Type = Double, Dynamic = False, Default = \"&hC0", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kLine3, Type = Double, Dynamic = False, Default = \"&h94", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kLine4, Type = Double, Dynamic = False, Default = \"&hD4", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kMoveLeft, Type = Double, Dynamic = False, Default = \"&h00", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kMoveRight, Type = Double, Dynamic = False, Default = \"&h04", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kReturnHome, Type = Double, Dynamic = False, Default = \"2", Scope = Protected
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
End Class
#tag EndClass
