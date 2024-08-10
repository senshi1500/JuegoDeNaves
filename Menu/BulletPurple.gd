extends Bullet



#region Variables
@onready var EnemySensor:Sensor=$Sensor

const SPEED_PURPLE:float =10.0

var target:CollisionObject2D
#endregion

#region Main fuctions
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	if EnemySensor.target==null:
		global_position +=SPEED_PURPLE*DIRECTIONS
	else:
		global_position += (SPEED_PURPLE * (EnemySensor.target_direction.normalized()))
		rotation_degrees=Vec2ToDegree(EnemySensor.target_direction.normalized())
		#TODO Tengo que hacer que arreglar el problema de rotacion
		
#endregion


#region My functions
func Vec2ToDegree(Vec:Vector2) -> float:
	var radiants = atan2(Vec.y,Vec.x)
	var degrees = rad_to_deg(radiants)
	if degrees<0:
		degrees +=0
	return degrees+90 #Dado que la direccion se esta calculan do desde el target a la bala es algo reboltoso por lo que esta fue la mejor solucion que encontre
	#TODO Sin embargo tenho que arreglar esto par aque funcione de forma mas simple en proximos juegos
	#FIXME Probablemente el erro se encuentre en como se calcula la direccion en el sensor
#endregion
