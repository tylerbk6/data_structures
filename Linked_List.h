#ifndef LINKED_LISTH
#define LINKED_LISTH

struct Node {
    int data;
    struct Node* next;
    struct Node* prev;
};

void PrintList(struct Node* head);
void PrintBackwards( struct Node* head);
void InsertFirst(int nData, struct Node* head);
void DeleteFirst(struct Node* head);
void deleteKey(int k, struct Node* head);

#endif