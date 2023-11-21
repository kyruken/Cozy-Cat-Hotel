extends State
class_name PlayerIdle

@export var animator : AnimationPlayer

func Enter():
	owner.velocity = Vector2.ZERO
	
func Update(delta: float):
	Check_State_Transition()

func Check_State_Transition():
	if (Input.is_action_just_pressed("ui_left") or Input.is_action_just_pressed("ui_right")
	or Input.is_action_just_pressed("ui_up") or Input.is_action_just_pressed("ui_down")):
		Transitioned.emit(self, "walk")
