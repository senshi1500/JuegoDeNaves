extends CharacterBody2D

#region variables
const BULLET = preload("res://Menu/bulet.tscn")
const BULLET_ORANGE = preload("res://Menu/bullet_orange.tscn")
const BULLET_RED = preload("res://Menu/bullet_red.tscn")
const BULLET_GREEN = preload("res://Menu/bullet_green.tscn")
const BULLET_PURPLE = preload("res://Menu/bullet_purple.tscn")
const BULLET_SPECIAL = preload("res://Menu/special_bullet.tscn")
@onready var BLUE_BULLET = $BlueBullets
const SPEED = 300.0



var life:int=100
var shild:float=100.00
var special:float=100.00
var Welpon:int=1
var active_I_Frames:bool = false
var active_Shild:bool = false
var active_Blue:bool=false

#endregion

func _physics_process(delta):
	#region inputs
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * SPEED
	#comprobar la colicion con las paredes para acegurarse de que su velocidad x o y sean cero si choca con etas
	
	if Input.is_action_just_pressed("Welpon1"):
		Welpon=1
	if Input.is_action_just_pressed("Welpon2"):
		Welpon=2
	if Input.is_action_just_pressed("Welpon3"):
		Welpon=3
	if Input.is_action_just_pressed("Welpon4"):
		Welpon=4
	
	if Input.is_action_just_pressed("Disparo"):
		Shoot()
	if Input.is_action_just_pressed("SpecialShoot"):
		if special>0:
			special_shoot()
			special-=100
	if Input.is_action_just_pressed("act_blue_bullets"):
		if special>0:
			BLUE_BULLET.active()
			active_Blue=true
	if Input.is_action_just_released("act_blue_bullets"):
		BLUE_BULLET.desactive()
		active_Blue=false
	if Input.is_action_pressed("Shild"):
		ShildStart()
	if Input.is_action_just_released("Shild"):
		active_Shild=0
		$Shild.visible=0
	#endregion
	#region consumeBarr
	if active_Shild:
		shild-=25*delta
		print(shild)
		if shild<=0:
			active_Shild=false
			$Shild.visible=0
	if active_Blue:
		special-=25*delta
		print(special)
		if special<=0:
			BLUE_BULLET.desactive()
			active_Blue=false
	#endregion
	#TODO I need create the function for the adquirie the Item for the heatly, shild and special
	
	
	move_and_slide()


#region my functions
func Shoot():
	var b
	if Welpon==1:
		b = BULLET_ORANGE.instantiate()
	elif Welpon==2:
		b = BULLET_RED.instantiate()
	elif Welpon==3:
		b=BULLET_GREEN.instantiate()
	elif Welpon==4:
		b=BULLET_PURPLE.instantiate()
	var pos = $Marker2D.global_position
	$Flash.visible=1  # TODO Hay que arreglar el flash para que funcione como una animacion para que pueda controlar su duracion sin un timer
	#print("Disparo en: ", pos)
	b.position = pos
	get_tree().root.add_child(b)
	$Flash.visible=0

func ShildStart():
	if !active_Shild and shild>0:
		$Shild.visible=1
		active_Shild=1
	#shild-=1 TODO Hay que hacer que baje el valor de Shild de forma uniforme y que el escudo dure almenos unos 10 segundos

func Obtain_Item() ->void :
	# averiguar que item obtubo
	# definir que al recogerlo seleccionar la estadistica que aumeentara
	# revisarr si la estadistica se encuntraa por debajo de 0 t de ser asi definirlo en 0
	# aumentar la estadistica dada
	# y revisar si supera el numeerro 100 y si asi es redefinilo para que sea 100 
	pass

func I_frames():
	$TimerIFrames.start()
	active_I_Frames=true
	set_collision_layer_value(3,0)
	set_collision_layer_value(5,0)
	set_collision_mask_value(3,0)
	set_collision_mask_value(5,0)
	modulate = "#ffffff68"

func special_shoot():
	var bullet = BULLET_SPECIAL.instantiate()
	var pos = $Marker2D.global_position
	bullet.position = pos
	get_tree().root.add_child(bullet)
	$Flash.visible=0



func _on_timer_i_frames_timeout():
	active_I_Frames=false
	set_collision_layer_value(3,1)
	set_collision_layer_value(5,1)
	set_collision_mask_value(3,1)
	set_collision_mask_value(5,1)
	modulate = "#ffffff"


func get_damage(d=0) -> void:
	if !active_I_Frames:
		if active_Shild:
			return
		print("daño al jugador", d)
		life-=d
		if life<=0:
			queue_free()
		I_frames()

#endregion
