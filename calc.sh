#!/bin/bash
echo "Введите первое число"
read a
echo "Введите второе число"
read b
echo "Введите операцию +/-/*//"
read c
let "d = a $c b"
echo "$a $c $b = $d"