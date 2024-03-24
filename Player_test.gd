extends CharacterBody2D


const SPEED = 300.0
const ACCELERATION = 1000.0
const COINCELERATION = 10.0 
const DECELERATION = 500.0
const DECOINCELERATION = 5.0
const JUMP_VELOCITY = -500.0
var jump_sound
var pickup_sound
var min = 500
var max = 1000
var coins = 0
var time = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	GameManager.player = self
	jump_sound = get_node("AudioStreamPlayer")
	pickup_sound = get_node("AudioStreamPlayer2")

func pickup():
	coins += 1
	pickup_sound.play()

func _physics_process(delta):
	time += delta
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY-coins
		jump_sound.play()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = move_toward(velocity.x, direction*SPEED, (ACCELERATION-coins*COINCELERATION)*delta)
	else:

		velocity.x = move_toward(velocity.x, 0, (DECELERATION-coins*DECOINCELERATION)*delta)

	if position.y > min:
		game_over()
	if position.x > max:
		game_win()


	move_and_slide()

func game_win():
	pass

func game_over():
	print(coins)
	print(time)
	coins = 0
	time = 0
	get_tree().reload_current_scene()
