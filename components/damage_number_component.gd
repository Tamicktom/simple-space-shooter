extends Node2D

class_name DamageNumberComponent;

@onready var damage_label = preload("res://components/DamageNumberLabelComponent.tscn");

func show_damage_number(attack_damage: int) -> void:
	# grab all the children
	var children: Array[Node] = get_children();

	# select a random child
	var selected_child: Node = children[randi() % children.size()];

	if selected_child is DamageNumberPositionComponent:
		var child_position: Vector2 = selected_child.position;
		var damage_number_label: DamageNumberLabelComponent = damage_label.instantiate();
		damage_number_label.show_damage_number(attack_damage, child_position);
		call_deferred("add_child", damage_number_label);
