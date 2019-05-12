extends Area2D

export(int, 0, 200) var velX = 100

func _process(delta):
	position.x -= velX * delta