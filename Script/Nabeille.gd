extends Area2D

# Declare member variables here. Examples:
export(int, 0, 10) var gravityIntensity = 5
export(int, 0, 10) var jumpSpeed = 10
export(int, 0, 10) var maxVel = 5

onready var vel = Vector2()
var canJump = true

signal pollen_consumption
signal grab_pollen

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_select") && canJump:
		if canJump : vel.y -= jumpSpeed
		vel.y = clamp(vel.y,-maxVel,maxVel)
		emit_signal("pollen_consumption")
	vel.y += gravityIntensity * delta
	position += vel
	
	if position.y < 0:
		position.y = 0
		vel.y = 0
	
func _on_Nabeille_area_entered(area):
	if area is Pollen:
		area.queue_free()
		emit_signal("grab_pollen")
		
func noPollen(value):
	canJump = value
