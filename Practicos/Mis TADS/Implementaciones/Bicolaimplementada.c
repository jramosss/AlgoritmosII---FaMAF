#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include "Bicolaimplementada.h"

struct _node_t {
    unsigned int size;
    unsigned int fst;
    int array[];
};

const int MAX_SIZE = 15;

Bicola empty() {
    Bicola bq;
    bq->fst = 0;
    bq->size = 0;
    return bq;
}

bool is_empty (Bicola bq) {
    return (bq->size == 0);
}

Bicola addfst (Bicola bq, int elem) {
    bq->size++;
    if (is_empty(bq)){
        bq->array[bq->fst] = elem;
    }
    else if (bq->size == 1) {
      bq->array[bq->fst+1] = elem;  
    }
    else {
        bq->array[bq->size-1] = elem;
    }
    return bq;
}

bool is_full (Bicola bq) {
    return (bq->size == MAX_SIZE);
}

int fst (Bicola bq) {
    return bq->array[bq->fst];
}

int lst (Bicola bq) {
    return bq->array[bq->size];
}

void rmfst (Bicola bq) {
    if (!is_empty(bq)) {
        bq->fst++;
    }
    else {
        printf("Empty Queue");
    }
}