extends Area2D;

class_name Laser;

@export var speed: float = 1000.0;
var direction: Vector2 = Vector2.UP;
var damage: float = 10.0;

func _process(delta: float) -> void:
	position += direction * speed * delta;

func _on_self_destruction_timer_timeout() -> void:
	queue_free(); # Remove the laser from the scene if it's not destroyed by a collision

func _on_body_entered(body: Node2D) -> void:
	print("Laser hit: ", body);
