/*******************************************************************************
    PRG Libraries
*******************************************************************************/
#include <iostream>
#include <vector>

using namespace std;
/*******************************************************************************
    Class definition and constructor
*******************************************************************************/
class Stack {
    private:
        vector<int> data;

    public:
/*******************************************************************************
    Functions for the stack class
*******************************************************************************/
//Add to End
        void push(int add) {
            data.push_back(add);
        }
//Check if empty
        bool empty() {
            return data.empty();
        }
//Return size
        int size() {
            return data.size();
        }
//Remove from top
        void pop() {
            data.pop_back();
        }
//Return top value
        int top() {
            if(data.size() == 0) {  //Cases where vector is empty
                return -2;
            }
            
            for(int i = 0; i < data.size(); i++) {   //This will loop through the entire vector and return the end or "top"
                if(i == data.size() -1) {
                    return data[i];
                }
            }
            return -1;
        }
//Average
        int average() {
            int size = data.size();
            int sum = 0;
            int returnVal = 0;
                        
            for(int i = 0;i < data.size(); i++) {   //Loop through stack and find sum of all values
                sum += data[i];
            }
            
            returnVal = sum/size;
            return returnVal;
        }
};
/*******************************************************************************
    Main prog
*******************************************************************************/
int main()
{
    Stack stack1;
    
    cout << "Is stack empty: " << stack1.empty() << endl;
    cout << "Stack size: " << stack1.size() << endl;
    stack1.push(1);
    stack1.push(2);
    stack1.push(3);
    stack1.push(4);
    stack1.push(5);
    cout << "Stack now looks like:" << endl << "    5" << endl << "    4" << endl << "    3" << endl << "    2" << endl << "    1" << endl;
    cout << "Is stack empty: " << stack1.empty() << endl;
    cout << "Stack size: " << stack1.size() << endl;
    cout << "Top value: " << stack1.top() << endl << "Popping top value" << endl << "New top value: ";
    stack1.pop();
    cout << stack1.top() << endl;
    cout << "Stack value average: " << stack1.average() << endl;
}
