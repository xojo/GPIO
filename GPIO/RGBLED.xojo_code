#tag Class
Protected Class RGBLED
	#tag Method, Flags = &h21
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(rp As Integer, gp As Integer, bp As Integer)
		  RedPin = rp
		  GreenPin = gp
		  BluePin = bp
		  
		  GPIO.PinMode(RedPin, GPIO.OUTPUT)
		  GPIO.PinMode(GreenPin, GPIO.OUTPUT)
		  GPIO.PinMode(BluePin, GPIO.OUTPUT)
		  
		  GPIO.DigitalWrite(RedPin, GPIO.OFF)
		  GPIO.DigitalWrite(GreenPin, GPIO.OFF)
		  GPIO.DigitalWrite(BluePin, GPIO.OFF)
		  
		  Call GPIO.SoftPwmCreate(RedPin, 0, kMaxValue)
		  Call GPIO.SoftPwmCreate(GreenPin, 0, kMaxValue)
		  Call GPIO.SoftPwmCreate(BluePin, 0, kMaxValue)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Off()
		  GPIO.SoftPwmWrite(RedPin, 0)
		  GPIO.SoftPwmWrite(GreenPin, 0)
		  GPIO.SoftPwmWrite(BluePin, 0)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetColor(red As Integer, green As Integer, blue As Integer)
		  GPIO.SoftPwmWrite(RedPin, red)
		  GPIO.SoftPwmWrite(GreenPin, green)
		  GPIO.SoftPwmWrite(BluePin, blue)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private BluePin As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private GreenPin As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private RedPin As Integer
	#tag EndProperty


	#tag Constant, Name = kMaxValue, Type = Double, Dynamic = False, Default = \"255", Scope = Public
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
