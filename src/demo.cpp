#include <iostream>
#include <cstdlib>

// Environment variable name as per https://docs.travis-ci.com/user/environment-variables#default-environment-variables
const char* env_name="TRAVIS_CPU_ARCH";

int main()
{
  int ret_code = 0;
  if (const char* env_p = std::getenv(env_name)) {
    std::cout << "Your " + env_name + " is: " << env_p << "\n";
  } else {
    std::cout << "Didn't find env variable named: " + env_name;
    ret_code = 1;
  }
  
  exit(ret_code);
}
