#include "Math.h"

Vector2D Math::normalize(Vector2D vec) {
    float length = std::hypot(vec.x, vec.y);

    if (length == 0.0f || !std::isfinite(length))
        return Vector2D(0, 0);

    return Vector2D(vec.x / length, vec.y / length);
}

Vector2D Math::getVelocity(Vector2D from, Vector2D to, float speed) {
    if (!std::isfinite(speed))
        return Vector2D(0, 0);

    Vector2D direction = normalize(Vector2D(to.x - from.x, to.y - from.y));

    return Vector2D(direction.x * speed, direction.y * speed);
}

float Math::distance(Vector2D a, Vector2D b) {
    return std::hypot(b.x - a.x, b.y - a.y);
}