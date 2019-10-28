# Americana Techconf2019
Repositório da palestra.

Hands On - Americana Tech Conf - 2019
Infraestrutura Ágil

Pré-Requisitos

:: Virtualização ::

Linux

- Distribuição: Ubuntu 18.04 LTS
- Virtualbox: 6.0.8
- Vagrant: 2.2.6

Windows

- Versão: Windows 10
- Virtualbox: 6.0.8
- Vagrant: 2.2.4

:: Rede ::

- Rede Interna: 10.15.15.0/24
- Nome: mongocluster

VBoxManage dhcpserver add --netname mongocluster --ip 10.15.15.100 --netmask 255.255.255.0 --lowerip 10.15.15.101 --upperip 10.15.15.254 --enable
