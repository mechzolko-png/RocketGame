
#pragma once

#include "raylib.h"
#include "../../Libs/Math.h"
#include "PlnateType.h"

#include <map>
#include <utility>
#include <vector>



struct Planet {
    Vector2D position;
    PlanetType type;
    Color color;
    float r;
    int health;

    Planet(Vector2D position, PlanetType type);
};

class PlanetField {
public:
    explicit PlanetField(
        float chunkSize = 2000.0f,
        int planetsPerChunk = 3
    );

    void generateChunk(int x, int y);
    void generateAround(Vector2D position, int chunkRadius = 1);

    std::map<std::pair<int, int>, std::vector<Planet>>&
    getChunks();

    const std::map<std::pair<int, int>, std::vector<Planet>>&
    getChunks() const;

private:
    float chunkSize;
    int planetsPerChunk;

    std::map<std::pair<int, int>, std::vector<Planet>> chunks;
};
