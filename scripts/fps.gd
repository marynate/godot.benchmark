
extends Label

export(int) var max_plot_points = 100
export(bool) var plot
export(Color) var plot_color=Color(1,1,0)
export(Color) var plot_bg_color=Color(0,0,0,0.4)
export(int) var x_step = 2
export(int) var y_step = 1000
export(int) var y_offset = 0

var _visual_debug
var _plots=[]
var _plot_node
var _plot_bg_rect

func _switch_plot():
	plot=get_node("plot_checkbutton").is_pressed()
	

func _ready():

	_visual_debug = preload("visual_debug.gd").new(get_node("plot").get_canvas_item())
	_plot_node=get_node("plot")
	_plot_bg_rect=Rect2(_plot_node.get_pos()+Vector2(0,y_offset), Vector2(max_plot_points*x_step,60))
	set_process(true)
	
	get_node("plot_checkbutton").connect("pressed", self, "_switch_plot")

func _process(d):
	
	_visual_debug.clear()
	
	set_text(str("FPS: ", OS.get_frames_per_second()))
	
	if (!plot):
		return		
	
	_visual_debug.draw_rect(_plot_bg_rect, plot_bg_color)
	
	if (_plots.size() > max_plot_points):
		_plots.resize(max_plot_points)
	_plots.insert(0,d)
	
	var size = _plots.size()
	if (size>=2):
		for i in range(size-1):
			var start = Vector2(i*x_step,_plots[i]*y_step + y_offset)
			var end = Vector2( (i+1)*x_step, _plots[i+1]*y_step + y_offset)
			_visual_debug.draw_line(start, end, plot_color, 1)
	

