extends CharacterBody2D;

class_name Player;

@onready var parent: Level = get_parent();
@export var speed: float = 500.0;
# This is the distance from the player to the mouse to start moving the player
@export var mouse_player_distance_threshold: float = 8.0; 

enum ControlType { MOUSE, KEYBOARD };
@export var control_type: ControlType = ControlType.MOUSE;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move_player(delta);

func move_player(_delta: float) -> void:
	if control_type == ControlType.MOUSE:
		move_player_by_mouse(_delta);
	elif control_type == ControlType.KEYBOARD:
		move_player_by_keyboard(_delta);
	move_and_slide();

func move_player_by_keyboard(_delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down");
	velocity = direction * speed;

func move_player_by_mouse(_delta: float) -> void:
	var mouse_position: Vector2 = get_global_mouse_position();
	var direction: Vector2 = (mouse_position - position).normalized();

	var differenceX: float = mouse_position.x - position.x;
	var differenceY: float = mouse_position.y - position.y;

	var can_move_x: bool = differenceX > mouse_player_distance_threshold || differenceX < -mouse_player_distance_threshold;
	var can_move_y: bool = differenceY > mouse_player_distance_threshold || differenceY < -mouse_player_distance_threshold;

	if can_move_x or can_move_y:
		velocity = direction * speed;
	else:
		velocity = Vector2.ZERO;
