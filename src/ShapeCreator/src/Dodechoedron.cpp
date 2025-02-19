#include "Dodechoedron.h"
#include <cmath>

void Dodechoedron::setEdge(float E) {
    Edge = E;
};

Dodechoedron::Dodechoedron() {
    Edge = 0;
}

float Dodechoedron::getVol() {
    return (15+7 * sqrt(5) / 4) * pow(Edge,3);
};

float Dodechoedron::getSurf() {
    return 3 * sqrt(25 + 10 * sqrt(5)) * pow(Edge,2);
};