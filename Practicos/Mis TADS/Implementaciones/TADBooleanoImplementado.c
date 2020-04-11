#include <stdio.h>
#include<stdlib.h>
#include "TADBooleanoImplementado.h"

struct boolean_t {
    unsigned int boolean; 
    };

const boolean tru = 1; // Cual sera la diferencia entre hacerlo
const boolean fal = 0; // con constantes que con funciones?

boolean and (boolean x, boolean y) {
    return x->boolean *y->boolean;
}

boolean conjuncion (boolean x, boolean y) {
    if (x == tru && y == tru) {
        return tru;
    }
    return fal;
}

boolean disyuncion (boolean x, boolean y) {
    if (x == tru || y == tru) {return tru;}
    return fal;
}

boolean implica (boolean x, boolean y) {
    if (x == tru && y == fal) {return fal;}
    return tru;
}

boolean eq (boolean x, boolean y) {
    if (x == tru && y == tru || x == fal && y == fal){return tru;}
    return fal;
}

boolean not (boolean x) {
    if (x == tru) {return fal;}
    return tru;
}
