#tag Class
Protected Class Servo
	#tag Method, Flags = &h0
		Sub Cleanup()
		  GPIO.SoftPwmWrite(ServoPin, 0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(pin As Integer)
		  ServoPin = pin
		  
		  GPIO.PinMode(pin, GPIO.OUTPUT)
		  GPIO.DigitalWrite(pin, GPIO.LOW)
		  
		  // The the parameters of SoftPwmCreate function represent
		  // GPIO pin number, initial value and range.
		  // The smallest period that we can achieve is 100μs
		  // (with a range of 1). In order to generate the
		  // needed 20ms period pulse we need to multiply
		  // 100μs by 200 so we set our range to 200.
		  mErrorCode = GPIO.SoftPwmCreate(pin, 0, 200)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Left()
		  // Pulse high for 2.5ms goes all the way to the left
		  GPIO.SoftPwmWrite(ServoPin, 25)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Neutral()
		  // Pulse high for 1.5ms goes to center/neutral
		  GPIO.SoftPwmWrite(ServoPin, 15)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Right()
		  // Pulse high for 0.5ms goes all the way to the right
		  GPIO.SoftPwmWrite(ServoPin, 5)
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mErrorCode
			End Get
		#tag EndGetter
		ErrorCode As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mErrorCode As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ServoPin As Integer
	#tag EndProperty


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
