//
// Created by Gravity_BYG on 2026. 10. 18..
//
#include "Player.h"


void Player::takeDmg(float amount) {
    if (hp >= amount) {
        hp -= amount;
    }
}

void Player::shot (const float dt,float mx, float my, vector<Bullet>& bullets) {
    Vector2D to = {mx,my};
    Vector2D vel = Math::getVelocity(position, to,3000.0f);
    Bullet bullet = Bullet(position,vel);
    bullets.push_back(bullet);
}

void Player::storeItem(Item item) {
    printf("PASS");
}

PlayerRendD Player::getRD() {
    PlayerRendD rd;
    rd.x = position.x;
    rd.y = position.y;
    rd.color.r = 0;
    rd.color.g = 255;
    rd.color.b = 200;
    rd.color.a = 255;
    rd.radius = r;

    return rd;
}

void Player::Controll(const float dt) {
    const float acceleration = 1000.0f;
    const float maxSpeed = 1000.0f;

    if (IsKeyDown(KEY_W)) velocity.y -= acceleration * dt;
    if (IsKeyDown(KEY_S)) velocity.y += acceleration * dt;
    if (IsKeyDown(KEY_A)) velocity.x -= acceleration * dt;
    if (IsKeyDown(KEY_D)) velocity.x += acceleration * dt;

    // if (velocity.x > maxSpeed) velocity.x = maxSpeed;
    // if (velocity.x < -maxSpeed) velocity.x = -maxSpeed;
    // if (velocity.y > maxSpeed) velocity.y = maxSpeed;
    // if (velocity.y < -maxSpeed) velocity.y = -maxSpeed;
}

void Player::Move(const float dt) {
    position.x += velocity.x * dt;
    position.y += velocity.y * dt;
}


void Player::handleSparks(const float dt) {
    if (IsKeyDown(KEY_W)) {
        float py = position.y + (r + 10);
        float px = position.x;
        float vx = rand() % 110 - 50;
        float vy = rand() % 500 + 300;
        sparks.push_back(Spark(px, py, vx, vy));
    }

    if (IsKeyDown(KEY_S)) {
        float py = position.y - (r + 10) ;
        float px = position.x;
        float vx = rand() % 110 - 50;
        float vy = (rand() % 500 + 300) * -1;
        sparks.push_back(Spark(px, py, vx, vy));
    }

    if (IsKeyDown(KEY_A)) {
        float py = position.y;
        float px = position.x + (r + 10);
        float vy = rand() % 101 - 50;
        float vx = rand() % 500 + 300;
        sparks.push_back(Spark(px, py, vx, vy));
    }

    if (IsKeyDown(KEY_D)) {
        float py = position.y;
        float px = position.x - (r + 10);
        float vy = rand() % 101 - 50;
        float vx = (rand() % 500 + 300) * -1;
        sparks.push_back(Spark(px, py, vx, vy));
    }

    for (int i = 0; i < sparks.size();) {
        Spark& spark = sparks[i];
        spark.update(dt);
        spark.draw();

        // float b = Math::distance(spark.born, spark.position);
        // float percentage = b / 200.0f;
        // float mult = 1.0f + 1.0f * percentage;
        //
        // spark.radius = spark.originalRadius * mult;

        float b = Math::distance(spark.born, spark.position);
        float percentage = b / 200.0f;

        if (percentage > 1.0f) percentage = 1.0f;

        float mult = 1.0f + 0.5f * percentage;
        spark.radius = spark.originalRadius * mult;

        unsigned char alpha = static_cast<unsigned char>(255 * (1.0f - percentage));
        spark.color.a = alpha;
        spark.color.r = static_cast<unsigned char>(20 + 255 * percentage);
        spark.color.g = static_cast<unsigned char>(220 - 55 * percentage);
        spark.color.b = static_cast<unsigned char>(230 * (2.0f - percentage));

        spark.draw();



        if (Math::distance(spark.position, spark.born) > 200) {
            sparks.erase(sparks.begin() + i);
        } else {
            i++;
        }
    }
}


void Player::update(const float dt) {
    Controll(dt);
    Move(dt);
}
