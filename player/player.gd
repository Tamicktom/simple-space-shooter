extends CharacterBody2D

class_name Player;

signal shoot_laser(pos: Vector2);

@export var speed: float = 500.0;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move_player(delta);

	if Input.is_action_pressed("shoot"):
		shoot();

func move_player(delta: float) -> void:
	# Get the input direction and the current velocity
	var direction = Input.get_vector("left", "right", "up", "down");
	velocity = direction * speed;
	
	# Move the player
	position += velocity * delta;

	move_and_slide();

func shoot():
	print("Player has soot");
	emit_signal("shoot_laser", position);
