extends Node2D

class_name DamageNumberLabelComponent;

@export var appear_duration: float = 0.2;
@export var delay: float = 0.2;
@export var disappear_duration: float = 0.4;

func _ready() -> void:
	$SelfDestructionTimer.start();

func show_damage_number(attack_damage: int, pos: Vector2) -> void:
	var damage_label: RichTextLabel = $Control/CenterContainer/RichTextLabel;
	damage_label.text = str(attack_damage);
	position = pos;

	var tween: Tween = create_tween();
	tween.set_parallel(true);

	tween.tween_property(self, "position", position + Vector2(0, -16), appear_duration).set_ease(Tween.EASE_OUT);
	tween.tween_property(damage_label, "modulate", Color(1, 1, 1, 1), appear_duration).from(Color(1, 1, 1, 0)).set_ease(Tween.EASE_OUT);

	tween.tween_property(self, "position", position + Vector2(0, -32), disappear_duration).set_delay(delay).set_ease(Tween.EASE_IN);
	tween.tween_property(damage_label, "modulate", Color(1, 1, 1, 0), disappear_duration).set_delay(delay).set_ease(Tween.EASE_IN);

func _on_self_destruction_timer_timeout() -> void:
	queue_free();
