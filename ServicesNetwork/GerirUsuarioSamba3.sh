#!/bin/bash
clear
echo "Administração de usuários"
echo "#########################################"
echo " 1 - Cadastrar usuário "
echo " 2 - Alterar senha de usuario "
echo " 3 - Cadastrar Grupo "
echo " 4 - Deletar usuário "
echo " 5 - Mudar usuário de grupo "
echo " 6 - Listar usuários cadastrados "
echo " 7 - Listar grupos cadastrados "
echo " 8 - Sair "
echo "#########################################"
echo -n ""
read -p "Escolha uma opção: " opcao
clear
########### Criando Usuário ##########
if [ $opcao -eq '1' ]
then
	echo "########### Criando Usuário ###########"
	echo -n "Digite o nome do usuário que deseja criar: "
	read cria_usuario
	criar=$( sudo useradd -d /home/$cria_usuario -k /bin/bash $cria_usuario -m )
	echo "Digite a senha do usuario $cria_usuario: "
	senha=$(sudo smbpasswd -a $cria_usuario)
fi
########### Alterando senha de Usuario ############
if [ $opcao -eq '2' ]
then
	echo "########### Alterando senha de Usuario #############"
	echo -n "Digite o nome do usuário que deseja alterar a senha: "
	read alter_user
	alter=$( sudo smbpasswd -a $alter_user )
fi
########### Criando grupo #############
if [ $opcao -eq '3' ]
then
	echo "########### Criando Grupo ###########"
	echo -n "Digite o nome do grupo que deseja criar: "
	read cria_grupo
	criar=$( sudo groupadd $cria_grupo )
fi
########### Deletando Usuário# #########
if [ $opcao -eq '4' ]
then
	echo "########### Deletando Usuário ###########"
	echo -n "Digite o nome do usuário que deseja excluir do sistema: "
	read deleta_user
	deleta=$( sudo userdel $deleta_user 2> /dev/null )
	deleta2=$( sudo groupdel $deleta_user 2> /dev/null )
fi
########## Adicionando Usuário ao grupo ##########
if [ $opcao -eq '5' ]
then
	echo "############ Adicionando Usuário ao grupo ############"
	echo -n "Digite o nome do grupo: "
	read grupo
	echo -n "Digite o nome do Usuário: "
	read usuario
	add_grupo=$( usermod -g $grupo $usuario )
	echo "Grupo do usuario alterado"
	groups $usuario
fi
########## Listando Usuarios ###########
if [ $opcao -eq '6' ]
then
	echo "########### Listando Usuarios ############"
	cat /etc/passwd | grep bash$ | awk -F ":" '{print $1}'
fi
########## Listando Grupos cadastrados ############
if [ $opcao -eq '7' ]
then
	cat /etc/group | grep -e ":[1-9][0-9][0-9][0-9]:" | awk -F ':' '{ print $1}'
exit 0
fi
