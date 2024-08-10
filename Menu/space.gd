extends Node2D

const ENEMY = preload("res://Menu/Enemy.tscn")
var EneP:bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	#summon_enemys()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if EneP:
		summon_enemys()
	#pass


func summon_enemys():
	EneP=false
	
	var pos = $Marker2D.global_position
	var enemys = []
	for i in range(1):
		var e = ENEMY.instantiate()
		pos = Vector2(randi()%1000,-1*randi()%300)
		pos= Vector2(50,50)
		print("Enemigo en: ", pos)
		e.position = pos
		
		get_tree().root.add_child(e)

