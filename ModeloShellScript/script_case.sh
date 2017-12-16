#!/bin/bash

local=

case $local in

	quarto)
		echo " voce esta no quarto " ;;
	cozinha)
		echo " voce esta na cozinha " ;;
	cagando | comendo)
		echo " Voce esta cagando ou comendo " ;;
*)

		echo " Não sei que bagaca voce esta fazendo" ;;
esac
