
extends Node

const MODE_RENDER_ONLY=0
const MODE_UPDATE_IN_DRAW=1
const MODE_UPDATE_IN_PROCESS=2
const MODE_UPDATE_IN_INSTANCE=3

export(int,"RENDER_ONLY","UPDATE_IN_DRAW","UPDATE_IN_PROCESS","UPDATE_IN_INSTANCE") var mode=0
export(int) var sprite_count=5000
export(float) var rand_move_speed=1200.0

var _sprite_list=[]
var sprite_prefab=preload("res://prefabs/sprite_m.scn")
var texture_res = preload("res://textures/m.png")

func _ready():

	if (mode!=MODE_UPDATE_IN_DRAW):
		for i in range(sprite_count):
			var sprite = sprite_prefab.instance()
			sprite.set_pos(Vector2(rand_range(30,930),rand_range(30,680)))
			add_child(sprite)
			if(mode==MODE_UPDATE_IN_INSTANCE):
				sprite.set_update(rand_move_speed)
			_sprite_list.push_back(sprite)
			
	if (mode!=MODE_RENDER_ONLY):
		set_process(true)
	
func _draw():

	if (mode!=MODE_UPDATE_IN_DRAW):
		return
		
	for i in range(sprite_count):
		var pos = Vector2(rand_range(30,930),rand_range(30,680))
		VisualServer.canvas_item_add_texture_rect(get_canvas_item(),Rect2(pos,Vector2(64,64)),texture_res.get_rid(),false)

func _process(delta):

	if (mode==MODE_UPDATE_IN_DRAW):
		update()
		return

	var speed = rand_move_speed*delta
	for s in _sprite_list:
		var pos = s.get_pos()
		pos.x = pos.x + rand_range(-speed,speed)
		pos.y = pos.y + rand_range(-speed,speed)
		pos.x = clamp(pos.x,30,930)
		pos.y = clamp(pos.y,30,680)
		s.set_pos(pos)
		
		


