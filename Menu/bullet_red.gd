#extends Area2D
extends Bullet

var act_explocion:bool=0
#const SPEED = 20.0
#const DIRECTIONS = Vector2(0,-1)


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()
	$Sprite2D/AnimationPlayer.play("Default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func  _physics_process(delta):
	if !act_explocion:
		global_position+=SPEED*DIRECTIONS

func _on_timer_timeout():
	explocion()
	

func explocion():
	act_explocion=1
	print("Explocion")
	$Sprite2D/AnimationPlayer.play("Explocion")


func _on_animation_player_animation_finished(anim_name):
	if anim_name=="Explocion":
		print("disparo desturido")
		queue_free()


func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()

func _on_body_entered(body):
	print("Lo golpeo")
	$Timer.stop()
	if body.is_in_group("enemys"):
		body.get_damage(20)
	explocion()


func _on_area_entered(area):
	print("golpeo el area")
	$Timer.stop()
	if area.is_in_group("enemys"):
		area.get_damage(20)
	explocion()
