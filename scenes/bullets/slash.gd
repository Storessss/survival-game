extends Area2D

var direction: Vector2
var speed: int = 100
var damage: int = 10

func _physics_process(delta: float) -> void:
	position += direction * speed * delta

func _process(_delta: float) -> void:
	$Sprite2D.rotation = direction.angle() + PI / 2

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("props"):
		body.take_damage(damage)
		
func _on_range_timer_timeout() -> void:
	queue_free()
