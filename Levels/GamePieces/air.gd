extends Node2D

var playerIn:bool = false



func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body.is_in_group("Player")):
		body.inAir = true



func _on_area_2d_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Player")):
		body.inAir = false
