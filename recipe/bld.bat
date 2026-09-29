mkdir build
cd build

:: MSVC's legacy lambda processor fails on toml++ 3.4.0, see marzer/tomlplusplus#219
cmake ^
    -G "Ninja" ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DCMAKE_CXX_FLAGS="%CXXFLAGS% /Zc:lambda" ^
    -DCMAKE_INSTALL_SYSTEM_RUNTIME_LIBS_SKIP=True ^
    -DBUILD_EXAMPLES:BOOL=ON ^
    -DBUILD_TESTING=ON ^
    %SRC_DIR%
if errorlevel 1 exit 1

:: Build.
cmake --build . --config Release
if errorlevel 1 exit 1

:: Install.
cmake --build . --config Release --target install
if errorlevel 1 exit 1

:: Test
ctest --output-on-failure -C Release
if errorlevel 1 exit 1
