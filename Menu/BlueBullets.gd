extends Node2D

@onready var Bul1 = $Bullet1
@onready var Bul2 = $Bullet2
@onready var Bul3 = $Bullet3
@onready var Bul4 = $Bullet4

#var active:bool=0

# Called when the node enters the scene tree for the first time.
func _ready():
	desactive()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _physics_process(delta):
	rotation+=5*delta


func active():
	visible=true
	
	Bul1.set_collision_layer_value(3,1)
	Bul2.set_collision_layer_value(3,1)
	Bul3.set_collision_layer_value(3,1)
	Bul4.set_collision_layer_value(3,1)
	
	Bul1.set_collision_mask_value(3,1)
	Bul2.set_collision_mask_value(3,1)
	Bul3.set_collision_mask_value(3,1)
	Bul4.set_collision_mask_value(3,1)
	

func desactive():
	visible=false
	
	Bul1.set_collision_layer_value(3,0)
	Bul2.set_collision_layer_value(3,0)
	Bul3.set_collision_layer_value(3,0)
	Bul4.set_collision_layer_value(3,0)
	
	Bul1.set_collision_mask_value(3,0)
	Bul2.set_collision_mask_value(3,0)
	Bul3.set_collision_mask_value(3,0)
	Bul4.set_collision_mask_value(3,0)
	


func _on_bullet_1_body_entered(body):
	if body.is_in_group("enemys"):
		body.get_damage(40)
		


func _on_bullet_2_body_entered(body):
	if body.is_in_group("enemys"):
		body.get_damage(40)
		


func _on_bullet_3_body_entered(body):
	if body.is_in_group("enemys"):
		body.get_damage(40)
		



func _on_bullet_4_body_entered(body):
	if body.is_in_group("enemys"):
		body.get_damage(40)
		



