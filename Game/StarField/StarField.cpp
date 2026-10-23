
#include "StarField.h"
#include <random>
#include <cstdint>
#include <cmath>
#include <utility>

void StarField::generateChunk(int x, int y) {
    auto key = std::make_pair(x, y);

    if (chunks.find(key) != chunks.end()) {
        return;
    }

    std::uint32_t seed =
        static_cast<std::uint32_t>(x) * 73856093u ^
        static_cast<std::uint32_t>(y) * 19349663u ^
        0x9E3779B9u;

    std::mt19937 rng(seed);

    std::uniform_real_distribution<float> pos(0.0f, chunkSize);
    std::uniform_real_distribution<float> size(1.0f, 2.5f);
    std::uniform_int_distribution<int> brightness(150, 255);

    std::vector<Star> stars;
    stars.reserve(starsPerChunk);

    for (int i = 0; i < starsPerChunk; i++) {
        unsigned char b = static_cast<unsigned char>(brightness(rng));

        StarField::Star star = {
            {
                x * chunkSize + pos(rng),
                y * chunkSize + pos(rng)
            },
            size(rng),
            {b, b, b, 255}
        };

        stars.push_back(star);
    }

    chunks[key] = std::move(stars);
}

void StarField::update(Vector2D cameraPosition, float screenWidth, float screenHeight, float zoom) {
    if (zoom <= 0.0f) {
        return;
    }

    float halfWidth = screenWidth / (2.0f * zoom) + margin;
    float halfHeight = screenHeight / (2.0f * zoom) + margin;

    int minX = static_cast<int>(std::floor((cameraPosition.x - halfWidth) / chunkSize));
    int maxX = static_cast<int>(std::floor((cameraPosition.x + halfWidth) / chunkSize));
    int minY = static_cast<int>(std::floor((cameraPosition.y - halfHeight) / chunkSize));
    int maxY = static_cast<int>(std::floor((cameraPosition.y + halfHeight) / chunkSize));

    for (int x = minX; x <= maxX; x++) {
        for (int y = minY; y <= maxY; y++) {
            generateChunk(x, y);
        }
    }

    for (auto it = chunks.begin(); it != chunks.end();) {
        if (it->first.first < minX - 1 || it->first.first > maxX + 1 ||
            it->first.second < minY - 1 || it->first.second > maxY + 1) {
            it = chunks.erase(it);
        } else {
            ++it;
        }
    }
}

void StarField::draw() {
    for (auto& chunk : chunks) {
        for (auto& star : chunk.second) {
            DrawCircleV(
                {star.position.x, star.position.y},
                star.radius,
                star.color
            );
        }
    }
}
