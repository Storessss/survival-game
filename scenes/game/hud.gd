extends CanvasLayer

func _process(_delta: float) -> void:
	$Wood.text = "Wood: " + str(GlobalVariables.wood)
