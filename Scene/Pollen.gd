extends Area2D
class_name Pollen

export(int, 0, 200) var velX = 100

signal nabeille_entered

func _process(delta):
	position.x -= velX * delta
	
