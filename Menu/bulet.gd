extends Area2D
class_name Bullet

const SPEED = 20.0
const DIRECTIONS = Vector2(0,-1)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	global_position +=SPEED*DIRECTIONS

func _on_visible_on_screen_notifier_2d_screen_exited():
	#print("se destrullo")
	queue_free()


#func _on_area_entered(area):
	#if area.is_in_group("enemys"):
		#area.get_damage(0)
		#queue_free()


func _on_body_entered(body):
	if body.is_in_group("enemys"):
		body.get_damage(20)
		queue_free()
