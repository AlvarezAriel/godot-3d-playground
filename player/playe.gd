extends KinematicBody
 
const GRAVITY = -10
const SPEED = 10
const ACCELERATION = 4
const DEACCEL = 6
const ROTATION_SPEED = 4
 
var velocity = Vector3()
 
onready var particles = $Particles
 
 
func _ready():
    pass # Replace with function body.
 
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#   pass
 
func _physics_process(delta):
    var dir := Vector3()
    if Input.is_action_pressed("ui_up"):
        dir += Vector3(0,0,1)
    if Input.is_action_pressed("ui_down"):
        dir += Vector3(0,0,-1)
    if Input.is_action_pressed("ui_left"):
        #dir += -camera.basis[0]
        rotate_y(ROTATION_SPEED * delta)
    if Input.is_action_pressed("ui_right"):
        #dir += camera.basis[0]
        rotate_y(-ROTATION_SPEED * delta)
 
    #particles.emitting = Input.is_action_pressed("ui_select")
 
    dir.y = 0
    dir = dir.rotated(Vector3(0, 1, 0), rotation.y)
    dir = dir.normalized()
    velocity.y += delta * GRAVITY
   
    var hv : Vector3 = velocity
    hv.y = 0
   
    var new_pos = dir * SPEED
    var accel = DEACCEL
   
    if dir.dot(hv) > 0:
        accel = ACCELERATION
       
   
       
    hv = hv.linear_interpolate(new_pos, accel * delta)
    velocity.x = hv.x
    velocity.z = hv.z
   
    velocity = move_and_slide(velocity, Vector3(0,1,0))