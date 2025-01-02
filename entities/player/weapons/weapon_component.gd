extends Node2D;

class_name WeaponComponent;

@onready var fire_cooldown: Timer = $Cooldowns/Fire;

#search for a Level node in the parent hierarchy
@onready var level: Level = get_tree().get_first_node_in_group("Level");

@export var fire_rate: float = 0.5;
@export var fire_positions: Array[Marker2D] = [];
@export var multiple_shots: bool = false;

var can_shoot: bool = true;

func _ready() -> void:
	fire_cooldown.wait_time = fire_rate;
	fire_cooldown.timeout.connect(on_fire_timeout);

func _process(_delta: float) -> void:
	if Input.is_action_pressed("shoot") and can_shoot:
		shoot();

func get_fire_position() -> Vector2:
	if multiple_shots:
		return fire_positions[randi() % fire_positions.size()].global_position;
	else:
		return fire_positions[0].global_position;

func shoot() -> void:
	level.player_shoot(get_fire_position());
	can_shoot = false;
	fire_cooldown.start();

func on_fire_timeout() -> void:
	can_shoot = true;