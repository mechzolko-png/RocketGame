
#pragma once

#include <raylib.h>
#include <vector>
#include "RenderDataStructs.h"

using namespace std;

enum class RendError {
    NONE,
    UNKNOWN,
    UNDEFINED_IN_PLAYER,
};

class renderer {
public:
    static void drawPlayer(PlayerRendD &p);
    static void drawEnemies(EnemyRendD &e);
    static void drawBullets(BulletRendD &b);

    static RendError update(RD &rd);
};
