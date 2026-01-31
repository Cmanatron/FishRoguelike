extends Node2D
@export var speed = 30
var stopping = 5
@export var health:int = 10
@export var airMax:int = 100
@export var bulletSpeed:int = 100
var inAir:bool = false
var air = airMax
@export var MaxHP:int = 100
var HP = MaxHP
@export var damage:int = 50
@export var bulletSize:float = 1
@export var attackSpeed:float = 3
var isReady:bool = true
var bullet = preload("res://Player/Bullet.tscn")

func refill():
	if(air<airMax):
		air+=10

func shoot():
	var shot = bullet.instantiate()
	$".".get_parent().add_child(shot)
	shot.damage = damage
	shot.speed = bulletSpeed
	shot.scale.x =bulletSize
	shot.scale.y = bulletSize
	shot.transform = $Emitter.global_transform

func _physics_process(delta: float) -> void:
	#Movement Controller
	air -= 1
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
	if(inAir):
		refill()
	
	#print(air)
	
	#Shooting Controller
	if(Input.is_action_just_pressed("shoot") and isReady):
		isReady = false
		shoot()
		$Cooldown.start(attackSpeed)
		
		


func _on_cooldown_timeout() -> void:
	isReady = true
