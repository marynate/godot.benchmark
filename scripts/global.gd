extends Node

var current_benchmark

func load_benchmark(scene):
	var scene_path="res://scenes/"+scene+".scn"
	var s = ResourceLoader.load(scene_path)
	current_benchmark = s.instance()
	get_tree().get_root().get_node("world/host").add_child(current_benchmark)
	
func quit_benchmark():
	if (current_benchmark):
		current_benchmark.queue_free()