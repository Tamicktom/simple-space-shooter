extends Node;

var db_min: float = -80.0;

enum VolumeProperty {
    GLOBAL,
    MUSIC,
    SOUND
}

var audio_percentages: Dictionary = {
	VolumeProperty.GLOBAL: 0.8,
	VolumeProperty.MUSIC: 1.0,
	VolumeProperty.SOUND: 1.0
}

func parse_percentage_to_db(percentage: float) -> float:
	var db: float = (percentage * 100) + db_min;
	return db;

func get_property(property: VolumeProperty) -> float:
	return parse_percentage_to_db(audio_percentages[property]);
