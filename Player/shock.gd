extends Node2D
var speed:float
var damage:int

func _ready() -> void:
	$killTimer.start(abs(10-speed))
	print("Timer started")

func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body.is_in_group("Enemy")):
		body.health -= damage * 2
		


func _on_kill_timer_timeout() -> void:
	print("Timer over")
	queue_free()
