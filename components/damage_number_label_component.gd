extends Node2D

class_name DamageNumberLabelComponent;

func show_damage_number(attack_damage: int, pos: Vector2) -> void:
	var damage_label: RichTextLabel = $Control/CenterContainer/RichTextLabel;
	damage_label.text = str(attack_damage);
	position = pos;
