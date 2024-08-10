extends Area2D
class_name Sensor

#region variables

var target: CollisionObject2D = null
var list_collision_objet_on_sensor: Array[CollisionObject2D]

var targrt_distance: get = _get_distance
var target_direction: get = _get_direction

#endregion

#region main functions

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	scan()

#endregion

#region my Functions

func scan() -> void:
	var ClosestBody:CollisionObject2D
	if list_collision_objet_on_sensor.size()==0:
		return
	else:
		ClosestBody=objet_most_close(list_collision_objet_on_sensor)
		if (ClosestBody != null):
			target=ClosestBody
		else:
			target=null

#TODO Tengo que realizar una variacion en la que todos los objetos que nosean parte del esenario sena colocados en una lista ordenada por su distancia y que sea devuelta completa al objeto padre
func objet_most_close(list_collision_objet:Array[CollisionObject2D]) -> CollisionObject2D:
	
	var objet_close: CollisionObject2D=null
	var most_close_distance: float = 100000.00
	var it_is_more_close: bool
	if list_collision_objet.size()==1:
		return list_collision_objet[0]
	#for find the most objet close on the list the objet than it is into the sensor
	for i in list_collision_objet:
		if objet_close==null:
			objet_close=i
			most_close_distance = global_position.distance_to(objet_close.global_position)
		else:
			it_is_more_close = most_close_distance > global_position.distance_to(i.global_position)
			if it_is_more_close:
				objet_close=i
				most_close_distance = global_position.distance_to(objet_close.global_position)
	
	return objet_close

func _get_distance() -> float:
	return global_position.distance_to(target.global_position)

func _get_direction() -> Vector2 :
	return target.global_position - global_position

#endregion

#region signals
func _on_body_entered(body):
	if body.is_in_group("enemys"):
		list_collision_objet_on_sensor.append(body)

func _on_body_exited(body):
	if list_collision_objet_on_sensor.size()==0:
		target=null
#endregion
