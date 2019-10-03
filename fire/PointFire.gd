extends Area

func extinguish():
	$AnimationPlayer.play("extinguish")

func _remove_self():
	get_parent().remove_child(self)
	queue_free()