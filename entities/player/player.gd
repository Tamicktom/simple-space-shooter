extends CharacterBody2D

class_name Player;

@onready var parent: Level = get_parent();
@export var speed: float = 1000.0;
# This is the distance from the player to the mouse to start moving the player
@export var mouse_player_distance_threshold: float = 8.0; 
var can_shoot: bool = true;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move_player(delta);

	if Input.is_action_pressed("shoot") and can_shoot:
		shoot();
		can_shoot = false;
		$Timers/AttackCooldown.start();

func move_player(_delta: float) -> void:
	# Get the input direction and the current velocity
	# var direction = Input.get_vector("left", "right", "up", "down");
	# velocity = direction * speed;
	# this is a spaceship shooter game, so we need to make the player follow the mouse
	var mouse_position: Vector2 = get_global_mouse_position();

	# convert the mouse position values to int
	var direction: Vector2 = (mouse_position - position).normalized();

	var differenceX: float = mouse_position.x - position.x;
	var differenceY: float = mouse_position.y - position.y;

	var can_move_x: bool = differenceX > mouse_player_distance_threshold or differenceX < -mouse_player_distance_threshold;
	var can_move_y: bool = differenceY > mouse_player_distance_threshold or differenceY < -mouse_player_distance_threshold;

	if can_move_x or can_move_y:
		velocity = direction * speed;
	else:
		velocity = Vector2.ZERO;

	print("Global Mouse position: ", mouse_position);
	print("Local Mouse position: ", get_local_mouse_position());
	print("Player position: ", position);
	print("Viewport size: ", get_viewport_rect().size);
	# Move the player
	move_and_slide();

func shoot():
	# if father is a Level
	if parent is Level:
		parent.player_shoot(position);


func _on_attack_cooldown_timeout() -> void:
	can_shoot = true;
