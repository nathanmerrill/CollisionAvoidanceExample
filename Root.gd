extends CollisionAvoidance2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var actorScene = preload("res://Actor2D.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	add_obstacle([Vector2(0, 0), Vector2(500, 0), Vector2(500, 150), Vector2(0, 150)])
	add_obstacle([Vector2(0, 350), Vector2(500, 350), Vector2(500, 500), Vector2(0, 500)])
	for x in range(2):
		for y in range(5):
			var actor = actorScene.instance()
			actor.parent = self
			actor.position = Vector2(x*500, y*40 + 170)
			actor.destination = Vector2(500-actor.position.x, actor.position.y)
			add_child(actor)
			
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	navigate_actors()
