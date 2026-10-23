
//
// Created by Gravity_BYG on 2026. 10. 18..
//

#include "GameWorld.h"

RD GameWorld::update(const float dt,Vector2 mousePos) {
    player.update(dt);
    player_RD = player.getRD();
    rd.player = player_RD;
    if (IsMouseButtonPressed(MOUSE_BUTTON_LEFT)) {

        player.shot(dt,mousePos.x, mousePos.y,bullets);
    }

    for (int i = 0; i < bullets.size();) {
        Bullet& bullet = bullets[i];
        bullet.update(dt);

        if (Math::distance(player.position,bullet.position) > 1000) {
            bullets.erase(bullets.begin() + i);
        } else {
            i++;
        }
    }


    return rd;
}

void GameWorld::drawBullets() {
    for (Bullet& bullet : bullets) {
        DrawCircle(bullet.position.x,bullet.position.y,bullet.r,bullet.color);
    }
}
