#!/bin/bash

# Función para agregar información
agregar_info() {
    echo "Ingrese el identificador del concepto:"
    read id
    echo "Ingrese la definición:"
    read definicion
    echo "[$id] .- $definicion." >> "$archivo"
    echo "Información agregada correctamente."
    echo " "
}

# Función para buscar información en un archivo
buscar_info() {
    echo "Ingrese el identificador a buscar:"
    read id
    grep "\[$id\]" "$archivo" || echo "No se encontró información."
}

# Función para eliminar información de un archivo
eliminar_info() {
    echo "Ingrese el identificador a eliminar:"
    read id
    sed -i "/\[$id\]/d" "$archivo"
    echo "Información eliminada correctamente."
    echo " "    
}

# Función para leer el contenido de un archivo
leer_archivo() {
    echo "Contenido del archivo $archivo:"
    cat "$archivo"
}

# Función para mostrar el submenú de opciones
submenu() {
    echo "Usted esta en la sección $nombre_seccion, seleccione la opción que desea utilizar:"
    echo "1. Agregar información"
    echo "2. Buscar información"
    echo "3. Eliminar información"
    echo "4. Leer base de información."
    echo "5. Volver al menú principal"
    echo "6. Salir"
    echo " "
    read opcion

    case $opcion in
        1)
            agregar_info
            submenu
            ;;
        2)
            buscar_info
            submenu
            ;;
        3)
            eliminar_info
            submenu
            ;;
        4)
            leer_archivo
            submenu
            ;;
        5)
            menu_principal
            ;;
        6)
            exit 0
            ;;
        *)
            echo "Opción inválida."
            submenu
            ;;
    esac
}


# Función para mostrar el menú principal
menu_principal() {
    if [ "$tipo_metodologias" == "Agile" ]; then

        echo "Bienvenido a la guía rápida de $tipo_metodologias, para continuar seleccione un tema:"
        echo "1. SCRUM"
        echo "2. X.P."
        echo "3. Kanban"
        echo "4. Crystal"
        echo "5. Salir"
        echo " "
        read opcion

        case $opcion in
            1)
                nombre_seccion="SCRUM"
                archivo="scrum.inf"
                submenu
                ;;
            2)
                nombre_seccion="X.P."
                archivo="xp.inf"
                submenu
                ;;
            3)
                nombre_seccion="Kanban"
                archivo="kanban.inf"
                submenu
                ;;
            4)
                nombre_seccion="Crystal"
                archivo="crystal.inf"
                submenu
                ;;
            5)
                exit 0
                ;;
            *)
                echo "Opción inválida."
                menu_principal
                ;;
        esac
    
    elif [ "$tipo_metodologias" == "metodologías tradicionales" ]; then
        
        echo "Bienvenido a la guía rápida de $tipo_metodologias, para continuar seleccione un tema:"
        echo "1. Cascada"
        echo "2. Espiral"
        echo "3. Modelo V"
        echo "4. Salir"

        read opcion

        case $opcion in
            1)
                nombre_seccion="CASCADA"
                archivo="cascada.inf"
                submenu
                ;;
            2)
                nombre_seccion="ESPIRAL"
                archivo="espiral.inf"
                submenu
                ;;
            3)
                nombre_seccion="MODELO V"
                archivo="modelo v.inf"
                submenu
                ;;
            4)
                exit 0
                ;;
            *)
                echo "Opción inválida."
                menu_principal
                ;;
        esac
    fi
}

# Verificación de parámetros
if [ $# -ne 1 ]; then
    echo "Error: se debe proporcionar un parámetro -a o -t."
    exit 1
fi

if [ "$1" == "-a" ]; then
    tipo_metodologias="Agile"
elif [ "$1" == "-t" ]; then
    tipo_metodologias="metodologías tradicionales"
else
    echo
fi 

menu_principal
