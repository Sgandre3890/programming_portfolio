#include "Sphere.h"
#include <cmath>
#define PI 3.14159

Sphere::Sphere() {

}

void Sphere::setRadius(float r) {
    radius = r;
}

float Sphere::getSurf() {
    return 4 * PI * pow(radius,2);
}

float Sphere::getVol() {
    return 4/3 * PI * pow(radius,3);
}

