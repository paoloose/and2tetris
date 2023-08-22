#!/bin/bash

simulator="tools/HardwareSimulator.sh"
d_name="02.Boolean_Arithmetic"
tst_files=$(find "$d_name" -maxdepth 1 -name "*.tst")
failed=0

if [ ! -f "$simulator" ]; then
    echo "tools/HardwareSimulator.sh not found" >&2
    exit 1
fi

for f in $tst_files; do
    output=$($simulator $f 2>&1)
    if [ $? -ne 0 ]; then
        failed=$((failed + 1))
        echo -n "❎ "
    else
        echo -n "✅ "
    fi
    echo "$(basename $f)"
    echo "   $output"
done

find $d_name -maxdepth 1 -name "*.out" -delete
echo
if [ $failed -ne 0 ]; then
    echo "$failed tests failed"
    exit 1
fi

echo "All tests passed"
