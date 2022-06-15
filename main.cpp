#include <iostream>
#include "Team.hpp"
#include "Game.hpp"
#include "League.hpp"
#include "Schedule.hpp"
using namespace std;
using namespace eitan;

int main(){
    vector<Team*>leg;
    leg.emplace_back(new eitan::Team("holon", 0.7));
    leg.emplace_back(new eitan::Team("hapoel", 0.4));
    leg.emplace_back(new eitan::Team("maccabi", 0.2));
    eitan::Game* g=new eitan::Game(*leg.at(1),*leg.at(2));
    eitan::Game* n=new eitan::Game(*leg.at(2),*leg.at(1));
    League myleg(leg);
    cout<<g->gethomescore()<<endl;
    cout<<g->getoutscore()<<endl;
    cout<<g->winner()<<endl;
    cout<<leg.at(1)->lose<<endl;
    cout<<leg.at(2)->wins<<endl;
    delete g;
    delete n;
    return 0;
}