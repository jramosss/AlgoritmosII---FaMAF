#include <stdio.h>

typedef struct node *bqueue;

bqueue bq_empty();

bool is_empty (bqueue bq);

int last (bqueue bq);

void addfst (bqueue bq, int elem);

bqueue rmlst (bqueue bq);

bqueue rmfst (bqueue bq);