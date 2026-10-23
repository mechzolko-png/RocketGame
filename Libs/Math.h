#pragma once

#include <iostream>
#include <string>
#include <cmath>
#include <cstdlib>

struct Vector2D {
    float x;
    float y;

    Vector2D(float x, float y) : x(x), y(y) {};
};

class Math {
public:
    static Vector2D normalize(Vector2D vec);
    static Vector2D getVelocity(Vector2D from, Vector2D to, float speed);
    static float distance(Vector2D a, Vector2D b);
};

namespace BYGop {
    void print(std::string txt);
    void input(std::string txt);
}