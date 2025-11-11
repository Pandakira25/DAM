#include <iostream>

using namespace std;

int main() {

    float l1;
    float l2;
    float l3;

    cout<< "ingresa el valor del lado 1" << endl;
    cin>> l1;
    cout<< "ingresa el valor del lado 2" << endl;
    cin>> l2;
    cout<<"ingresa el valor del lado 3" << endl;
    cin>> l3;

    if (l1 == l2 && l2 == l3) {
        cout<< "es equilatero"<< endl;

    }
    else {
        if (l1 != l2 && l2 != l3) {

            cout<<"es escaleno"<< endl;
        
        } 
        else {
            cout<<"es isoceles"<< endl;
        }
    }

}