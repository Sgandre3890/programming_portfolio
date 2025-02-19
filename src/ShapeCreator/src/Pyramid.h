#ifndef PYRAMID_H
#define PYRAMID_H

class Pyramid {
    private:
        float width,SlantHeight;
    public:
        Pyramid();
        void setWidth(float w);
        void setSlantHeight(float sltH);
        float getVol();
        float getSurf();
};

#endif