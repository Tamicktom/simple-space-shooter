extends Node2D

@onready var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn");

func _on_player_shoot_laser(pos:Vector2) -> void:
	var laser:Laser = laser_scene.instantiate();
	laser.position = pos;
	$Projectiles.add_child(laser);
