#!/bin/bash
HOSTs=(IG1 IG2 IG3 IG4 IG5 IG6 IG7 IG8 IG9 IG10 IG12 IG13 IG14 IG15 IG16 IG17 IG18 IG19 IG20 IG21 IG22 IG23 IG24 IG25 IG26 IG27 IG28 IG29 IG30)
for HOST in "${HOSTs[@]}"
do
    echo "Копирование данных на $HOST ..."
    ssh ig30 rsync -az /var/Data/data/* $HOST:/var/Data/data/
    echo "$HOST копирование завершено"
done
