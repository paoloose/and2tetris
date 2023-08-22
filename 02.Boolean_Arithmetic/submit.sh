#!/bin/bash

d_name="02.Boolean_Arithmetic"
zip_name="project1.zip"

cd "$d_name" 2>/dev/null

hdl_files=$(find . -maxdepth 1 -name "*.hdl")
zip "$zip_name" $hdl_files
