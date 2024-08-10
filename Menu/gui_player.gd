extends Control

@export var player:CharacterBody2D

@onready var HealtBar= $Panel/ProgressBar
@onready var ShildBar= $Panel/ProgressBar2
@onready var SpecialBar= $Panel/ProgressBar3

# Called when the node enters the scene tree for the first time.
func _ready():
	if player!=null:
		HealtBar.value=player.life
		ShildBar.value=player.shild
		SpecialBar.value=player.special


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player!=null:
		HealtBar.value=player.life
		ShildBar.value=player.shild
		SpecialBar.value=player.special
