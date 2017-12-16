#!/bin/bash


var1=
var2=

if ls /$var1
then
	echo " Diretorio $var1!"
elif ls /$var2
then
	echo " Diretorio $var2!"
else
	echo " Diretorio não encontrado!"
fi
