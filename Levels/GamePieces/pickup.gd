extends Node2D
@export var type:int 

func _on_tree_entered() -> void:
	type = randi_range(0,2)
	match type:
		0:
			$Area2D/Sprite2D.texture = load("res://fish/fish1.png")
		1:
			$Area2D/Sprite2D.texture = load("res://fish/fish2.png")
		2:
			$Area2D/Sprite2D.texture = load("res://fish/fish3.png")
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	print(body)
	if(body.is_in_group("Player")):
		match type:
			0:
				body.damage += 5
			1:
				body.speed += 5
			2:
				body.airMax += 500
			3:
				body.MaxHP += 5
			4:
				body.bulletSize += 0.5
			5:
				body.attackSpeed -= 0.5
			6:
				
		queue_free()
