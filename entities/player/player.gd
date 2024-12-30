extends CharacterBody2D

class_name Player;

@onready var parent: Level = get_parent();
@export var speed: float = 500.0;
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
	var direction = Input.get_vector("left", "right", "up", "down");
	velocity = direction * speed;

	# Move the player
	move_and_slide();

func shoot():
	# if father is a Level
	if parent is Level:
		parent.player_shoot(position);


func _on_attack_cooldown_timeout() -> void:
	can_shoot = true;
