extends CharacterBody2D
var base_speed = Vector2(0, 0);

var grav_const = 10;
var gravity = grav_const * Vector2(0, 1);

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _input(event):
	if event.is_action_pressed("ui_up"):
		base_speed += Vector2(0, -1);
	if event.is_action_released("ui_up"):
		base_speed -= Vector2(0, -1);
	
	if event.is_action_pressed("ui_down"):
		base_speed += Vector2(0, 1);
	if event.is_action_released("ui_down"):
		base_speed -= Vector2(0, 1);

	if event.is_action_pressed("ui_right"):
		base_speed += Vector2(1, 0);
	if event.is_action_released("ui_right"):
		base_speed -= Vector2(1, 0);

	if event.is_action_pressed("ui_left"):
		base_speed += Vector2(-1, 0);
	if event.is_action_released("ui_left"):
		base_speed -= Vector2(-1, 0);
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity = base_speed + delta*gravity;
	var test = move_and_collide(velocity);
	if test != null:
		print(test.get_angle())
	
