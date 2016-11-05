#include <random>

namespace prngCpp {

class MT19937 {

    public:
        MT19937();
        ~MT19937();

        uint32_t get_uint32();

    private:
        bool _init { false };
        void seeding();
        std::random_device _rd;
        std::mt19937 _gen;
};

}

#ifndef _WINDLL
extern "C" prngCpp::MT19937 * mk_mt19937()
{ return new prngCpp::MT19937(); }

extern "C" uint32_t get_uint32(prngCpp::MT19937 * prng)
{ return prng?prng->get_uint32():0UL; }

extern "C" void del_ptr(prngCpp::MT19937 * prng)
{ if (prng) { delete prng; } }
#endif
