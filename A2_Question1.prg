/*******************************************************************************
    PRG Libraries
*******************************************************************************/
#include <iostream>
#include <vector>

using namespace std;

/*******************************************************************************
    Class definition and constructors
*******************************************************************************/
class Linked_List { //Creating a object called linked_list
    private:
        struct Node {   //Creating a new data type called Node
            int element;    //This is what's going to be stored in each node
            Node* next;     //Pointer to the node directly after the self one. 
        
            Node(int num):     //Constructor for new Node. Creates it with no next value and a blank int
                element(num)
                ,next(nullptr) {}
    };

    Node* head;         //Creating a pointer object of Node that points to the head variable
    Node* tail;         //Creating a pointer object of Node that points to the tail variable
    size_t num_items;   //Variable that tracks the total number of nodes in the list
    
    public:
        Linked_List():      //Constructor for the entire Linked_List class
            head(nullptr)
            ,tail(nullptr)
            ,num_items(0) {}
/*******************************************************************************
    Functions for the class Linked_List
*******************************************************************************/
//push Front
        void push_front(int num) {
            Node* newNode = new Node(num);  //Creates new Node
            
            if(num_items == 0) {    //Check if empty
                head = newNode;     //Assign new node to be both head and tail as it's the only one
                tail = newNode;
            } else{
                newNode->next = head;   //This is saying whatever is in the current head position assign it to my new nodes next
                head = newNode;         //Now assign the head variable to my newNode since it's in the beginning
            }
            
            num_items++;    //Increase the size of the list
        }
//Pop Front
        int pop_front() {
            if(num_items == 0) {    //Check if empty
                return 0;
            }
            
            Node* remNode = head;           
            int returnVal = head->element;  
            
            if(num_items == 1) {    //Case for only 1 record in structure
                head = nullptr;
                tail = nullptr;
            } else {
                head = head->next;  //Reasgin the 2nd value to be the new head
            }

                delete remNode;     //Delete decrement return_val
                num_items--;
                
                return returnVal;
        }
//Push Back
        void push_back(int num) {
            Node* newNode = new Node(num);  //Creates new Node
            
            if(num_items == 0) {     //Check if empty
                head = newNode;
                tail = newNode;
            } else {
                tail->next = newNode;   //Assign node after
                tail = newNode;
            }
            num_items++;    //Increase the size of the list
        }
//Pop Back
        int pop_back() {
            if(num_items == 0) {    //Check if empty
                return 0;
            } 
            
            int returnVal = tail->element;  //Assing return value before removing rest
            Node* loop = head;              //Create node to use to loop
            Node* remNode = tail;           //Create node that will be removed
            
            if(num_items == 1) {            //Case for size 1
                head = nullptr;
                tail = nullptr;
            } else if (num_items == 2) {    //Case for size 2
                returnVal = tail->element;
                delete tail;
                head->next = nullptr;
                tail = head;
            } else {
                for(size_t i = 0; i < num_items - 2; i++) {     //loop to stop 2 before and then assign that next (last) to loop
                    loop = loop->next;
                }
                
                delete remNode;         //Delete and reassing Tail
                tail = loop;
                tail->next = nullptr;
            }
            
            num_items--;                    //Decrement and return
            return returnVal;
        }
//Front
        int front() {
            if(num_items == 0) {    //Check if empty
                return 0;
            }
            return head->element;   //return head
        }
//Back
        int back() {
            if(num_items == 0) {    //Check if empty
                return 0;
            }
            return tail->element;   //return tail
        }
//Empty
        bool empty() {              //check num_items count
            if(num_items == 0) {
                return 1;
            }
            return 0;
        }
//Insert
        void insert(size_t index, int num) {
            if(index > num_items) {     //Check if index is out of bounds place value at end if it is
                push_back(num);         //Use already defined function push_back
                return;
            }
            Node* newNode = new Node(num);
            Node* loop = head;
            for(size_t i = 0; i < index; i++) {     //Loop through to stop on loop before the correct index
                loop = loop->next;
            }
            newNode->next = loop->next;             //Insert  between current and next index to match inserted values index
            loop->next = newNode;
            
            num_items++;                            //Increment num_items
        }
//Remove
        bool remove(size_t index) { 
            if(index > num_items || num_items == 0) {   //Special case for index large than size and empty vector
                return 0;
            }
            
            if(index == 0) {     //Case for head node
                Node* headCase = head;
                head = head->next;
                delete headCase;
                num_items--;
                return 1;
            }
            
            Node* current = head;
            Node* last = current;
            
            for(size_t i = 0; i < index; i++) {     //Loop till correct index
                last = current;
                current = current->next;
            }
            
            last->next = current->next;     //Reassign the previous node to point to next code from current location
            delete current;                 //Delete current pointer and decrement num_items
            num_items--;
            
            return true;
        }
//find
        size_t find (int item) {
        Node* loop = head;
        
        for(size_t index = 0; loop != nullptr; index++) {   //Loop through till index == search value
            if(loop->element == item) {
                return index;
            }
            loop = loop->next;
        }
        
        return num_items;           // if didn't find then return the size
        }
};
/*******************************************************************************
    Main prog
*******************************************************************************/
int main()
{
    Linked_List list1;
    list1.push_front(1);
    list1.push_front(2);
    list1.push_front(3);
    list1.push_back(4);
    list1.push_back(5);
    list1.push_back(6);
    
    cout<< list1.pop_back();
    cout<< list1.pop_front();
    cout<< list1.find(7);
}
