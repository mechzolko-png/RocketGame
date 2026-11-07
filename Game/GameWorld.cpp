
//
// Created by Gravity_BYG on 2026. 10. 18..
//
// TODO: Delete Planets and items out of the range
#include "GameWorld.h"

void GameWorld::handleEnemies(const float dt) {
    if (level == LEVEL::EASY && !easyDone) {
        for (int i = 0; i < 10; i++) {
            float halfW = GetScreenWidth() / 2.0f;
            float halfH = GetScreenHeight() / 2.0f;
            float margin = 100.0f;

            Vector2D spawn{0, 0};

            int side = GetRandomValue(0, 3);

            if (side == 0) {
                spawn.x = player.position.x - halfW - margin;
                spawn.y = player.position.y + GetRandomValue(-static_cast<int>(halfH), static_cast<int>(halfH));
            } else if (side == 1) {
                spawn.x = player.position.x + halfW + margin;
                spawn.y = player.position.y + GetRandomValue(-static_cast<int>(halfH), static_cast<int>(halfH));
            } else if (side == 2) {
                spawn.x = player.position.x + GetRandomValue(-static_cast<int>(halfW), static_cast<int>(halfW));
                spawn.y = player.position.y - halfH - margin;
            } else {
                spawn.x = player.position.x + GetRandomValue(-static_cast<int>(halfW), static_cast<int>(halfW));
                spawn.y = player.position.y + halfH + margin;
            }

            Vector2D velocity = Math::getVelocity(spawn, player.position, 100.0f);
            enemies.emplace_back(spawn, velocity);
        }

        easyDone = true;
    }
}

void GameWorld::drawEnemies() {
    for (Enemy& enemy : enemies) {
        enemy.draw();
    }
}



void GameWorld::useBullet() {
    for (int i = 0; i < bullets.size();) {
        Bullet& bullet = bullets[i];
        bool hit = false;

        for (int j = 0; j < enemies.size(); j++) {
            Enemy& enemy = enemies[j];

            if (Math::distance(enemy.position, bullet.position) <= enemy.radius + bullet.r) {
                enemy.hp -= 10;
                hit = true;
                break;
            }
        }

        if (hit) {
            bullets.erase(bullets.begin() + i);
        } else {
            i++;
        }
    }
}

void GameWorld::updatePlanets() {
    for (auto& [key, planets] : planetField.getChunks()) {
        for (int j = 0; j < planets.size();) {
            Planet& planet = planets[j];
            for (int i = 0; i < bullets.size();) {
                Bullet& bullet = bullets[i];

                if (Math::distance(planet.position, bullet.position)
                    <= bullet.r + planet.r) {

                    planet.health -= 20;
                    bullets.erase(bullets.begin() + i);
                    } else {
                        i++;
                    }
            }

            if (planet.health <= 0) {
                ItemP item = ItemP(planet.type,planet.position);
                items.push_back(item);
                planets.erase(planets.begin() + j);
            } else {
                j++;
            }
        }
    }
}

void GameWorld::drawPlanets() {
    for (const auto& [key, planets] : planetField.getChunks()) {
        for (const Planet& planet : planets) {
            DrawCircle(
                planet.position.x,
                planet.position.y,
                planet.r,
                planet.color
            );
        }
    }
}

void GameWorld::updateEnemies(float dt) {
    for (int i = 0; i < enemies.size();) {
        Enemy& enemy = enemies[i];
        enemy.update(dt,player);
        if (enemy.hp <= 0) {
            enemies.erase(enemies.begin() + i);
        } else {
            i++;
        }
    }
}


void GameWorld::storeItems() {
    for (int i = 0; i < items.size();) {
        ItemP& item = items[i];
        if (Math::distance(player.position, item.position) <= item.r + player.r) {
            ItemI itemI = ItemI(item.type);
            player.inventory.push_back(itemI);
            items.erase(items.begin() + i);
        } else {
            i++;
        }
    }
}


RD GameWorld::update(const float dt, Vector2 mousePos) {
    player.update(dt);

    handleEnemies(dt);
    updateEnemies(dt);

    player_RD = player.getRD();
    rd.player = player_RD;

    if (IsMouseButtonPressed(MOUSE_BUTTON_LEFT)) {
        player.shot(dt, mousePos.x, mousePos.y, bullets);
    }

    for (int i = 0; i < bullets.size();) {
        Bullet& bullet = bullets[i];
        bullet.update(dt);

        if (Math::distance(player.position, bullet.position) > 1000) {
            bullets.erase(bullets.begin() + i);
        } else {
            i++;
        }
    }

    useBullet();
    planetField.generateAround(player.position, 1);
    updatePlanets();
    storeItems();

    return rd;
}

void GameWorld::drawBullets() {
    for (Bullet& bullet : bullets) {
        DrawCircle(bullet.position.x,bullet.position.y,bullet.r,bullet.color);
    }
}





void GameWorld::drawItems() {
    for (ItemP& item : items) {
        item.draw();
    }
}
