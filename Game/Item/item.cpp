
#include "item.h"


ItemP::ItemP(PlanetType type, Vector2D pos): type(type), position(pos) {
    switch (type) {
        case PlanetType::IRON:
            color = DARKGRAY;
            break;
        case PlanetType::DIAMOND:
            color = SKYBLUE;
            break;
        case PlanetType::STONE:
            color = GRAY;
            break;
        case PlanetType::GOLDEN:
            color = GOLD;
            break;
        case PlanetType::DIRT:
            color = BROWN;
            break;
        default:
            color = GRAY;
            break;
    }
}

void ItemP::draw() {
    DrawCircle(position.x, position.y, r, color);
}
