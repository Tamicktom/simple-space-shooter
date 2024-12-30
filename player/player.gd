extends CharacterBody2D

class_name Player;

@export var speed: float = 200.0;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move_player(delta);

	if Input.is_action_just_pressed("shoot"):
		shoot();

func move_player(delta: float) -> void:
	# Get the input direction and the current velocity
	var direction = Input.get_vector("left", "right", "up", "down");
	var velocity = direction * speed;
	
	# Move the player
	position += velocity * delta;

	move_and_slide();

func shoot():
	print("Player has soot");
