extends Camera


export(int, -20, 20) var offset_x = -5
export(int, -20, 20) var offset_z = -5

var player

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	
	translation.x = player.translation.x + offset_x
	translation.z = player.translation.z + offset_z