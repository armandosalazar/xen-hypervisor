#!/bin/bash

for file in *; do
	echo $file
done

for file in *; do
	echo $file
done

echo -n "Introduce una opción: "
read opt
case opt in
	1)
		echo "Opción uno"
		;;
	2)
		echo "Opción dos"
		;;
	\?)
		echo "Opción invalida"
		exit
		;;
esac
