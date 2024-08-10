extends Control

var scene_tutorial = load("res://Menu/tutorial.tscn")
var scene_space = load("res://Menu/space.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_button_totorial_pressed():
	get_tree().change_scene_to_packed(scene_tutorial)


func _on_button_exit_pressed():
	get_tree().quit()


func _on_button_play_pressed():
	get_tree().change_scene_to_packed(scene_space)
