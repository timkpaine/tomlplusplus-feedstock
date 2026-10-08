#include <toml++/toml.h>

#if TOML_MSVC
static_assert(TOML_DISABLE_CONDITIONAL_NOEXCEPT_LAMBDA == 1);
#else
static_assert(TOML_DISABLE_CONDITIONAL_NOEXCEPT_LAMBDA == 0);
#endif

int main()
{
    toml::array array{1, 2};
    toml::table table{{"first", 1}, {"second", 2}};
    int visits = 0;
    array.for_each([&](auto&) noexcept { ++visits; });
    table.for_each([&](auto, auto&) noexcept { ++visits; });
    return visits == 4 ? 0 : 1;
}
