#!/bin/sh

echo "--- Launching the test script ---"

> tests/expected.txt
> tests/got.txt



gcc tests/test_assembly.c
expected=$(./a.out)
echo $expected >> tests/expected.txt



make > /dev/null
gcc tests/test_assembly.c libasm.so
got=$(./a.out)
echo $got >> tests/got.txt


diff tests/expected.txt tests/got.txt

if [ $? = "0" ]; then
    echo "\n\e[92m\tIdentical results\e[0m\n"
else
    echo "\n\e[91m\tTest failed\e[0m\n"
fi

make fclean > /dev/null
rm a.out
rm tests/expected.txt
rm tests/got.txt

echo "--- Script terminated ---"