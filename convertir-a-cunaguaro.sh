#!/bin/bash

ACTUAL=$( pwd )

LLAVE="canaima-bu_____________________canaima-estilo-visual-gnome"

OPCIONES="${LLAVE} $( echo ${LLAVE} | tr '[:lower:]' '[:upper:]' ) $( echo ${LLAVE} | tr '[:upper:]' '[:lower:]' )"

for REEMPLAZAR in ${OPCIONES}; do

	ICEWEASEL=${REEMPLAZAR%_____________________*}
	CUNAGUARO=${REEMPLAZAR#${ICEWEASEL}_____________________}

	for ARCHIVO in $( find . -type d | grep -v ".git/" | grep -v "convertir-a-cunaguaro.sh" ); do
		NUEVO=$( echo ${ARCHIVO} | sed "s/${ICEWEASEL}/${CUNAGUARO}/g" )
		if [ "${ARCHIVO}" != "${NUEVO}" ]; then
			echo "Renombrando ${ARCHIVO} a ${NUEVO}"
			mv "${ARCHIVO}" "${NUEVO}"
		fi
	done

	for ARCHIVO in $( find . -type f | grep -v ".git/" | grep -v "convertir-a-cunaguaro.sh" ); do
		NUEVO=$( echo ${ARCHIVO} | sed "s/${ICEWEASEL}/${CUNAGUARO}/g" )
		if [ "${ARCHIVO}" != "${NUEVO}" ]; then
			echo "Renombrando ${ARCHIVO} a ${NUEVO}"
			mv "${ARCHIVO}" "${NUEVO}"
		fi
	done

	for ARCHIVO in $( grep -IHR "${ICEWEASEL}" . | cut -d: -f1 | grep -v ".git/" | grep -v "convertir-a-cunaguaro.sh" ); do
		echo "Sustituyendo ${ICEWEASEL} por ${CUNAGUARO} en ${ARCHIVO}"
		sed -i "s/${ICEWEASEL}/${CUNAGUARO}/g" ${ARCHIVO}
	done
done


