#pragma once
#include <raylib.h>

#include "../../Libs/Math.h"

class Player;

class Enemy {
    public:
    Vector2D position;
    Vector2D velocity;
    Color color = WHITE;
    float radius = 50.0f;
    int hp = 100;

    Enemy (Vector2D position, Vector2D velocity):velocity(velocity),position(position) {};
    void update(float dt, Player& player);
    void Move(float dt);
    void Controll (Player& player);
    void draw ();
};

