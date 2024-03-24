extends Camera2D
var zoom_level = 1.5

# Called when the node enters the scene tree for the first time.
func _ready():
	zoom = Vector2(zoom_level, zoom_level)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
