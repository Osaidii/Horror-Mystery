extends Area3D

var looking := false
var out_of_range := true

@onready var wall_23: Node3D = $"Wall 23"
@onready var wall_24: Node3D = $"Wall 24"

func _process(delta: float) -> void:
	if !out_of_range and !looking:
		scare()

func _on_scare_check_body_entered(body: Node3D) -> void:
	if body is Player:
		out_of_range = false

func _on_exit_body_entered(body: Node3D) -> void:
	if body is Player:
		out_of_range = true

func _on_visible_on_screen_notifier_3d_screen_exited() -> void:
	looking = false

func _on_visible_on_screen_notifier_3d_screen_entered() -> void:
	looking = true

func scare() -> void:
	wall_23.visible = false
	wall_24.visible = false
