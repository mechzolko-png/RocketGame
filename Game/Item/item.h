#pragma once
#include <raylib.h>

#include "../../Libs/Math.h"
#include "../Planet/PlnateType.h"



class ItemI {
    public:
    PlanetType type;

    ItemI(PlanetType type) : type(type) {}
};

class ItemP {
    public:
    Vector2D position;
    float r = 10.0f;
    PlanetType type;
    Color color;

    ItemP(PlanetType type, Vector2D pos);
    void draw();
};


