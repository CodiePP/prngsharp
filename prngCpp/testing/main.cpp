#include <iostream>

#include "mt19937.hpp"

using namespace std;

int main()
{
    prngCpp::MT19937 prng;
    for (int i = 0; i < 20; i++) {
        std::cout << prng.get_uint32() << " ";
    }
    std::cout << std::endl;
    return 0;
}
