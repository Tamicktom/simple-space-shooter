extends Node

class_name Level;

@onready var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn");

@export var level_time: float = 300.0; # 5 minutes
@export var level_speed: float = 100.0; # units per second

@onready var level_music: AudioStreamPlayer = $Theme;
@onready var player: Player = $Player;
@onready var camera: Camera2D = $Camera2D;
@onready var walls: StaticBody2D = $Walls;

enum MoveDirection {
	UP,
	DOWN,
	LEFT,
	RIGHT,
	STOP
}

var move_direction: MoveDirection = MoveDirection.STOP;

func _ready() -> void:
	player.position.y = 0;
	camera.position.y = 0;
	# choose music
	level_music.stream = load("res://sound/music/level-1.mp3");
	level_music.volume_db = ConfigOptions.parse_percentage_to_db(ConfigOptions.music_volume_percentage);
	level_music.play();

func _process(delta: float) -> void:
	move_player(delta);
	pass;

func player_shoot(pos:Vector2) -> void:
	var laser:Laser = laser_scene.instantiate();
	laser.position = pos;
	$Projectiles.add_child(laser);

# This is a spaceship shooter game, so we need to make camera follow the player and
# keep the player moving
func move_upwards(delta: float) -> void:
	player.position.y -= level_speed * delta;
	camera.position.y -= level_speed * delta;
	walls.position.y -= level_speed * delta;
	player.move_and_slide();

func move_downwards(delta: float) -> void:
	player.position.y += level_speed * delta;
	camera.position.y += level_speed * delta;
	walls.position.y += level_speed * delta;
	player.move_and_slide();

func move_leftwards(delta: float) -> void:
	player.position.x -= level_speed * delta;
	camera.position.x -= level_speed * delta;
	walls.position.x -= level_speed * delta;
	player.move_and_slide();

func move_rightwards(delta: float) -> void:
	player.position.x += level_speed * delta;
	camera.position.x += level_speed * delta;
	walls.position.x += level_speed * delta;
	player.move_and_slide();

func move_player(delta: float) -> void:
	match move_direction:
		MoveDirection.UP:
			move_upwards(delta);
		MoveDirection.DOWN:
			move_downwards(delta);
		MoveDirection.LEFT:
			move_leftwards(delta);
		MoveDirection.RIGHT:
			move_rightwards(delta);
		MoveDirection.STOP:
			pass;
