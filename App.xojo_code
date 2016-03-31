#tag Class
Protected Class App
Inherits ConsoleApplication
	#tag Event
		Function Run(args() as String) As Integer
		  Print "Xojo GPIO version " + GPIO.Version
		  Print ""
		  
		  Print "1) RGB LED Test"
		  Print "2) Servo Test"
		  Print "3) Buzzer Alarm Test"
		  Print "4) Buzzer Tone Test"
		  Print "5) Buzzer Long Tone Test"
		  Print "6) LCD Test"
		  Print "7) LCD Scroll Test"
		  
		  While True
		    Print "Choose: "
		    Dim value As String = Input
		    
		    Select Case value
		    Case "1"
		      RGBLEDTest
		    Case "2"
		      ServoTest
		    Case "3"
		      BuzzerAlarmTest
		    Case "4"
		      BuzzerToneTest
		    Case "5"
		      BuzzerLongToneTest
		    Case "6"
		      LCDTest
		    Case "7"
		      LCDScrollTest
		    Else
		      Quit
		    End Select
		  Wend
		  
		  GPIO.Cleanup
		  
		End Function
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub BuzzerAlarmTest()
		  GPIO.SetupGPIO
		  
		  Const kBuzzerPin = 5
		  GPIO.PinMode(kBuzzerPin, GPIO.OUTPUT)
		  
		  For i As Integer = 1 To 10
		    GPIO.DigitalWrite(kBuzzerPin, GPIO.LOW)
		    App.DoEvents(100)
		    GPIO.DigitalWrite(kBuzzerPin, GPIO.HIGH)
		    App.DoEvents(100)
		  Next
		  
		  GPIO.Cleanup
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub BuzzerLongToneTest()
		  // Super Mario Brothers theme
		  // http://blog.zeos386sx.com/2015/01/trs-80-model-100-super-mario-brothers.html
		  
		  Const NOTE_B0  = 31
		  Const NOTE_C1  = 33
		  Const NOTE_CS1 = 35
		  Const NOTE_D1  = 37
		  Const NOTE_DS1 = 39
		  Const NOTE_E1  = 41
		  Const NOTE_F1  = 44
		  Const NOTE_FS1 = 46
		  Const NOTE_G1  = 49
		  Const NOTE_GS1 = 52
		  Const NOTE_A1  = 55
		  Const NOTE_AS1 = 58
		  Const NOTE_B1  = 62
		  Const NOTE_C2  = 65
		  Const NOTE_CS2 = 69
		  Const NOTE_D2  = 73
		  Const NOTE_DS2 = 78
		  Const NOTE_E2  = 82
		  Const NOTE_F2  = 87
		  Const NOTE_FS2 = 93
		  Const NOTE_G2  = 98
		  Const NOTE_GS2 = 104
		  Const NOTE_A2  = 110
		  Const NOTE_AS2 = 117
		  Const NOTE_B2  = 1203
		  Const NOTE_C3  = 131
		  Const NOTE_CS3 = 139
		  Const NOTE_D3  = 147
		  Const NOTE_DS3 = 156
		  Const NOTE_E3  = 165
		  Const NOTE_F3  = 175
		  Const NOTE_FS3 = 185
		  Const NOTE_G3  = 196
		  Const NOTE_GS3 = 208
		  Const NOTE_A3  = 220
		  Const NOTE_AS3 = 233
		  Const NOTE_B3  = 247
		  Const NOTE_C4  = 262
		  Const NOTE_CS4 = 277
		  Const NOTE_D4  = 294
		  Const NOTE_DS4 = 311
		  Const NOTE_E4  = 330
		  Const NOTE_F4  = 349
		  Const NOTE_FS4 = 370
		  Const NOTE_G4  = 392
		  Const NOTE_GS4 = 415
		  Const NOTE_A4  = 440
		  Const NOTE_AS4 = 466
		  Const NOTE_B4  = 494
		  Const NOTE_C5  = 523
		  Const NOTE_CS5 = 554
		  Const NOTE_D5  = 587
		  Const NOTE_DS5 = 622
		  Const NOTE_E5  = 659
		  Const NOTE_F5  = 698
		  Const NOTE_FS5 = 740
		  Const NOTE_G5  = 784
		  Const NOTE_GS5 = 831
		  Const NOTE_A5  = 880
		  Const NOTE_AS5 = 932
		  Const NOTE_B5  = 988
		  Const NOTE_C6  = 1047
		  Const NOTE_CS6 = 1109
		  Const NOTE_D6  = 1175
		  Const NOTE_DS6 = 12045
		  Const NOTE_E6  = 1319
		  Const NOTE_F6  = 1397
		  Const NOTE_FS6 = 1480
		  Const NOTE_G6  = 1568
		  Const NOTE_GS6 = 1661
		  Const NOTE_A6  = 1760
		  Const NOTE_AS6 = 1865
		  Const NOTE_B6  = 1976
		  Const NOTE_C7  = 2093
		  Const NOTE_CS7 = 2217
		  Const NOTE_D7  = 2349
		  Const NOTE_DS7 = 2489
		  Const NOTE_E7  = 2637
		  Const NOTE_F7  = 2794
		  Const NOTE_FS7 = 2960
		  Const NOTE_G7  = 3136
		  Const NOTE_GS7 = 3322
		  Const NOTE_A7  = 3520
		  Const NOTE_AS7 = 3729
		  Const NOTE_B7  = 3951
		  Const NOTE_C8  = 4186
		  Const NOTE_CS8 = 4435
		  Const NOTE_D8  = 4699
		  Const NOTE_DS8 = 4978
		  
		  Dim tempo(160) As Integer = Array(120, 120, 120, 120, _
		  120, 120, 120, 120, _
		  120, 120, 120, 120, _
		  120, 120, 120, 120, _
		  120, 120, 120, 120, _
		  120, 120, 120, 120, _
		  120, 120, 120, 120, _
		  120, 120, 120, 120, _
		  90, 90, 90, _
		  120, 120, 120, 120, _
		  120, 120, 120, 120, _
		  120, 120, 120, 120, _
		  120, 120, 120, 120, _
		  120, 120, 120, 120, _
		  120, 120, 120, 120, _
		  120, 120, 120, 120, _
		  90, 90, 90, _
		  120, 120, 120, 120, _
		  120, 120, 120, 120, _
		  120, 120, 120, 120)
		  
		  Dim scale(160) As Integer = Array(NOTE_E7, NOTE_E7, 0, NOTE_E7, _
		  0, NOTE_C7, NOTE_E7, 0, _
		  NOTE_G7, 0, 0,  0, _
		  NOTE_G6, 0, 0, 0, _
		  NOTE_C7, 0, 0, NOTE_G6, _
		  0, 0, NOTE_E6, 0, _
		  0, NOTE_A6, 0, NOTE_B6, _
		  0, NOTE_AS6, NOTE_A6, 0, _
		  NOTE_G6, NOTE_E7, NOTE_G7, _
		  NOTE_A7, 0, NOTE_F7, NOTE_G7, _
		  0, NOTE_E7, 0, NOTE_C7, _
		  NOTE_D7, NOTE_B6, 0, 0, _
		  NOTE_C7, 0, 0, NOTE_G6, _
		  0, 0, NOTE_E6, 0, _
		  0, NOTE_A6, 0, NOTE_B6, _
		  0, NOTE_AS6, NOTE_A6, 0, _
		  NOTE_G6, NOTE_E7, NOTE_G7, _
		  NOTE_A7, 0, NOTE_F7, NOTE_G7, _
		  0, NOTE_E7, 0, NOTE_C7, _
		  NOTE_D7, NOTE_B6, 0, 0)
		  
		  Const kBuzzerPin = 5
		  GPIO.SetupGPIO
		  
		  If GPIO.SoftToneCreate(kBuzzerPin) = 0 Then
		    For i As Integer = 0 To scale.Ubound
		      GPIO.SoftToneWrite(kBuzzerPin, scale(i))
		      App.DoEvents(tempo(i))
		    Next
		  End If
		  
		  GPIO.PinMode(kBuzzerPin, GPIO.INPUT)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub BuzzerToneTest()
		  Const kBuzzerPin = 5
		  
		  // Simple Super Mario Brothers theme
		  Dim scales() As Integer = Array(659, 659, 0, 659, 0, 523, 659, 0, _
		  784, 0, 0, 0, 392, 0, 0, 0, 523, 0, 0, 392, 0, 0, 330)
		  
		  GPIO.SetupGPIO
		  If GPIO.SoftToneCreate(kBuzzerPin) = 0 Then
		    For i As Integer = 0 To scales.Ubound
		      GPIO.SoftToneWrite(kBuzzerPin, scales(i))
		      App.DoEvents(200)
		    Next
		  End If
		  
		  GPIO.PinMode(kBuzzerPin, GPIO.INPUT)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LCDScrollTest()
		  // Display text on 4-line LCD
		  GPIO.SetupGPIO
		  
		  Const kRSPin = 25
		  Const kEPin = 24
		  Const kD4Pin = 23
		  Const kD5Pin = 17
		  Const kD6Pin = 21
		  Const kD7Pin = 22
		  
		  Dim lcd As New GPIO.LCD(kRSPin, kEPin, kD4Pin, kD5Pin, _
		  kD6Pin, kD7Pin)
		  
		  lcd.Clear
		  lcd.Home
		  lcd.SetMessage("This text is scrolling to the right.", 1)
		  For i As Integer = 1 To 20
		    lcd.ScrollDisplayRight
		    App.DoEvents(300)
		  Next
		  
		  lcd.SetMessage("This text is scrolling to the left.", 1)
		  For i As Integer = 1 To 20
		    lcd.ScrollDisplayLeft
		    App.DoEvents(300)
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LCDTest()
		  // Display text on 4-line LCD
		  GPIO.SetupGPIO
		  
		  Const kRSPin = 25
		  Const kEPin = 24
		  Const kD4Pin = 23
		  Const kD5Pin = 17
		  Const kD6Pin = 21
		  Const kD7Pin = 22
		  
		  Dim lcd As New GPIO.LCD(kRSPin, kEPin, kD4Pin, kD5Pin, _
		  kD6Pin, kD7Pin)
		  
		  lcd.Clear
		  lcd.Home
		  lcd.SetMessage("ABCDEFGHIJKLMNOPQRSTUVWXYZ", 1)
		  lcd.SetMessage("abcdefghijklmnopqrstuvwxyz", 2)
		  lcd.SetMessage("1234567890!@#$%^&*()", 3)
		  lcd.SetMessage("-=[];',./_+{}:""<>?", 4)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RGBLEDTest()
		  GPIO.SetupGPIO
		  
		  // These are the pins to which you wired the RGB LED
		  Const kRedPin = 21
		  Const kBluePin = 20
		  Const kGreenPin = 16
		  
		  Dim led As New GPIO.RGBLED(kRedPin, kGreenPin, kBluePin)
		  
		  // Display random colors
		  For i As Integer = 1 To 100
		    led.SetColor(Xojo.Math.RandomInt(0, 255), _
		    Xojo.Math.RandomInt(0, 255), _
		    Xojo.Math.RandomInt(0, 255))
		    
		    App.DoEvents(100)
		  Next
		  
		  // turn everything off
		  led.Off
		  
		  GPIO.Cleanup
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ServoTest()
		  GPIO.SetupGPIO
		  
		  Const kServoPin = 6 // Change to the pin you used
		  Dim servo As New GPIO.Servo(kServoPin)
		  
		  If servo.ErrorCode = 0 Then
		    servo.Neutral
		    App.DoEvents(500)
		    servo.Left
		    App.DoEvents(500)
		    servo.Right
		    App.DoEvents(500)
		    servo.Cleanup
		  End If
		  
		  GPIO.Cleanup
		End Sub
	#tag EndMethod


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
