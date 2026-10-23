#include "Spark.h"

void Spark::draw() {
    DrawCircle(position.x, position.y,radius,color);
}

void Spark::update(const float dt) {
    position.x += velocity.x * dt;
    position.y += velocity.y * dt;
    draw();
}


