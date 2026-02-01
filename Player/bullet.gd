extends Node2D
var speed = 100
var item = preload("res://Levels/GamePieces/Pickup.tscn")
var damage:int 
func _physics_process(delta: float) -> void:
	position += transform.x * speed* delta
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	#Call Fish Damage
	if(body.is_in_group("Enemy")):
		print("hit")
		body.health -= damage
	if(!body.is_in_group("Player")):
		$".".queue_free()
	
