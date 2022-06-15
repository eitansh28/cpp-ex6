#include "doctest.h"
#include "Team.hpp"
#include "Game.hpp"
TEST_CASE(""){
    eitan::Team* t=new eitan::Team("hapoel", 0.2);
    eitan::Team* s=new eitan::Team("maccabi", 0.2);
    eitan::Game* g=new eitan::Game(*s,*t);
    CHECK(g->winner()=="hapoel");
    CHECK_FALSE(g->winner()=="maccabi");
    eitan::Game* n=new eitan::Game(*s,*t);
    delete t;
    delete s;
    delete g;
    delete n;
    CHECK(1==1);
}