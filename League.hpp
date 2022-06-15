#pragma once
#include "Team.hpp"
#include <vector>
namespace eitan{
    class League
{
private:
    vector<Team*>leg;
public:
    League();
    League(vector<Team*> &other);
    League(League &other, int num);
    ~League();
};

League::League(vector<Team*>&other)
{
    for(unsigned int i=0;i<this->leg.size();++i){
        this->leg.push_back(other.at(i));
    }
    
}

League::~League()
{
    for(unsigned int i=0; i<this->leg.size();++i){
        delete this->leg.at(i);
    }
}

Team* champ(vector<Team*>&legu){
    Team* first = legu.at(0);
    for(unsigned int i=1;i<legu.size();++i){
        if(legu.at(i)->wins>first->wins){
            first=legu.at(i);
        }
    }
    return first;
}
}

