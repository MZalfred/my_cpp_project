#include <iostream>
#include "Calculator.h"

using namespace std;

void doSomething() {
    cout << "Doing something..." << endl;
}

void runCalculator() {
    Calculator calc;
    cout << "3 + 4 = " << calc.add(3, 4) << endl;
    cout << "10 - 3 = " << calc.subtract(10, 3) << endl;
}

int main() {
    int choice;
    cout << "Which function would you like to run?" << endl;
    cout << "1. Calculator" << endl;
    cout << "2. Do something" << endl;
    cout << "Enter choice (1/2): ";
    cin >> choice;

    if (choice == 1) {
        runCalculator();
    } else if (choice == 2) {
        doSomething();
    } else {
        cout << "Invalid choice" << endl;
    }

    return 0;
}
