extends Node2D

onready var terminal = get_node("Control/Panel/terminal")
onready var output = get_node("Control/Panel/output")
onready var terminal_input = get_node("Control/Panel/input")

var user_input

func _ready():
	output.clear()
	terminal_input.clear()

func check_keyword():
	match user_input:
		"cls":
			output.text = ""
		#easter egg
		"007":
			output.text = "welcome back agent!"

func _on_input_text_entered(new_text):
	output.clear()
	user_input = new_text
	dectobin(user_input)
	check_keyword()
	terminal_input.clear()
	return user_input

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

func _on_Button_pressed():
	var new_text = terminal_input.get_text()
	_on_input_text_entered(new_text)

func _on_clear_button_pressed():
	output.clear()
