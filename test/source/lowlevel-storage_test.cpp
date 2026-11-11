#include "lib.hpp"

auto main() -> int
{
  auto const lib = library {};

  return lib.name == "lowlevel-storage" ? 0 : 1;
}
