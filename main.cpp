
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

    SetTargetFPS(144);
    int FPS = 144;
    bool swap = false;

    while (!WindowShouldClose()) {
        float dt = GetFrameTime();
        Vector2 mousePos = GetScreenToWorld2D(GetMousePosition(), camera);

        RD RenderPack = game.update(dt, mousePos);

        if (IsKeyPressed(KEY_L)) {
            if (!swap) {
                SetTargetFPS(60);
                FPS = 60;
                swap = true;
            } else {
                SetTargetFPS(144);
                FPS = 144;
                swap = false;
            }
        }

        Vector2 playerPos = {
            RenderPack.player.x,
            RenderPack.player.y
        };

        float deadZone = 50.0f;

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

        string TextFPS = "FPS: " + to_string(FPS);

        BeginMode2D(camera);
        DrawText("TUTORIAL:", 20, 20, 30, GREEN);
        DrawText("Controls: W A S D", 20, 60, 20, GREEN);
        DrawText(TextFPS.c_str(), 20, 80, 20, GREEN);
        DrawText("Settings: Press l to swap between 144 and 60 FPS", 20, 100, 20, GREEN);
        starField.draw();
        renderer::update(RenderPack);
        game.drawBullets();
        game.drawEnemies();
        game.player.updateSparksFromShot(dt);
        game.player.handleSparks(dt);
        EndMode2D();

        EndDrawing();
    }

    CloseWindow();

    return 0;
}
