#include "Pyramid.h"
#include <cmath>

Pyramid::Pyramid() {
    width = 0;
    SlantHeight = 0;
}

void Pyramid::setWidth(float w) {
    width = w;
}

void Pyramid::setSlantHeight(float sltH) {
    SlantHeight = sltH;
}

float Pyramid::getVol() {
    return width * width * sqrt(pow(SlantHeight,2) - pow(width/2,2));
}

float Pyramid::getSurf() {
    return width * width + 2 * width * SlantHeight;
}

