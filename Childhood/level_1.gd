extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_enemy_body_entered(body):
	if body.name=="player":
		get_tree().change_scene_to_file("res://lose.tscn")
	
	


func _on_player_number_of_happy(num):
	if num==3:
		get_tree().change_scene_to_file("res://level2.tscn")
		
