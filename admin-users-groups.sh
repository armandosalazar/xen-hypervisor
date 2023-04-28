#!/bin/bash

echo "=== Opciones ==="
echo "1) Crear usuario"
echo "2) Modificar usuario"
echo "3) Eliminar usuario"
echo "4) Eliminar usuario y sus archivos"
echo "5) Ver a que grupo pertenece un usuario"
echo "6) Contraseñas"
echo "7) Listar usuarios registrados"
echo "8) Listar grupos disponibles"
echo "9) Crear un nuevo grupo"
echo "10) Modificar un grupo"
echo "11) Eliminar un grupo"
echo "12) Salir"
echo -n "Introduce una opción: "

read opt

echo ""
case $opt in
	1)
	echo "*** Crear usuario ***"
	echo -n "Escribe el nombre del nuevo usuario: "
	read user
	adduser $user
	passwd $user
	;;
	2)
	echo "*** Modificar usuario ***"
	echo "1) Nombre de usuario"
	echo "2) Modificar diractorios"
	echo "3) Agregar usuario a uno o más grupos"
	echo "4) Fecha de expiración de la cuenta de usuario"
	echo "5) Bloquear contraseña de usuario"
	echo "6) Desbloquear contraseña de usuario"
	echo -n "Introduce una opción: "
	read opt
	case $opt in
		1)
		echo -n "Escribe el nombre del usuario que desea modificar: "
		read username
		read new_username
		usermod -l $username $new_username
		;;
		2)
		echo -n "Introduce el directorio: "
		read directory
		echo -n "Introduce el usuario: "
		read username
		usermod -d $directory -m $username
		;;
		3)
		read groups
		usermod G $groups
		;;
		4)
		read date # 2023-04-25
		read username
		usermod --expiredate $date $username
		;;
		*)
		echo "Opción invalida"
		;;
	esac
	echo "Fecha de exipiración de la cuenta de usuario"
	echo "Bloquear contraseña de usuario"
	read username
	usermod --lock $username
	echo "Desbloquear contraseña de usuario"
	read username
	usermod --unlock $username
	# Modificar contraseña
	read user
	passwd $user
	;;
	3)
		# Eliminar un usuario
		read user
		userdel $user
		;;
	4)
		# Eliminar el usuario y sus archivos
		read user
		userdel -rf $user
		;;
	5)
		# Ver a que grupo pertenece un usuario
		read user
		groups $user
		;;
	6)
		# Contraseñas
		case opt in
		1) ;;
		2) ;;
		3) ;;
		*) ;;
		esac
		echo "Fecha de expiración de contraseña de usuario"
		# instalar chage
		read user
		chage --list $user
		echo "Número de días para la expiración de contraseña de usuario"
		read days
		read user
		chage -M $days $user
		echo "Contraseña expirada"
		read user
		chage -d 0 $user
		;;
	7)
		# Editar usuarios registrados
		nano /etc/passwd
		;;
	8)
		# Ver grupos
		nano /etc/group
		;;
	9)
		# Añadir a grupo
		read group
		groupadd $group
		;;
	10)
	# Modificar usuarios
	echo ""
	case opt in
	1) ;;
	2) ;;
	3) ;;
	*)
	echo "Opción invalida"
	;;
	esac
	echo "Modificar nombre del grupo"
	groupmod $group $new_group_name
	echo "Agregar usuario a un grupo"
	echo "Eliminar un usuario de un gropo"
	read user
	read group
	gpasswd -d $user $group
	echo "Agregar usuario"
	read user
	read group
	gpasswd -a $user $group
	;;
	11)
	# Eliminar grupo
	read group
	groupdel $group
	;;
	12)
	echo "Bye!"
	exit
	;;
	*)
	echo "Opción invalida"
	;;
esac
