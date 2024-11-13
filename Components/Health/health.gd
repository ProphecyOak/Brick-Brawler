@icon("res://Components/Health/HealthIcon.svg")
class_name Health
extends Node


## Emitted when health has reached zero.
signal health_depleted(health)


## Maximum health and initial health.
@export var max_health: int = 10


## Current health.
var _health: int = max_health


## Modify the health by a supplied [param amount].
##
## Returns the updated health value.
func change_health(amount: int) -> int:
	_health += amount
	_checkDeath()
	return _health


## Set the health to the supplied [param amount].
func set_health(amount: int) -> void:
	_health = amount
	_checkDeath()


## Set the health back to the maximum health.
##
## Returns the updated health value.
func reset_health() -> int:
	_health = max_health
	return _health


## Set the max health to the supplied [param amount].
func set_max_health(amount: int) -> void:
	max_health = amount


# Emits the health_depleted signal if health is at or below 0.
func _checkDeath() -> void:
	if _health <= 0: health_depleted.emit(_health)
