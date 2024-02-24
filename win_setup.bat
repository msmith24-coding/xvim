@echo off

net session &gt; nul 2&gt;&amp;1
if %errorlevel% equ 0 (
    echo [ERR] This setup must be ran in Administrative Mode.
    pause
    exit /b 1
)

where choco >nul 2>nul
if not %errorlevel% equ 0 (
    echo [ERR] Chocolatey is not installed or added to system path.
    echo [ERR] Try to install Chocolatey from Powershell in administrative shell.
    echo [ERR] https://chocolatey.org/install
    
    pause
    exit /b 1
)

where gcc >nul 2>nul
if not %errorlevel% equ 0 (
    echo [WARN] `gcc` is not installed or added to system path.
    echo [INFO] Trying to install `gcc` from `mingw` using Chocolatey.
    choco install mingw

    where gcc >nul 2>nul
    if not %errorlevel% equ 0 (
        echo [ERR] Failed to install `gcc` from `mingw`.
        
        pause
    )

    echo [INFO] `gcc` from `mingw` successfully installed.
)

where make >nul 2>nul
if not %errorlevel% equ 0 (
    echo [WARN] `make` is not installed or added to system path.
    echo [INFO] Trying to install `make` from `make` using Chocolatey.
    choco install make

    where make >nul 2>nul
    if not %errorlevel% equ 0 (
        echo [ERR] Failed to install `make` from `make`.
        
        pause
    )

    echo [INFO] `make` from `make` successfully installed.
)

where cmake >nul 2>nul
if not %errorlevel% equ 0 (
    echo [WARN] `cmake` is not installed or added to system path.
    echo [INFO] Trying to install `cmake` from `cmake` using Chocolatey.
    choco install cmake --installargs 'ADD_CMAKE_TO_PATH=System'

    where cmake >nul 2>nul
    if not %errorlevel% equ 0 (
        echo [ERR] Failed to install `cmake` from `cmake`.
        pause
    )

    echo [INFO] `cmake` from `cmake` successfully installed.
)

echo [INFO] All required libraries where found.
echo [INFO] XVIM has been setup and is ready for developer on Windows 10/11 platform.

echo [INFO] Run the following command when you want to update the CMakeLists.txt:
echo [INFO]     $ cmake -G "MinGW Makefiles" .

pause
