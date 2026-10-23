#pragma once

#include "../Renderer/RenderDataStructs.h"
#include "Player/Player.h"
#include "Enemy/Enemy.h"
#include "Bullet/Bullet.h"

class GameWorld {
    public:
    Player player{{10,10}};
    vector<Enemy> enemies;
    vector<Bullet> bullets;

    PlayerRendD player_RD = player.getRD();
    vector<EnemyRendD> enemies_RD;
    vector<BulletRendD> bullets_RD;
    RD rd = {player_RD,bullets_RD,enemies_RD};

    void drawBullets();
    RD update (const float dt, Vector2 mousePos);
};

