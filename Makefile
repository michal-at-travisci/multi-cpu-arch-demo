CXXFLAGS = -Og -Wall -Wextra

GCC_CXXFLAGS = -DMESSAGE='"Compiled with GCC"'
CLANG_CXXFLAGS = -DMESSAGE='"Compiled with Clang"'
UNKNOWN_CXXFLAGS = -DMESSAGE='"Compiled with an unknown compiler"'

# Grab compiler for the build using env as per https://docs.travis-ci.com/user/environment-variables/#default-environment-variables
# CXX = ${TRAVIS_COMPILER}

ifeq ($(CXX),g++)
  CXXFLAGS += $(GCC_CXXFLAGS)
else ifeq ($(CXX),clang)
  CXXFLAGS += $(CLANG_CXXFLAGS)
else
  CXXFLAGS += $(UNKNOWN_CXXFLAGS)
endif

SRC_DIR = src
BUILD_DIR = build

.PHONY: all clean

all: $(BUILD_DIR) $(BUILD_DIR)/%.o

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CXX) $< -o $@

$(BUILD_DIR):
	mkdir -p $@

clean:
	@rm -rf $(BUILD_DIR) 

