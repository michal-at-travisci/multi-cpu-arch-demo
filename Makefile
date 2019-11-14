CXXFLAGS = -Wall -Wextra

GCC_CXXFLAGS = -DMESSAGE='"Compiled with GCC"'
CLANG_CXXFLAGS = -DMESSAGE='"Compiled with Clang"'
UNKNOWN_CXXFLAGS = -DMESSAGE='"Compiled with an unknown compiler"'

ifeq ($(CXX),g++)
  CXXFLAGS += $(GCC_CXXFLAGS)
else ifeq ($(CXX),clang++)
  CXXFLAGS += $(CLANG_CXXFLAGS)
else
  CXXFLAGS += $(UNKNOWN_CXXFLAGS)
endif

SRC_DIR   = src
BUILD_DIR = build

vpath %.cpp $(sort $(dir $(SRC_DIR)))

.PHONY: demo clean

demo: 
	@echo " mkdir -p $(BUILD_DIR)"
	@mkdir -p $(BUILD_DIR)
	@echo " $(CXX) $(CXXFLAGS) -o $(BUILD_DIR)/demo $(SRC_DIR)/demo.cpp"
	$(CXX) $(CXXFLAGS) -o $(BUILD_DIR)/demo $(SRC_DIR)/demo.cpp

clean:
	@rm -rf $(BUILD_DIR) 

info:
	@echo " Info..."
	@echo " SRC_DIR = $(SRC_DIR)"
	@echo " BUILD_DIR = $(BUILD_DIR)"
	@echo " CXXFLAGS = $(CXXFLAGS)"
	@echo " CXX = $(CXX)"
