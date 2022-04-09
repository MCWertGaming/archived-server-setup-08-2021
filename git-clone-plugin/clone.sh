#!/usr/bin/env bash

set -e

if [[ "$REPOSITORY" == "" ]]; then
    echo "No repository defined!"
    echo "exiting..."
    exit 1
elif [[ "$DRONE_COMMIT" == "" ]]; then
    echo "No commit defined!"
    echo "exiting..."
    exit 1
fi

echo ""
echo "================="
echo "Cloning repo..."
echo "================="
echo ""
git clone $REPOSITORY .

echo ""
echo "======================"
echo "Checking out branch..."
echo "======================"
echo ""
git checkout $DRONE_COMMIT

echo ""
echo "========="
echo "FINISHED!"
echo "========="
echo ""
