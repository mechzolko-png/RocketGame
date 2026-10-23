
#include "Game/GameWorld.h"
#include "Renderer/renderer.h"
#include "Game/StarField/StarField.h"
#include <cmath>

int main() {
    InitWindow(1024,1080,"Survive To Poo To Throw To Kill ?!");
    StarField starField;
    ToggleFullscreen();
    GameWorld game = GameWorld();
    Camera2D camera = {0};
    camera.target = {10.0f, 10.0f};
    camera.offset = {
        GetScreenWidth() / 2.0f,
        GetScreenHeight() / 2.0f
    };
    camera.rotation = 0.0f;
    camera.zoom = 1.0f;

    SetTargetFPS(60);

    while (!WindowShouldClose()) {
        float dt = GetFrameTime();
        Vector2 mousePos = GetScreenToWorld2D(GetMousePosition(), camera);

        RD RenderPack = game.update(dt, mousePos);

        Vector2 playerPos = {
            RenderPack.player.x,
            RenderPack.player.y
        };

        float deadZone = 100.0f;

        Vector2 difference = {
            playerPos.x - camera.target.x,
            playerPos.y - camera.target.y
        };

        float distance = sqrtf(
            difference.x * difference.x +
            difference.y * difference.y
        );

        if (distance > deadZone) {
            float move = distance - deadZone;

            camera.target.x += difference.x / distance * move;
            camera.target.y += difference.y / distance * move;
        }

        starField.update(
            {camera.target.x, camera.target.y},
            GetScreenWidth(),
            GetScreenHeight(),
            camera.zoom
        );

        BeginDrawing();
        ClearBackground(BLACK);


        BeginMode2D(camera);
        DrawText("TUTORIAL:", 20, 20, 30, GREEN);
        DrawText("Controls: W A S D", 20, 60, 20, GREEN);
        starField.draw();
        renderer::update(RenderPack);
        game.drawBullets();
        game.player.handleSparks(dt);
        EndMode2D();

        EndDrawing();
    }

    CloseWindow();

    return 0;
}
