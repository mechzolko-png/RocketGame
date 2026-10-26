#pragma once

#include "../Renderer/RenderDataStructs.h"
#include "Player/Player.h"
#include "Enemy/Enemy.h"
#include "Bullet/Bullet.h"
#include "Planet/PlanetField.h"

enum class LEVEL{
    EASY,
    MEDIUM,
    HARD,
};

class GameWorld {
    public:
    PlanetField planetField;
    Player player{{10,10}};
    vector<Enemy> enemies;
    vector<Bullet> bullets;
    LEVEL level = LEVEL::EASY;
    // blocks the level repeate
    bool easyDone = false;
    bool mediumDone = false;
    bool hardDone = false;

    PlayerRendD player_RD = player.getRD();
    vector<EnemyRendD> enemies_RD;
    vector<BulletRendD> bullets_RD;
    RD rd = {player_RD,bullets_RD,enemies_RD};

    void updateEnemies(float dt);
    void drawBullets();
    void drawEnemies();
    void handleEnemies(const float dt);
    RD update (const float dt, Vector2 mousePos);
    void useBullet();
    void updatePlanets();
    void drawPlanets();
};

