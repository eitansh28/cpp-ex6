# #!make -f
# # This Makefile can handle any set of cpp and hpp files.
# # To use it, you should put all your cpp and hpp files in the SOURCE_PATH folder.

# CXX=clang++-9
# CXXVERSION=c++2a
# SOURCE_PATH=sources
# OBJECT_PATH=objects
# CXXFLAGS=-std=$(CXXVERSION) -Werror -Wsign-conversion -I$(SOURCE_PATH)
# TIDY_FLAGS=-extra-arg=-std=$(CXXVERSION) -checks=bugprone-*,clang-analyzer-*,cppcoreguidelines-*,performance-*,portability-*,readability-*,-cppcoreguidelines-pro-bounds-pointer-arithmetic,-cppcoreguidelines-owning-memory --warnings-as-errors=*
# VALGRIND_FLAGS=-v --leak-check=full --show-leak-kinds=all  --error-exitcode=99

# SOURCES=$(wildcard $(SOURCE_PATH)/*.cpp)
# HEADERS=$(wildcard $(SOURCE_PATH)/*.hpp)
# OBJECTS=$(subst sources/,objects/,$(subst .cpp,.o,$(SOURCES)))

# run: test

# # test:  $(OBJECTS)
# # 	$(CXX) $(CXXFLAGS) $^ -o $@

# # %.o: %.cpp $(HEADERS)
# # 	$(CXX) $(CXXFLAGS) --compile $< -o $@

# # $(OBJECT_PATH)/%.o: $(SOURCE_PATH)/%.cpp $(HEADERS)
# # 	$(CXX) $(CXXFLAGS) --compile $< -o $@

# run: main
# 	./main

# demo: main.o $(OBJECTS)
# 	$(CXX) $(CXXFLAGS) $^ -o main


# test: TestCounter.o Test.o $(OBJECTS)
# 	$(CXX) $(CXXFLAGS) $^ -o test

# tidy:
# 	clang-tidy $(SOURCES) $(HEADERS) $(TIDY_FLAGS) --

# valgrind: test
# 	valgrind --tool=memcheck $(VALGRIND_FLAGS) ./test 2>&1 | { egrep "lost| at " || true; }

# clean:
# 	rm -f $(OBJECTS) *.o test* 
# 	rm -f StudentTest*.cpp




#!make -f

CXX=clang++-9 
CXXVERSION=c++2a
CXXFLAGS=-std=$(CXXVERSION) -Werror -Wsign-conversion
TIDY_FLAGS=-extra-arg=-std=$(CXXVERSION) -checks=bugprone-*,clang-analyzer-*,cppcoreguidelines-*,performance-*,portability-*,readability-*,-cppcoreguidelines-pro-bounds-pointer-arithmetic,-cppcoreguidelines-owning-memory --warnings-as-errors=-*
VALGRIND_FLAGS=-v --leak-check=full --show-leak-kinds=all  --error-exitcode=99

SOURCES=Team.cpp Game.cpp League.cpp Schedule.cpp
OBJECTS=$(subst .cpp,.o,$(SOURCES))


run: demo
	./demo

demo: Demo.o $(OBJECTS)
	$(CXX) $(CXXFLAGS) $^ -o demo


test: TestCounter.o Test.o $(OBJECTS)
	$(CXX) $(CXXFLAGS) $^ -o test

tidy:
	clang-tidy $(SOURCES) $(TIDY_FLAGS) --

valgrind: demo test
	valgrind --tool=memcheck $(VALGRIND_FLAGS) ./demo 2>&1 | { egrep "lost| at " || true; }
	valgrind --tool=memcheck $(VALGRIND_FLAGS) ./test 2>&1 | { egrep "lost| at " || true; }

%.o: %.cpp
	$(CXX) $(CXXFLAGS) --compile $< -o $@

clean:
	rm -f *.o main test