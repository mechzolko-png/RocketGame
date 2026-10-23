#pragma once
#include <vector>
#include <raylib.h>
using namespace std;

// ------------ Render structs ------------

struct PlayerRendD {
    float x;
    float y;
    float radius;
    Color color;
};

struct EnemyRendD {
    float x;
    float y;
    float radius;
    Color color;
};

struct BulletRendD {
    float x;
    float y;
    float radius;
    Color color;
};

struct RD {
    PlayerRendD player;
    vector<BulletRendD> bullets;
    vector<EnemyRendD> enemies;
};