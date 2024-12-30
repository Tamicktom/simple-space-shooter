extends Node

class_name HealthComponent;

@export var MAX_HEALTH: int = 100;
@onready var health: int = MAX_HEALTH;

func damage(attack_damage: int) -> void:
	health -= attack_damage;

	# verify if the parent has a DamageNumberComponent as a child
	var damage_number_component: DamageNumberComponent = get_parent().get_node_or_null("DamageNumberComponent");
	if damage_number_component:
		damage_number_component.show_damage_number(attack_damage);

	if health <= 0:
		get_parent().queue_free();
