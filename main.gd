extends Node2D

onready var terminal = get_node("Control/Panel/terminal")
onready var output = get_node("Control/Panel/output")
onready var terminal_input = get_node("Control/Panel/input")
onready var option_button = get_node("Control/Panel/OptionButton")

var user_input
var get_text
var option_button_id

func _ready():
	output.clear()
	terminal_input.clear()

func dectobin(value):
	output.text += value + "(dec) = ..\n"
	var num = int(value)
	var hasil_bagi 
	var sisa_bagi 
	var result = []
	var binary
	for _i in range(num):
		if num > 0:
			hasil_bagi = num / 2
			sisa_bagi = num % 2
			output.text += str(num) + " / 2 = "+ str(hasil_bagi) + " dengan sisa " + str(sisa_bagi) + "\n"
			result.append(sisa_bagi)
		num = int(hasil_bagi)
	output.text += "\n"+ str(value) + "(dec) = " 
	result.invert()
	for i in range(result.size()):
		binary = result[i]
		output.text += str(binary)
	output.text += "(bin)"

func dectooct(value):
	output.text += value + "(dec) = ..\n"
	var num = int(value)
	var hasil_bagi 
	var sisa_bagi 
	var result = []
	var binary
	for _i in range(num):
		if num > 0:
			hasil_bagi = num / 8
			sisa_bagi = num % 8
			output.text += str(num) + " / 8 = "+ str(hasil_bagi) + " dengan sisa " + str(sisa_bagi) + "\n"
			result.append(sisa_bagi)
		num = int(hasil_bagi)
	output.text += "\n"+ str(value) + "(dec) = " 
	result.invert()
	for i in range(result.size()):
		binary = result[i]
		output.text += str(binary)
	output.text += "(oct)"

func dectohex(value):
	output.text += value + "(dec) = ..\n"
	var num = int(value)
	var hasil_bagi 
	var sisa_bagi 
	var result = []
	var binary
	for _i in range(num):
		if num > 0:
			hasil_bagi = num / 16
			sisa_bagi = num % 16
			match sisa_bagi:
					10:
						sisa_bagi = "A"
					11:
						sisa_bagi = "B"
					12:
						sisa_bagi = "C"
					13:
						sisa_bagi = "D"
					14:
						sisa_bagi = "E"
					15:
						sisa_bagi = "F"
			if str(sisa_bagi).length() > 1:
				match sisa_bagi.find_last():
					0:
						sisa_bagi = "A"
					1:
						sisa_bagi = "B"
					2:
						sisa_bagi = "C"
					3:
						sisa_bagi = "D"
					4:
						sisa_bagi = "E"
					5:
						sisa_bagi = "F"
			output.text += str(num) + " / 16 = "+ str(hasil_bagi) + " dengan sisa " + str(sisa_bagi) + "\n"
			result.append(sisa_bagi)
		num = int(hasil_bagi)
	output.text += "\n"+ str(value) + "(dec) = " 
	result.invert()
	output.text += "0x"
	for i in range(result.size()):
		binary = result[i]
		output.text += str(binary)
	output.text += "(hex)"

func _on_input_text_entered(new_text):
	output.clear()
	option_button_id = option_button.get("selected")
	user_input = new_text
	match option_button_id:
		0:
			dectobin(user_input)
		1:
			dectooct(user_input)
		2:
			dectohex(user_input)
	terminal_input.clear()
	return user_input

func _on_Button_pressed():
	var new_text = terminal_input.get_text()
	_on_input_text_entered(new_text)

func _on_clear_button_pressed():
	output.clear()

















