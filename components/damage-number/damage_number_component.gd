extends Node2D

class_name DamageNumberComponent;

@onready var damage_label = preload("res://components/damage-number/DamageNumberLabelComponent.tscn");

# Tipe children to only be DamageNumberPositionComponent
@export var damage_number_position_component: Array[DamageNumberPositionComponent] = [];

func show_damage_number(attack_damage: int) -> void:
	# select a random damage number position component
	var selected_child: DamageNumberPositionComponent = damage_number_position_component[randi() % damage_number_position_component.size()];

	if selected_child is DamageNumberPositionComponent:
		var child_position: Vector2 = selected_child.position;
		var damage_number_label: DamageNumberLabelComponent = damage_label.instantiate();
		damage_number_label.show_damage_number(attack_damage, child_position);
		call_deferred("add_child", damage_number_label);
