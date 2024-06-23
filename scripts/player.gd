extends CharacterBody2D

@export var move_up = "up"
@export var move_down = "down"

const SPEED = 100.0

func _physics_process(delta):
    var direction = Input.get_axis(move_up, move_down)
    if direction:
        velocity.y = direction * SPEED
    else:
        velocity.y = move_toward(velocity.y, 0, SPEED)

    move_and_slide()
