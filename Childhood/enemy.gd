extends Area2D

var dir =Vector2.ZERO 
const speed = 100
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate(speed * dir * delta)

func _on_player_player_posiation(player_pos):
	dir= (player_pos - global_position).normalized()
	
	
