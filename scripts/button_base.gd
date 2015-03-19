extends Button

var global
var ui

func _ready():
	global=get_tree().get_root().get_node("global")
	ui=get_node("/root/world/ui")

func load_benchmark(scene):
	ui.benchmark_on(scene)
	global.load_benchmark(scene)
	
func quit_benchmark():
	ui.benchmark_off()
	global.quit_benchmark()
	