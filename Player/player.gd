extends Node2D
#Export variables are changeable by pickups. These are our stats.
@export var speed = 30#
var stopping = speed/5
@export var airMax:int = 100
@export var bulletSpeed:int = 100
var inAir:bool = false
@export var air = airMax#
@export var MaxHP:int = 100#
var HP = MaxHP
@export var damage:int = 50#
@export var bulletSize:float = 1#
@export var attackSpeed:float = 3#

@export var grenades:int = 0#
var dropReady:bool = true
@export var batteries:int =0#
var shockReady:bool = true

var isReady:bool = true
#Weapons
var bullet = preload("res://Player/Bullet.tscn")
var barrier = preload("res://Player/shock.tscn")
var grenade = preload("res://Player/grenade.tscn")


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


func shock():
	var barrierUp = barrier.instantiate()
	$".".add_child(barrierUp)
	barrierUp.scale.x= bulletSize
	barrierUp.scale.y=bulletSize
	barrierUp.speed = attackSpeed
	barrierUp.damage = damage
	
func drop():
	var dropped = grenade.instantiate()
	$".".add_child(dropped)
	dropped.size = bulletSize
	dropped.damage = damage
func _physics_process(delta: float) -> void:
	$Sprite2D.transform = $".".transform
	#Movement Controller
	air -= 1
	if Input.is_action_pressed("right"):
		$".".rotation_degrees+= speed*delta*2
	if Input.is_action_pressed("left"):
		$".".rotation_degrees-=speed*delta*2
	
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
	if((Input.is_action_just_pressed("shootA")) and isReady):
		isReady = false
		shoot()
		$Cooldown.start(attackSpeed)
	elif(Input.is_action_just_pressed("shootB") and grenades > 0):
		drop()
		
	elif(Input.is_action_just_pressed("shootC") and batteries > 0):
		shock()
		
		
		


func _on_cooldown_timeout() -> void:
	isReady = true


func _on_drop_timer_timeout() -> void:
	dropReady = true


func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body.is_in_group("Enemy")):
		HP -= 5
