#!/bin/bash

var1=
var2=


if [-d $HOME ]
then
	echo "Diretorio exite"
	cd $HOME ; $PWD
else
	echo "Diretorio não encontrado"
fi
