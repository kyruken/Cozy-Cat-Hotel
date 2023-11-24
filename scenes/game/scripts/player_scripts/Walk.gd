extends State
class_name PlayerWalk

@export var player : CharacterBody2D
@export var speed = 1000
@export var sprite : Sprite2D
@export var animator : AnimationPlayer

func Physics_Update(delta: float):
	
	move(delta, handle_input())
	flip_sprite()
	
	Check_State_Transition()
	
	## Conditions for state changes ##
	## Jump state if want to implement ##
#	elif(Input.is_action_just_pressed("ui_up")):
#		player.velocity.y -= player.jump_impulse
#		print(player.velocity.y)

func Check_State_Transition():
	if (owner.velocity == Vector2(0,0)):
		Transitioned.emit(self, "idle")
		
func handle_input():
	var input_direction_x: float = (
		Input.get_action_strength("ui_right")
		- Input.get_action_strength("ui_left")
	)
	
	var input_direction_y: float = (
		Input.get_action_strength("ui_down")
		- Input.get_action_strength("ui_up")
	)
	
	return [input_direction_x, input_direction_y]
	
func move(delta, input):
	player.velocity.x = player.speed * input[0]
	player.velocity.y = player.speed * input[1]
	
func flip_sprite():
	if (owner.velocity.x < 0):
		sprite.flip_h = 0
	elif (owner.velocity.x > 0):
		sprite.flip_h = 1
		

