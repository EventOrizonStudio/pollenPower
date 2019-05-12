extends Area2D

# Declare member variables here. Examples:
export(int, 0, 10) var gravityIntensity = 5
export(int, 0, 10) var jumpSpeed = 10
export(int, 0, 10) var maxVel = 5
export(int, 1000, 10000) var max_pollen = 5000

onready var vel = Vector2()
onready var pollen = max_pollen

signal grab_pollen
signal pollen_changed

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_select"):
		vel.y -= jumpSpeed
		vel.y = clamp(vel.y,-maxVel,maxVel)
	vel.y += gravityIntensity * delta
	position += vel
	
	if position.y < 0:
		position.y = 0
		vel.y = 0
	
func set_pollen(pollen):
	self.pollen = pollen
	emit_signal("pollen_changed", pollen)
	
func _on_Nabeille_area_entered(area):
	if area is Pollen:
		area.queue_free()
		emit_signal("grab_pollen")
