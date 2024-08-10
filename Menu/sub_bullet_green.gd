extends Area2D
class_name SubShoot

const SPEED = 20
var dir:Vector2

func whit_direction(dir_:Vector2=Vector2(0,-1)) -> SubShoot:
	dir = dir_
	return self

func _physics_process(delta):
	global_position += SPEED*dir

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite2D/AnimationPlayer.play("Default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()




func _on_body_entered(body):
	if body.is_in_group("enemys"):
		body.get_damage(20)
		queue_free()
