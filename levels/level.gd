extends Node

class_name Level;

@onready var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn");

@export var level_time: float = 300.0; # 5 minutes
@export var level_speed: float = 100.0; # units per second

@onready var player: Player = $Player;
@onready var camera: Camera2D = $Camera2D;

func _ready() -> void:
	player.position.y = 0;
	camera.position.y = 0;

func _process(delta: float) -> void:
	move_upwards(delta);

func player_shoot(pos:Vector2) -> void:
	var laser:Laser = laser_scene.instantiate();
	laser.position = pos;
	$Projectiles.add_child(laser);

# This is a spaceship shooter game, so we need to make camera follow the player and
# keep the player moving
func move_upwards(delta: float) -> void:
	player.position.y -= level_speed * delta;
	camera.position.y -= level_speed * delta;
	player.move_and_slide();
