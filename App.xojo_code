#tag Class
Protected Class App
Inherits ConsoleApplication
	#tag Event
		Function Run(args() as String) As Integer
		  Print "1) RGB LED Test"
		  Print "2) Servo Test"
		  
		  While True
		    Print "Choose: "
		    Dim value As String = Input
		    
		    Select Case value
		    Case "1"
		      RGBLEDTest
		    Case "2"
		      ServoTest
		    Else
		      Quit
		    End Select
		  Wend
		  
		  GPIO.Cleanup
		  
		End Function
	#tag EndEvent


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
		End Sub
	#tag EndMethod


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
