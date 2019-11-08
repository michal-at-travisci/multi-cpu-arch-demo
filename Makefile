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

vpath %.cpp $(sort $(dir $(SRC_DIR)))

.PHONY: all clean

all: builddir build

builddir: $(BUILD_DIR)

$(BUILD_DIR):
	mkdir -p $@

build: $(BUILD_DIR)/%.o

$(BUILD_DIR)/%.o: %.cpp
	$(CXX) $(CXXFLAGS) $< -o $@

clean:
	@rm -rf $(BUILD_DIR) 

info:
	@echo " Info..."
	@echo " SRC_DIR = $(SRC_DIR)"
	@echo " BUILD_DIR = $(BUILD_DIR)"
