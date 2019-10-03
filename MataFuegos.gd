extends Area

onready var particles = $Particles

var firing = false
var player 

func _ready():
	set_firing(false)
	if get_parent().is_in_group("player"):
		player = get_parent()
		player.connect("used_fire_extinguisher", self, "set_firing")

func set_firing(b):
	firing = b
	particles.emitting = b
	monitoring = b

func _on_MataFuegos_area_entered(area):
	if area.is_in_group("fire") and firing:
		area.extinguish()
