extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func setPoint(i:int):
	$CenterContainer2/Label2.text = str(i)

func setMaxLife(i:int):
	$CenterContainer2/Label2/TextureProgress.max_value = i
	
func setLife(f:float):
	$CenterContainer2/Label2/TextureProgress.value = f
	
func setText(s:String):
	$Label.text = s
	
func setTextVisible(b:bool):
	$Label.visible = b
	
func startTimer():
	$Timer.start()
	
func stopTimer():
	$Timer.stop()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
