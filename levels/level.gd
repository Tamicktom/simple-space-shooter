extends Node

class_name Level;

@onready var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn");

func player_shoot(pos:Vector2) -> void:
	var laser:Laser = laser_scene.instantiate();
	laser.position = pos;
	$Projectiles.add_child(laser);
