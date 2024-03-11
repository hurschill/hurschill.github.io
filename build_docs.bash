#!/bin/bash

cd ./mdbook && mdbook build && cd -
rm -rf ./docs
mv ./mdbook/book docs
