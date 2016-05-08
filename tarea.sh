#!/bin/bash
# por JOSÉ ALEJANDRO LIBREROS MONTAÑO 1427406
# ESCUELA DE INGENIERÍA DE SISTEMAS Y COMPUTACIÓN
# UNIVERSIDAD DEL VALLE
# ASIGNATURA: SISTEMAS OPERATIVOS


# calcula el promedio de una serie de números

SCORE="0"
AVERAGE="0"
SUM="0"
NUM="0"

while true; do

	echo -n "Digite su puntaje [0-100%] ('q' para salir): ";
	read SCORE;
	
	if (("$SCORE" < "0" )) || (("$SCORE" > "100" )); then
		echo "Pórtese serio. Vamos, inténtelo de nuevo: "
	elif [ "$SCORE" == "q" ]; then
		echo "Promedio: $AVERAGE%."
		break
	else 
		curl --silent --request POST --header "X-THINGSPEAKAPIKEY: PK6SB6LPTG17KTNZ" --data "field1=$SCORE" "http://api.thingspeak.com/update"
		SUM=$[$SUM + $SCORE]
		NUM=$[$NUM + 1]
		AVERAGE=$[$SUM / $NUM]
	fi
done

echo "Saliendo."
