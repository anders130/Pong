extends AnimatableBody2D

const VectorUtils = preload("res://scripts/utils/vector_utils.gd")

@export_range(0, 1000, 10, 'suffix:px/s')
var speed: float

@export_range(0, 1000, 10, 'suffix:px/s')
var max_speed: float

@export_range(0, 1000, 10, 'suffix:px/s')
var acceleration: float

var spawn_position: Vector2

var current_speed: float

@export var velocity: Vector2

func _ready() -> void:
    spawn_position = global_position
    current_speed = speed
    position = spawn_position
    _randomize_direction()

func _randomize_direction() -> void:
    var random_direction = VectorUtils.calculate_random_direction()
    velocity = random_direction * current_speed

func _physics_process(delta: float) -> void:
    var collision = move_and_collide(velocity * delta)

    if !collision:
        return

    _bounce(collision)

func _bounce(collision: KinematicCollision2D) -> void:
    velocity = velocity.bounce(collision.get_normal())

