
#include "renderer.h"

void renderer::drawPlayer(PlayerRendD &p) {
    DrawCircle(p.x, p.y, p.radius, p.color);
}

void renderer::drawBullets(BulletRendD &b) {
    DrawCircle(b.x, b.y, b.radius, b.color);
}

void renderer::drawEnemies(EnemyRendD &e) {
    DrawCircle(e.x, e.y, e.radius, e.color);
}

RendError renderer::update(RD &rd) {
    drawPlayer(rd.player);

    for (int i = 0; i < rd.enemies.size(); i++) {
        drawEnemies(rd.enemies[i]);
    }

    for (int i = 0; i < rd.bullets.size(); i++) {
        drawBullets(rd.bullets[i]);
    }

    return RendError::NONE;
}
