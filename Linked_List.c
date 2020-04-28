#include <stdio.h>
#include <stdlib.h>


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

int main(){  // Main is used to test functions

    struct Node* head=NULL;
    struct Node* second=NULL;
    struct Node* third=NULL;
    head = (struct Node *) malloc(sizeof(struct Node));
    second = (struct Node *) malloc(sizeof(struct Node));
    third = (struct Node *) malloc(sizeof(struct Node));

    head->data=1;
    head->prev=NULL;
    head->next=second;

    second->data=2;
    second->prev=head;
    second->next=third;

    third->data=3;
    third->prev=second;
    third->next=NULL;

  
//    printf("%d", head->data);
   deleteKey(2,head);
    PrintList(head);
}

void PrintList(struct Node* head){ // Print the list in order
    while (head != NULL){
        printf("%d ", head->data);
        head=head->next;
    }
    printf("\n");
}

void PrintBackwards(struct Node* head){ // Print the list in reverse order
    struct Node* temp=head;

    while (temp->next != NULL){  // This while loop will bring our temp pointer to the last node
        temp=temp->next;
    }

    while (temp != NULL){
        printf("%d ", temp->data);
        temp=temp->prev;
    }
}

void InsertFirst(int nData, struct Node* head){ // Insert new node with nData first in the list pointed to by head
    struct Node * newnode= (struct Node*) malloc(sizeof(struct Node));
    newnode->data = head->data;
    newnode->next = head->next;
    head->prev = NULL;
    head->next = newnode;
    head -> data = nData;
}

void DeleteFirst(struct Node* head){ // Delete the first element of list pointed to by head
    if (head != NULL){
        if (head-> next == NULL){
            head = NULL;
        }
        else{
            head->data = head->next->data;
            head->prev = NULL;
            head->next = head->next-> next;
            free(head->next);
        }
    }
}

// deleteKey: Delete first instance of key k

void deleteKey(int k, struct Node* head){ 
    if ( head != NULL){
            struct Node* temp=head;
            while (temp != NULL){
                if (temp->data == k){
                    temp->prev->next=temp->next;
                    temp->next->prev = temp->prev;
                    free(temp); 
                }
                temp=temp->next;
            }

    }     
}
