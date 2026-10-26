
#include "PlanetField.h"

#include <cmath>
#include <cstdint>
#include <random>
#include <utility>

Planet::Planet(Vector2D position, PlanetType type)
    : position(position),
      type(type),
      color(BROWN),
      r(40.0f),
      health(100) {

    switch (type) {
        case PlanetType::DIRT:
            color = BROWN;
            r = 40.0f;
            health = 100;
            break;

        case PlanetType::STONE:
            color = GRAY;
            r = 45.0f;
            health = 300;
            break;

        case PlanetType::IRON:
            color = DARKGRAY;
            r = 50.0f;
            health = 700;
            break;

        case PlanetType::GOLDEN:
            color = GOLD;
            r = 55.0f;
            health = 1500;
            break;

        case PlanetType::DIAMOND:
            color = SKYBLUE;
            r = 60.0f;
            health = 3000;
            break;
    }
}

PlanetField::PlanetField(float chunkSize, int planetsPerChunk)
    : chunkSize(chunkSize),
      planetsPerChunk(planetsPerChunk) {
}

void PlanetField::generateChunk(int x, int y) {
    const auto key = std::make_pair(x, y);

    if (chunks.find(key) != chunks.end()) {
        return;
    }

    const std::uint32_t seed =
        static_cast<std::uint32_t>(x) * 73856093u ^
        static_cast<std::uint32_t>(y) * 19349663u ^
        0x9E3779B9u;

    std::mt19937 rng(seed);

    std::uniform_real_distribution<float> positionDistribution(
        0.0f, chunkSize
    );

    std::discrete_distribution<int> typeDistribution{
        50, 25, 15, 8, 2
    };

    std::vector<Planet> planets;
    planets.reserve(planetsPerChunk);

    for (int i = 0; i < planetsPerChunk; i++) {
        const float worldX =
            static_cast<float>(x) * chunkSize
            + positionDistribution(rng);

        const float worldY =
            static_cast<float>(y) * chunkSize
            + positionDistribution(rng);

        const auto type = static_cast<PlanetType>(
            typeDistribution(rng)
        );

        planets.emplace_back(
            Vector2D{worldX, worldY},
            type
        );
    }

    chunks.emplace(key, std::move(planets));
}

void PlanetField::generateAround(
    Vector2D position,
    int chunkRadius
) {
    const int centerX = static_cast<int>(
        std::floor(position.x / chunkSize)
    );

    const int centerY = static_cast<int>(
        std::floor(position.y / chunkSize)
    );

    for (int x = centerX - chunkRadius;
         x <= centerX + chunkRadius;
         x++) {

        for (int y = centerY - chunkRadius;
             y <= centerY + chunkRadius;
             y++) {

            generateChunk(x, y);
        }
    }
}

std::map<std::pair<int, int>, std::vector<Planet>>&
PlanetField::getChunks() {
    return chunks;
}

const std::map<std::pair<int, int>, std::vector<Planet>>&
PlanetField::getChunks() const {
    return chunks;
}
