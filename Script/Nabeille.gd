extends Area2D

# Declare member variables here. Examples:
var gravityIntensity = 11
onready var vel = Vector2()
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	vel.y += gravityIntensity * delta
	position += vel
