#!/bin/bash

verifica_ad()
{

  clear 
  echo "#############################"
  echo -n "Versão do sistema: "
  cat /etc/redhat*
  echo

  echo "#############################"
  echo -n "Verificando se contem os pacotes do kerberos instalados:"
  echo
  rpm -qa | grep -i krb
  rpm -qa | grep -i realmd
  rpm -qa | grep -i oddjob
  rpm -qa | grep -i samba
  rpm -qa | grep -i openldap
  sleep 2
  echo

  echo "#############################"
  echo -n "Verificando configuracao do kerberos:"
  echo
  cat /etc/krb5.conf | grep -i pcserver
  echo
  cat /etc/sssd/sssd.conf
  sleep 2
  echo

  echo "#############################"
  echo -n "Verificando usuarios permitidos no ssh: "
  echo
  cat /etc/ssh/sshd_config | grep -i allow[u,g]
  sleep 2
  echo

  echo "#############################"
  echo -n "Verificando usuarios locais do sistemas: "
  echo
  cat /etc/passwd | grep -i 1[0-9][0-9][0-9]
  cat /etc/passwd | grep -i 5[0-9][0-9]
  sleep 2
  echo

  echo "#############################"
  echo -n "Verificando usuarios no sudoers: "
  echo
  tail -n5  /etc/sudoers | grep ALL
  sleep 5
   
}

integra_ad()
{
 
  clear
  echo "########################"
	  echo -n "Instalando pacotes para inclusao: "
	  echo 
	  yum -y install sssd realmd oddjob oddjob-mkhomedir adcli samba-common samba-common-tools krb5-workstation openldap-clients policycoreutils-python 2>> /tmp/erroryum.log
    echo 
    echo "Criando arquivo de log /tmp/erroryum.log"
	  sleep 2
	  clear
	  echo 

  echo "########################"
  echo -n "Digite 1 para incluir a maquina no ad ou 0 para pular a operação: "
  read incluir
    if [ $incluir != "0" ] 
    then
	    echo -n "Digite o nome do administrador PCSERVER: "
	    read usuario
	    realm join --user=$usuario pcserver.pcinformatica.com.br 2>> /tmp/erroRelam.log
      sair=$?
	
      if [ "$sair" != "0" ]
      then
        echo "Ocorreu um erro no momento da inclusão da maquina ao dominio!"
        echo "Para mais detalhes acesso o arquivo '/tmp/erroRelam.log'!"
        sleep 4
      fi
        
      if [ "$sair" == "0" ]
      then  
	      echo -n "Seja bem vindo!"
	      sleep 4
	      echo
      fi
    fi

  clear
  echo "########################"
    if [ "$sair" == "0" ]
    then
      echo -n "Digite 1 para configura o arquivo "sssd.conf" ou 0 para pular a operação: "
      read sssd
        
      if [ $sssd != "0" ]
      then
	      echo -n "Alterando a configuracao no arquivos sssd.conf: "
	      echo
	      sed -i 's/use_fully_qualified_names = True/use_fully_qualified_names = False/' /etc/sssd/sssd.conf
	      sed -i "s|%u@%d|%u|g"  /etc/sssd/sssd.conf
	      systemctl restart sssd.service
	      systemctl enable sssd.service
	      sleep 2
	      echo
      fi
    fi

  clear
  echo "########################"
    if [ "$sair" == "0" ]
    then
      echo -n "Digite 1 para configurar o arquivo "sshd_config" ou 0 para pular a operação: "
      read sshd
      
      if [ $sshd != "0" ]
      then
	      echo -n "Configurando o AllowUsers no sshd:"
	      echo
	      echo "AllowUsers root raphael.souza rogerio.silva marcus.silva rogerio.anjos " >> /etc/ssh/sshd_config
	      systemctl restart sshd
	      sleep 2
	      echo
      fi
    fi

  clear
  echo "########################"
    if [ "$sair" == "0" ]
    then
      echo -n "Digite 1 para configurar o arquivo "sudoers" ou 0 para pular a operação: "
      read sudo
    
      if [ $sudo != "0" ]
      then
	      echo -n "Configurando permissão no sudoers:"
	      echo
	      echo "%_ti_admins_linux ALL=(ALL) ALL" >> /etc/sudoers
	      sleep 2
	      echo
      fi
    fi

}

integra=1

while [ "$integra" != "0" ]
do
  clear
  echo "#############################################################"
  echo "#### Digite '1' para verificar as configurações krb5 e testar a autenticação no ad!"
  echo
  echo "#### Digite '2' para ingressar a maquina no dominio!"
  echo
  echo "#### Digite '0' para sair do menu!"
  echo
  echo -n "#### Entre com o valor: "
  read integra

  if [ $integra == "1" ]
  then 
   
    verifica_ad
  
  fi

  if [ $integra == "2" ]
  then
  
    integra_ad
  
  fi

done

