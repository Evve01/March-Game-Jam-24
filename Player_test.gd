extends CharacterBody2D


const SPEED = 300.0
const ACCELERATION = 1000.0
const DECELERATION = 500.0
const JUMP_VELOCITY = -500.0
var jump_sound
var pickup_sound
var min = 500
var coins = 0

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
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump_sound.play()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = move_toward(velocity.x, direction*SPEED, ACCELERATION*delta)
	else:

		velocity.x = move_toward(velocity.x, 0, DECELERATION*delta)

	if position.y > min:
		game_over()


	move_and_slide()

func game_over():
	get_tree().reload_current_scene()
