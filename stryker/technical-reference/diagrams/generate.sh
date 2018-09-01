#!/bin/bash

npm i -g sdedit
for file in *.sd; do
  sdedit run -o "${file%.sd}.png" -t png "${file}"
done
npm uninstall -g sdedit