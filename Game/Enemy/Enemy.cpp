//
// Created by Gravity_BYG on 2026. 10. 18..
//

#include "Enemy.h"
#include "../Player/Player.h"

void Enemy::Controll(Player& player) {
    velocity = Math::getVelocity(position,player.position,100);
}

void Enemy::Move (float dt) {
    position.x += velocity.x * dt;
    position.y += velocity.y * dt;
}

void Enemy::update(float dt, Player& player) {
    Controll(player);
    Move(dt);
}

void Enemy::draw() {
    DrawCircle(position.x,position.y,radius,color);
}