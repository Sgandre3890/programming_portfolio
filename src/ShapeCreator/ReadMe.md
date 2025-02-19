To run this program you can either compile each file manually, or if you already have/install Cmake then you can compile this quickly and easily.

### If you have cmake installed
In the main folder, run "sh build.sh" to build and run the app
Run "sh run.sh" to run without recompiling

### If you don't have cmake installed
Enter this in the terminal while in the ShapeCreator folder:g++ --std=c++11 ./src/*.cpp -o out.app
Then to run it enter:./out.app