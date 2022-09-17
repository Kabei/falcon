#!/bin/bash

mix deps.get
make -f Makefile
make -f Makefile1024
mix compile