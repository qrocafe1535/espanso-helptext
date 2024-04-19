#!/bin/bash

hora_atual=$(date +%H:%M)
manha_inicio="05:00"
tarde_inicio="12:00"
noite_inicio="18:00"

if [[ "$hora_atual" < "$manha_inicio" ]]; then
    saudacao="boa noite"
elif [[ "$hora_atual" < "$tarde_inicio" ]]; then
    saudacao="bom dia"
elif [[ "$hora_atual" < "$noite_inicio" ]]; then
    saudacao="boa tarde"
else
    saudacao="boa noite"
fi

echo $saudacao
