var host

func _init(h):
	host = h

func draw_line(start, end, color, width):
	VisualServer.canvas_item_add_line(host, start, end, color, width)
	
func draw_rect(rect, color):
	VisualServer.canvas_item_add_rect(host, rect, color)

func clear():
	VisualServer.canvas_item_clear(host)