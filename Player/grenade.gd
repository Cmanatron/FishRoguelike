extends Node2D
var damage:int
var size
var xlock
func _ready() -> void:
	xlock = $".".global_position.x
func _physics_process(delta: float) -> void:
	$".".global_position.x = xlock
	$".".global_position.y += 5


func _on_area_2d_body_entered(body: Node2D) -> void:
	if(!body.is_in_group("Player")):
		$Area2D.scale.x *= size
		$Area2D.scale.y *= size
		for enemy in $Area2D.get_overlapping_bodies():
			if(enemy.is_in_group("Enemy")):
				enemy.health -= damage*3
		queue_free()
