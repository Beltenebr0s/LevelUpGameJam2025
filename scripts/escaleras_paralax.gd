extends ParallaxBackground


func _process(delta):
	scroll_offset.y -= GlobalVars.scroll_speed * delta
