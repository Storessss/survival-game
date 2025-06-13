extends CharacterBody2D

@export var speed: int = 120
var direction: Vector2
var look_vector: Vector2
const SLASH = preload("res://scenes/bullets/slash.tscn")

func _physics_process(_delta: float) -> void:
	direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	
	if direction != Vector2.ZERO:
		$AnimatedSprite2D.play("walk")
	else:
		$AnimatedSprite2D.play("idle")
	$AnimatedSprite2D.flip_h = direction.x < 0
	
	look_vector = get_global_mouse_position() - global_position
	if Input.is_action_just_pressed("attack") and $AttackTimer.is_stopped():
		$AttackTimer.start()
		var slash = SLASH.instantiate()
		slash.direction = look_vector.normalized()
		slash.global_position = global_position
		get_tree().current_scene.add_child(slash)
