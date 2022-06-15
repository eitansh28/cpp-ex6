#pragma once

#include "Team.hpp"
using namespace std;
namespace eitan{
    class Game
{
private:
    Team* home;
    Team* out;
    int homeScore;
    int outScore;

public:
    Game(/* args */);
    Game(Team &home, Team &out);
    ~Game();
    int getoutscore();
    int gethomescore();
    string winner();
};

Game::Game(Team &home, Team &out): home(&home), out(&out){
    this->homeScore=rand()%45 +55+(10*(home.grade));
    this->outScore=rand()%50 +50+(10*(out.grade));

}
Game::Game(/* args */)
{
}

Game::~Game()
{
}
int Game::getoutscore(){
    return this->outScore;
}
int Game::gethomescore(){
    return this->homeScore;
}
string Game::winner(){
    string win=this->home->name;
    if(this->homeScore<this->outScore){
        win=this->out->name;
        this->out->wins++;
        this->home->lose++;
    }else{
        this->home->wins++;
        this->out->lose++;
    }
    return win;
}
}

