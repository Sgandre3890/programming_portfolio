#include <iostream>
#include "Box.h"
#include "Pyramid.h"
#include "Sphere.h"
#include "Dodechoedron.h"

using namespace std;
char user_input;

void createBox() {
    
    float w,l,h;
    
    cout << "Creating Box:" << endl;
    cout << "Enter Width: " << endl;
    cin >> w;
    cout << "Enter Height: " << endl;
    cin >> h;
    cout << "Enter Length: " << endl;
    cin >> l;

    Box varBox = Box();
    varBox.setWidth(w);
    varBox.setLength(l);
    varBox.setHeight(h);

    cout << "Volume is " << varBox.getVol() << endl;
    cout << "Surface area is " << varBox.getSurf() << endl;
}

void createPyramid() {
    
    float w,sltH;
    
    cout << "Creating Pyramid:" << endl;
    cout << "Enter Width: " << endl;
    cin >> w;
    cout << "Enter Slant Height: " << endl;
    cin >> sltH;

    Pyramid varPyramid = Pyramid();
    varPyramid.setWidth(w);
    varPyramid.setSlantHeight(sltH);
    

    cout << "Volume is " << varPyramid.getVol() << endl;
    cout << "Surface area is " << varPyramid.getSurf() << endl;
}

void createSphere() {
    
    float r;
    
    cout << "Creating Sphere:" << endl;
    cout << "Enter Radius: " << endl;
    cin >> r;

    Sphere varSphere = Sphere();
    varSphere.setRadius(r);

    cout << "Volume is " << varSphere.getVol() << endl;
    cout << "Surface area is " << varSphere.getSurf() << endl;
}

void createDodechoedron() {

    float E;

    cout << "Creating Dodechoedron:" << endl;
    cout << "Enter Edge length: " << endl;
    cin >> E;

    Dodechoedron varDodechoedron = Dodechoedron();
    varDodechoedron.setEdge(E);

    cout << "Volume is " << varDodechoedron.getVol() << endl;
    cout << "Surface area is " << varDodechoedron.getSurf() << endl;
}

int main() {
    cout << "Welcome to shape generator!" << endl;
    cout << "Enter one of the terms to create that shape:\nBox:B\nSphere:S\nPyramid:P\nDodechoedron:D" << endl;
    cin >> user_input;
    switch(user_input) {
        case 'B':
            createBox();
            break;
        case 'S':
            createSphere();
            break;
        case 'P':
            createPyramid();
            break;
        case 'D':
            createDodechoedron();
    }
    return 0;
}

