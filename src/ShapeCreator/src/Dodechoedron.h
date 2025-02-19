#ifndef DODECHOEDRON_H
#define DODECHOEDRON_H

class Dodechoedron {
    private:
        float Edge;
    public:
        Dodechoedron();
        void setEdge(float E);
        float getVol();
        float getSurf();
};

#endif