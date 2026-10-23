#pragma once

#include <raylib.h>
#include "../../Libs/Math.h"

class Bullet {
    public:
    Vector2D position;
    Vector2D velocity;
    Color color = GRAY;
    float speed = 10000.0f;
    float r = 5;

    Bullet(Vector2D position, Vector2D velocity) : position(position), velocity(velocity) {};

    void update(const float dt);
};
