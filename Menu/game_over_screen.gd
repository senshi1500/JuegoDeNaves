extends Control

var scene_menu = load("res://Menu/menu_principal.tscn")
var scene_space = load("res://Menu/space.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_title_pressed():
	get_tree().change_scene_to_packed(scene_menu)


func _on_button_retry_pressed():
	get_tree().change_scene_to_packed(scene_space)
