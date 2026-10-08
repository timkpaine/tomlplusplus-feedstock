cl /nologo /std:c++17 /EHsc /Zc:lambda- /I"%LIBRARY_PREFIX%\include" test_for_each.cpp /Fe:test_for_each.exe
if errorlevel 1 exit 1

test_for_each.exe
if errorlevel 1 exit 1
