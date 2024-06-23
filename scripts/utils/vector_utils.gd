extends Object

class_name VectorUtils

const DIRECTION_FIX := 0.125 # 8 possible directions

static func calculate_random_direction() -> Vector2:
    var random_direction = Vector2()

    # Exclude directions parallel to the X and Y axes
    while is_zero_approx(random_direction.x) or \
        is_zero_approx(random_direction.y):
        random_direction.x = snappedf(randf_range(-1, 1), DIRECTION_FIX)
        random_direction.y = snappedf(randf_range(-1, 1), DIRECTION_FIX)

    return random_direction.normalized()
