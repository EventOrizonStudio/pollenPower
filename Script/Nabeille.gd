extends Area2D

# Declare member variables here. Examples:
export(int, 0, 10) var gravityIntensity = 5
export(int, 0, 10) var jumpSpeed = 10
export(int, 0, 10) var horizontalSpeed = 5
export(int, 0, 10) var maxVel = 5
onready var vel = Vector2()
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_select"):
		vel.y -= jumpSpeed
		vel.y = clamp(vel.y,-maxVel,maxVel)
	vel.y += gravityIntensity * delta
	vel.x = horizontalSpeed
	position += vel
	
	  
	

