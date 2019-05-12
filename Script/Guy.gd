extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func setScore(i:int):
	$CenterContainer2/Label2.text = "%06d" % i

func setMaxLife(i:int):
	$CenterContainer2/Label2/TextureProgress.max_value = i
	
func setLife(f:float):
	$CenterContainer2/Label2/TextureProgress.value = f
	
func setText(s:String):
	$CenterContainer/Label.text = s
	
func setTextVisible(b:bool):
	$CenterContainer/Label.visible = b
	
func startTimer():
	$Timer.start()
	
func stopTimer():
	$Timer.stop()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
