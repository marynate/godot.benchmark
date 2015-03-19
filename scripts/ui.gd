extends Node

var _controls
var _back
var _title

func _ready():
	_controls=get_node("controls")
	_back=get_node("back")
	_title=get_node("title")
	_controls.show()
	_back.hide()
	_title.set_text("Godot Benchmark")


func benchmark_on(scene):
	_controls.hide()
	_back.show()
	_title.set_text(scene.replace("_"," ").capitalize())
	
func benchmark_off():
	_controls.show()
	_back.hide()
	_title.set_text("Godot Benchmark")
	