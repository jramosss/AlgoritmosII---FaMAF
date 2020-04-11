#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include "3implementado.h"

struct node {
    int value;
    bqueue *next;
    bqueue *prev;
};

bqueue bq_empty () {
    bqueue x = NULL;
    return x;
}

bool is_empty (bqueue bq){
    return bq == NULL;
}

int last (bqueue bq) {
    bqueue prev = bq->prev;
    return prev->value;
}

void addfst (bqueue bq, int elem) {
    bqueue c = bq;
    bqueue n = bq->next;
    int v = n->value;
    bq->value = elem;
    while (c != c->next) {
        v = n->value;
        n = n->next;
        bq->value = v;
    }
}

bqueue rmfst (bqueue bq) {
    bqueue n = bq;
    bqueue c = bq;
    while (c != c->next) {
        c = c->next;
    }
    n = c->next;
    bq = n->next;
    return bq;
}

bqueue rmlst (bqueue bq) {
    bqueue aux = bq;
    bq = bq->prev;
    free(aux);
    return bq;
}