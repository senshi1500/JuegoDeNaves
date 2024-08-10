extends CharacterBody2D
class_name EnemyShip

#region 
const SPEED = 3.0
const DIRECTION:Vector2 = Vector2(0,1)
const COLOR:Dictionary = {"RED":1,"GREEN":2,"ORANGE":3,"PURPLE":4}
const COLOR_SHEELD:Dictionary = {"RED":1,"GREEN":2,"ORANGE":3,"PURPLE":4}

var state
var life:int = 100
var shild: bool

func _physics_process(delta):
	if global_position.y<=100:
		global_position += SPEED*DIRECTION
		move_and_slide()
	

func _ready():
	# Hacer que entre en modo posicionamiento
	pass

func get_damage(damage:int=0, Type:int=0):
	life-=damage
	if life<=0:
		queue_free()


func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		body.get_damage(10)
