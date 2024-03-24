extends Camera2D
@export var zoom_level = 0.8;

# Called when the node enters the scene tree for the first time.
func _ready():
	zoom = Vector2(zoom_level, zoom_level)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
