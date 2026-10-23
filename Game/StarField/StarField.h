
#pragma once

#include <map>
#include <vector>
#include "../../Libs/Math.h"
#include <raylib.h>

class StarField {
private:
    struct Star {
        Vector2D position;
        float radius;
        Color color;
    };

    static constexpr float chunkSize = 1000.0f;
    static constexpr int starsPerChunk = 40;
    static constexpr float margin = 500.0f;

    std::map<std::pair<int, int>, std::vector<Star>> chunks;

    void generateChunk(int x, int y);

public:
    void update(Vector2D cameraPosition, float screenWidth, float screenHeight, float zoom);
    void draw();
};
