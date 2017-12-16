#!/bin/bash

var1=
var2=


if [-e $HOME ]
then
	echo "Diretorio ou arquivo exite"
 if [ -f $HOME ]
then
	echo "É um arquivo"
else
	echo "É um diretorio"
 fi
else
	echo "Diretorio não encontrado"
fi
