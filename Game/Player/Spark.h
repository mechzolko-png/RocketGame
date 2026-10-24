#include <raylib.h>

#include "../../Libs/Math.h"



class Spark {
    public:
    Vector2D position;
    Vector2D velocity;
    float radius = rand() % 6 + 10;
    float originalRadius = rand() % 6 + 10;
    Color color = WHITE;
    Vector2D born;
    float life = 0.0f;

    Spark(float x, float y, float vx, float vy) : position(x, y), velocity(vx, vy), born(x, y) {};

    void update(const float dt);
    void draw();
};