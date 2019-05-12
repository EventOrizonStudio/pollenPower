extends Node2D

export(PackedScene) var pollen_scene = preload("res://Scene/Pollen.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_PopTimer_timeout():
	pop_pollen()
	
func pop_pollen():
	$PopPath/PopFollow.unit_offset = randf()
	var pop_position = $PopPath/PopFollow.position
	print(pop_position)
	var pollen = pollen_scene.instance();
	pollen.position = pop_position
	add_child(pollen)
	
