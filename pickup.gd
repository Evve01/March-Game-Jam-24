extends Area2D

var sound
# Called when the node enters the scene tree for the first time.
func _ready():
	sound = get_node("AudioStreamPlayer2D")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	GameManager.player.pickup()
	queue_free()
