#extends Area2D
extends Bullet

const SUB_BULLET_GREEN = preload("res://Menu/sub_bullet_green.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite2D/AnimationPlayer.play("Default")
	#var bul = SUB_BULLET_GREEN.instantiate().whit_direction()
	#bul.position = global_position
	#get_tree().root.add_child(bul)
	#bul = SUB_BULLET_GREEN.instantiate().whit_direction(Vector2(1,-1))
	#bul.position = global_position
	#get_tree().root.add_child(bul)
	#bul = SUB_BULLET_GREEN.instantiate().whit_direction(Vector2(-1,-1))
	#bul.position = global_position
	#get_tree().root.add_child(bul)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	if body.is_in_group("enemys"):
		body.get_damage(20)
		#print("Se ha destruido la bala verde")
	var bul = SUB_BULLET_GREEN.instantiate().whit_direction()
	bul.position = global_position
	get_tree().root.add_child(bul)
	bul = SUB_BULLET_GREEN.instantiate().whit_direction(Vector2(1,-1))
	bul.position = global_position
	get_tree().root.add_child(bul)
	bul = SUB_BULLET_GREEN.instantiate().whit_direction(Vector2(-1,-1))
	bul.position = global_position
	get_tree().root.add_child(bul)
	
	queue_free()







