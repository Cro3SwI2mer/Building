#set name of the executable file
target = main.out

#set directories
build_dir = ~/...
src_dir = ~/...

cc = clang
cxx = clang++
cxx_version = -std=c++20
cppflags = -Wall -Wextra -Werror -Wextra-semi -O1 -g -fsanitize=address -fno-omit-frame-pointer
sources = $(shell find $(src_dir) -name *.cpp -or -name *.c)
deps = $(shell find $(src_dir) -name *.hpp -or -name *.h)
objects := $(patsubst %c, $(src_dir)/%o, $(patsubst %pp, %, $(notdir $(sources))))
$(info $$objects are [${objects}])

executable = $(build_dir)/$(target)

all: $(executable)

$(executable): $(objects)
	$(cxx) $(cppflags) $(objects) -o $@

$(build_dir)/%.o: %.c
	$(cc) -c $< -o $@

$(build_dir)/%.o: %.cpp
	$(cxx) $(cxx_version) $(cppflags) -c $< -o $@

.PHONY: clean
clean:
	rm -f $(build_dir)/*.o $(build_dir)/*.out
