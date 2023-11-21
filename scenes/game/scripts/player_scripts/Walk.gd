extends State
class_name PlayerWalk

@export var player : CharacterBody2D
@export var speed = 300
@export var sprite : Sprite2D
@export var animator : AnimationPlayer

func Physics_Update(delta: float):
	
	move(delta, handle_input())
	flip_sprite()
	
	check_for_state_transition()
	
	## Conditions for state changes ##
	## Jump state if want to implement ##
#	elif(Input.is_action_just_pressed("ui_up")):
#		player.velocity.y -= player.jump_impulse
#		print(player.velocity.y)

func handle_input():
	var input_direction_x: float = (
		Input.get_action_strength("ui_right")
		- Input.get_action_strength("ui_left")
	)
	
	return input_direction_x

func move(delta, input):
	player.velocity.x = player.speed * input
	player.velocity.y += player.gravity * delta
	
func flip_sprite():
	if (owner.velocity.x < 0):
		sprite.flip_h = 0
	elif (owner.velocity.x > 0):
		sprite.flip_h = 1

func check_for_state_transition():
	if (owner.velocity == Vector2.ZERO):
		Transitioned.emit(self, "idle")

