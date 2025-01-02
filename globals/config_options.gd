extends Node;

var db_min: float = -80.0;

var global_volume_percentage: float = 0.8;

enum VolumeProperty {
	MUSIC,
	SOUND,
	VOICE,
}

var audio_percentages: Dictionary = {
	VolumeProperty.MUSIC: 1.0,
	VolumeProperty.SOUND: 1.0,
	VolumeProperty.VOICE: 1.0,
}

func parse_percentage_to_db(percentage: float) -> float:
	return (percentage * 100) + db_min;

func get_property(property: VolumeProperty) -> float:
	return parse_percentage_to_db(audio_percentages[property] * global_volume_percentage);
