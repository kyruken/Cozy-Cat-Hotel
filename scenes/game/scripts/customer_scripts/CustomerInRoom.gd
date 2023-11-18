extends State
class_name CustomerInRoom

@export var player : CharacterBody2D
@export var speed = 300
@export var sprite : Sprite2D
@export var animator : AnimationPlayer

func Enter():
	$Timer.start()
	print("timer started")
	
func Physics_Update(delta: float):
	pass


func _on_timer_timeout():
	$Timer.stop()
	print("timer ended, leaving")
	Transitioned.emit(self, "LeaveRoom")
