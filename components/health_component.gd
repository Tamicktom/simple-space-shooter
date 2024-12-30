extends Node

class_name Health;
@export var MAX_HEALTH: int = 100;
@onready var health: int = MAX_HEALTH;

func damage(attack_damage: int) -> void:
	health -= attack_damage;
	if health <= 0:
		get_parent().queue_free();
