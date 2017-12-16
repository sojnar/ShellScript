#!/bin/bash

var1=`echo "scale=2;2 / 5" | bc`
echo "Resultado $var1 "


#var1=
var2=
var3=`echo "scale=4;$var1 / $var2" | bc`
echo "Resultado: $var3"
