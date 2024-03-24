extends CharacterBody2D
var base_force = Vector2(0, 0);

var grav_const = 200;
var gravity = grav_const * Vector2(0, 1);

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func get_input_direction() -> Vector2:
	return (Vector2(0, Input.is_action_pressed("ui_down")) - 
			Vector2(0, Input.is_action_pressed("ui_up")) +
			Vector2(Input.is_action_pressed("ui_right"), 0) -
			Vector2(Input.is_action_pressed("ui_left"), 0));

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var dir = get_input_direction();
	
