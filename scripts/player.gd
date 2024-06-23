extends AnimatableBody2D

@export var move_up = "up"
@export var move_down = "down"

@export_range(0, 1000, 10, 'suffix:px/s')
var speed: float

@export
var velocity: Vector2

func _physics_process(delta: float) -> void:
    var direction = Input.get_axis(move_up, move_down)
    var motion = Vector2.DOWN * direction * speed * delta
    move_and_collide(motion)
