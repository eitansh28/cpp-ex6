#pragma once
#include <string>
#include <iostream>
using namespace std;
namespace eitan{
    class Team
{
private:

public:
    string name;
    double grade;
    double wins=0;
    double lose=0;
    Team();
    Team(string name, double grade);
    ~Team();
};

Team::Team(string name, double grade): name(name), grade(grade)
{
}
Team::Team(){

}
Team::~Team()
{
}
}

