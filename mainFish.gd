extends Node2D

@export var enemScene: PackedScene

@onready var spawnPath = $Path2D/PathFollow2D


#func _ready():
	#$enemSpawn.wait_time = randf_range(2.0, 3.0)
	#$enemSpawn.start()
	



func _on_enem_spawn_timeout():
	#Creates enemy
	var enem = enemScene.instantiate()
	spawnPath.progress_ratio = randf()
	enem.global_position = spawnPath.global_position
	
	get_tree().current_scene.add_child(enem)
	print("spawn")
	print(enem.global_position)

	pass # Replace with function body.
