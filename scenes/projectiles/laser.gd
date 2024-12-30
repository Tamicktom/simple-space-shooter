extends Area2D;

class_name Laser;

@export var speed: float = 1000.0;
var direction: Vector2 = Vector2.UP;
var damage: float = 10.0;

func _process(delta: float) -> void:
	position += direction * speed * delta;
