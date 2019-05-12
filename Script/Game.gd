extends Node

export(int, 1000, 10000) var max_pollen = 5000
onready var pollen
export(int, 0, 500) var pollen_consumption = 100
export(int, 0, 500) var pollen_gain = 200

# Declare member variables here. Examples:
var score = 0
var isLost = false
onready var initial_pos = $Nabeille.position

# Called when the node enters the scene tree for the first time.
func _ready():
	$Guy.setMaxLife(max_pollen)
	$Guy.setLife(max_pollen)
	end_game()
	$Guy.setText("Appuyez sur une touche pour commencer")
	
func end_game():
	for pollen in get_tree().get_nodes_in_group("Pollen"):
		pollen.queue_free()
	# get_tree().paused = true
	$PollenPop/PopTimer.stop()
	isLost = true
	$Nabeille.set_process(false)
	$Nabeille.vel.y = 0
	score = 0
	$Guy.setScore(score)
	$Guy.setTextVisible(true)
	$Guy.setText("GAME OVER\nAppuyez sur Espace")
	$Guy.startTimer()

func restart_game():
	$Guy.setTextVisible(false)
	
	isLost = false
	$Nabeille.position = initial_pos
	$PollenPop/PopTimer.start()
	$Nabeille.set_process(true)
	pollen = max_pollen
	$Guy.setLife(pollen)
	$Guy.stopTimer()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(event):
	if isLost and event.is_action_pressed("ui_select"):
		restart_game()

func onPollenConsumption():
	pollen -= pollen_consumption
	$Guy.setLife(pollen)

func onGrabPollen():
	pollen += pollen_gain
	$Guy.setLife(pollen)
	score += 100
	$Guy.setScore(score)

func _on_DeathZone_area_entered(area):
	end_game()
	
	
