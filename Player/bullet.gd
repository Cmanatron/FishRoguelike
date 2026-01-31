extends Node2D
var speed = 100
var item = preload("res://Levels/GamePieces/Pickup.tscn")
func _physics_process(delta: float) -> void:
	position += transform.x * speed* delta
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	#Call Fish Damage

	
	$".".queue_free()
