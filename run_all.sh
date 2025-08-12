#!/usr/bin/env bash

# run all formula
echo "running brew_formula"
bash ./brew_formula.sh

# run all casks
echo "running brew_casks"
bash ./brew_casks.sh

# run all mac defaults
echo "running mac defaults"
bash ./defaults.sh
