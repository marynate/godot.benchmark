extends Node


var counter
var host
var spawn_timer
var catchup_timer
var prefab
var total_cnt = 0

func _start():
	get_node("start").hide()
	counter.show()
	spawn_timer.connect("timeout",self, "_spawn")	
	spawn_timer.start()
	catchup_timer.connect("timeout",self,"_catchup")
	
func _spawn():
	if (OS.get_frames_per_second() < 30):
		spawn_timer.stop()
		#counter.set_text("Final result:" + str(total_cnt))
		catchup_timer.start()
	else:
		var a = prefab.instance()
		a.set_pos( Vector2(rand_range(-400, 400),rand_range(-10,10)) ) 
		host.add_child(a)
		total_cnt += 1
		counter.set_text(str(total_cnt))
		
func _catchup():
	if (OS.get_frames_per_second() > 30):
		spawn_timer.start()
	else:
		counter.set_text("Final result:" + str(total_cnt))

func _ready():
	get_node("start").connect("pressed", self, "_start")
	spawn_timer=get_node("spawn_timer")
	catchup_timer=get_node("catchup_timer")
	counter = get_node("counter")
	host = get_node("host")
	prefab = load("res://prefabs/rigibody_2d_tiny.scn")
	



