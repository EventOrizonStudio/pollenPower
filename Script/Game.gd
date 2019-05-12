extends Node

export(int, 1000, 10000) var max_pollen = 5000
onready var pollen
export(int, 0, 500) var pollen_consumption = 100
export(int, 0, 500) var pollen_gain = 200

# Declare member variables here. Examples:
var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pollen=max_pollen
	$Guy.setMaxLife(max_pollen)
	$Guy.setLife(pollen)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func onPollenConsumption():
	pollen -= pollen_consumption
	$Guy.setLife(pollen)

func onGrabPollen():
	pollen += pollen_gain
	$Guy.setLife(pollen)

func _on_DeathZone_area_entered(area):
	get_tree().paused = true
