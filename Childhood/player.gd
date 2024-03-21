extends CharacterBody2D

const SPEED = 300.0
var direction = Vector2.ZERO
@onready var animation = $AnimatedSprite2D 
var num_of_happy=0
signal player_posiation(player_pos) 
signal number_of_happy(num)
func _physics_process(delta):
	
	player_posiation.emit(global_position)
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction.x = Input.get_axis("ui_left", "ui_right")
	if direction != Vector2.ZERO:
		velocity.x = direction.x * SPEED
		
	else:
		velocity.x = 0
	direction.y = Input.get_axis("ui_up","ui_down")	
	if direction != Vector2.ZERO:
		velocity.y =direction .y *SPEED
	else:
		velocity.y =0  
	
	if velocity.x> 0:
		animation.play("right")
	elif velocity.x<0:
		animation.play("left")	
	else :
		if velocity.y>0:
			animation.play("front")
		elif velocity.y<0:
			animation.play("back")		
	 
	if(Input.is_action_just_released("ui_left")):
		animation.play("stop_left")
	elif (Input.is_action_just_released("ui_right")):
		animation.play("stop_right")
	elif (Input.is_action_just_released("ui_down")):
		animation.play("stop_front")
	elif (Input.is_action_just_released("ui_up")):
		animation.play("stop_back")
			
	

	move_and_slide()

func _on_happy_body_entered(body):
	if body.name == name:
		num_of_happy =num_of_happy+1
		number_of_happy.emit(num_of_happy)


