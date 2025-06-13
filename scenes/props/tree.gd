extends Node2D

var health: int = 100

var shake = false
var random_strength = 2.0
var shake_fade = 5.0
var rnd = RandomNumberGenerator.new()
var shake_strength = 0.0

func _process(delta: float) -> void:
	if shake:
		apply_shake()
		shake = false
	if shake_strength > 0:
		shake_strength = lerpf(shake_strength, 0, shake_fade * delta)
		$Sprite2D.position = randomOffset()
		
		
func apply_shake() -> void:
	shake_strength = random_strength
func randomOffset() -> Vector2:
	return Vector2(rnd.randf_range(- shake_strength, shake_strength), \
	randf_range(- shake_strength, shake_strength))

func take_damage(damage: int) -> void:
	health -= damage
	if health <= 0:
		GlobalVariables.wood += randi_range(2,6)
		queue_free()
	shake = true
