#ifndef BOX_H
#define BOX_H

class Box {
    private:
        float width,length,height;
    public:
        Box();
        void setWidth(float w);
        void setHeight(float h);
        void setLength(float l);
        float getVol();
        float getSurf();
};

#endif