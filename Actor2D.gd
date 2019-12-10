extends CollisionAvoidanceActor2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 50
var parent: CollisionAvoidance2D
var destination: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	max_speed = speed * 2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var preferred_velocity = (destination - position).clamped(1)*speed
	var velocity = calculate_velocity(preferred_velocity, delta)
	position += velocity * delta
	if abs(position.x - destination.x) < 1:
		destination = Vector2(parent.bounds.size.x-destination.x, destination.y)
