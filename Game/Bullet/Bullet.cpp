#include "Bullet.h"

#include <vector>
// #include "../Player/Spark.h"
// TODO: Add spark to bullet




void Bullet::update(const float dt) {
    position.x += velocity.x * dt;
    position.y += velocity.y * dt;
}