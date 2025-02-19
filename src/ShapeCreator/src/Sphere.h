#ifndef SPHERE_H
#define SPHERE_H

class Sphere {
    private:
        float radius;
    public:
        Sphere();
        void setRadius(float r);
        float getVol();
        float getSurf();
};

#endif