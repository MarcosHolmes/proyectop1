#!/bin/bash

echo "Ingresa una opción":
echo -e "-a(metodologías ágiles) \n-t(metodologías tradicionales)\n" 
read opc

case $opc in
    -a)
    echo "Bienvenido a la guía rápida de Agile, para continuar seleccione un tema:" 
    echo -e "1.SCRUM \n2.X.P. \n3.Kanban \n4.Crystal\n"
        ;;
    -t )
    echo "Bienvenido a la guía rápida de metodologías tradicionales, para continuar seleccione un tema:" 
    echo -e "1.Cascada \n2.Espiral \n3.Modelo V\n"
        ;;
    *)
    echo "Opción invalida"
        ;;
esac   
