#pragma once
#include <vector>
#include "../Item/item.h"
#include "../../Renderer/RenderDataStructs.h"
#include "Spark.h"
#include "../Bullet/Bullet.h"
#include "../Planet/PlnateType.h"

#include "../../Libs/Math.h"


class Player {
    public:
    float hp = 100.0f;
    Vector2D position;
    Vector2D velocity = {0.0f, 0.0f};
    float r = 30.0f;
    float dmg = 5.0f;
    std::vector<ItemI> inventory;  // invenotry handler -> GameWorld
    vector<Spark> sparks;
    vector<Spark> sparksFromShot;
    bool nitro = false;


    Player(Vector2D position): position(position) {};

    void takeDmg(float amount);
    void Move(const float dt);
    void Controll(const float dt);
    void handleSparks (const float dt);
    void shot(const float dt,float mx, float my,vector<Bullet>& bullets);
    void updateSparksFromShot(const float dt);
    void displayInventory();

    PlayerRendD getRD();
    void update(const float dt);
};
