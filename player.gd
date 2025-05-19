extends CharacterBody2D

@export var speed: float = 120
@export var accel: int = 10
@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
	
func _process(_delta: float) -> void:
	player_input()
	update_anim()
	move_and_slide()

func player_input() -> void:
	var direction = Input.get_axis("move_left", "move_right")
	
	if direction == 0:
		velocity.x = move_toward(velocity.x, 0, accel)
	else:
		velocity.x = move_toward(velocity.x, speed * direction, accel)
	
func update_anim() -> void:
	if velocity.x == 0:
		anim.play("idle")
		return
		
	anim.scale.x = sign(velocity.x)
	anim.play("walk")
