extends State
class_name PlayerWalk

@export var player : CharacterBody2D
@export var speed = 300
@export var sprite : Sprite2D
@export var animator : AnimationPlayer

func Enter():
	pass
	
func Update(delta: float):
	pass

func Physics_Update(delta: float):
	## Left to Right Movement ##
	var input_direction_x: float = (
		Input.get_action_strength("ui_right")
		- Input.get_action_strength("ui_left")
	)
	player.velocity.x = player.speed * input_direction_x
	player.velocity.y += player.gravity * delta
	
	flip_sprite()
	
	## Conditions for state changes ##
	if (owner.velocity == Vector2.ZERO):
		Transitioned.emit(self, "idle")
		
		
	## Jump state if want to implement ##
#	elif(Input.is_action_just_pressed("ui_up")):
#		player.velocity.y -= player.jump_impulse
#		print(player.velocity.y)
		
func flip_sprite():
	if (owner.velocity.x < 0):
		sprite.flip_h = 0
	elif (owner.velocity.x > 0):
		sprite.flip_h = 1
	
