#include "Box.h"
#include <cmath>

void Box::setWidth(float w) {
    width=w;
};
void Box::setHeight(float h) {
    height = h;
};
void Box::setLength(float l) {
    length = l;
};

Box::Box() {
    width =0;
    height =0;
    length =0;
}

float Box::getVol() {
    return width * length * height;
}

float Box::getSurf() {
    return width * height;
}