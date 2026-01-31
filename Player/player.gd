extends Node2D
var speed = 30
var stopping = 5
@export var health = 10
@export var airMax = 100
var air = airMax
@export var HP = 100

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("right"):
		$".".rotation_degrees+= speed*delta
	if Input.is_action_pressed("left"):
		$".".rotation_degrees-=speed*delta
	
	if(Input.is_action_pressed("up")):
		var dir: Vector2 = Vector2.from_angle(self.rotation)
		$".".velocity = dir * speed*3
	else:
		if ($".".velocity.x !=0):
			if($".".velocity.x >0):
				$".".velocity.x -= stopping
			else:
				$".".velocity.x += stopping
		if ($".".velocity.y !=0):
			if($".".velocity.y >0):
				$".".velocity.y -= stopping
			else:
				$".".velocity.y += stopping
	$".".move_and_slide()
