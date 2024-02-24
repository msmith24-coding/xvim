#!/bin/bash

if [! command -v brew > /dev/null 2>&1]; then
    echo "[WARN] `brew` is not installed or added to system path."
    echo "[INFO] Trying to install `brew`..."
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
    if [! command -v brew > /dev/null 2>&1]; then
        echo "[ERR] Failed to install `brew`."
        exit 1
    fi
    echo "[INFO] `brew` successfully installed."
fi

if [! command -v gcc > /dev/null 2>&1]; then
    echo "[WARN] `gcc` is not installed or added to system path."
    echo "[INFO] Trying to install `gcc`..."
    brew install gcc

    if [! command -v gcc > /dev/null 2>&1]; then
        echo "[ERR] Failed to install `gcc`."
        exit 1
    fi
    echo "[INFO] `gcc` successfully installed."
fi

if [! command -v make > /dev/null 2>&1]; then
    echo "[WARN] `make` is not installed or added to system path."
    echo "[INFO] Trying to install `make`..."
    brew install make

    if [! command -v make > /dev/null 2>&1]; then
        echo "[ERR] Failed to install `make`."
        exit 1
    fi
    echo "[INFO] `make` successfully installed."
fi

if [! command -v cmake > /dev/null 2>&1]; then
    echo "[WARN] `cmake` is not installed or added to system path."
    echo "[INFO] Trying to install `cmake`..."
    brew install cmake

    if [! command -v cmake > /dev/null 2>&1]; then
        echo "[ERR] Failed to install `cmake`."
        exit 1
    fi
    echo "[INFO] `cmake` successfully installed."
fi

echo "[INFO] All required libraries where found."
echo "[INFO] Continuing with setup..."

cmake .

echo "[INFO] XVIM has been setup and is ready for development on Mac platform."

echo "Press RETURN to continue . . ."
read -r
