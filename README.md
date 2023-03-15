# PROYECTO PRIMER PARCIAL
Como proyecto del primer parcial vamos a realizar una aplicación que nos ayude a aprender acerca de las diferentes metodologías de desarrollo ágil de software.

## Paso 1

Programe en bash una aplicación que requiera un parámetro al ejecutarse -a (metodologías ágiles) y -t (metodologías tradicionales ) desplegará el siguiente menú en la terminal:

*Opción -a 

Bienvenido a la guía rápida de Agile, para continuar seleccione un tema:

            SCRUM
            X.P.
            Kanban
            Crystal

*Opción -t

Bienvenido a la guía rápida de metodologías tradicionales, para continuar seleccione un tema:

            Cascada
            Espiral
            Modelo V

__________________________
```
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
                seccion="SCRUM"
                archivo="scrum.inf"
                submenu
                ;;
            2)
                seccion="X.P."
                archivo="xp.inf"
                submenu
                ;;
            3)
                seccion="Kanban"
                archivo="kanban.inf"
                submenu
                ;;
            4)
                seccion="Crystal"
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
                seccion="CASCADA"
                archivo="cascada.inf"
                submenu
                ;;
            2)
                seccion="ESPIRAL"
                archivo="espiral.inf"
                submenu
                ;;
            3)
                seccion="MODELO V"
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
```
__________________________

##Paso 2

Una vez seleccionado un tema en especifico deberá de mostrar las siguientes opciones:

Usted esta en la sección ${nombre de la sección}, seleccione la opción que desea utilizar.

            Agregar información
            Buscar
            Eliminar información
            Leer base de información.


__________________________
```
submenu() {
    echo "Usted esta en la sección $seccion, seleccione la opción que desea utilizar:"
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
```
__________________________

##Paso 3 y Paso 4

-La idea de este sub menú es almacenar información en archivos con extensión .inf (uno por cada metodología) el cual tendrá la siguiente estructura:

[concepto(1)] .- Definición.

-Al agregar información se debe solicitar el identificador del concepto y la definición al guardarlo se debe de formatear y anexar al final del archivo.
__________________________
```
agregar_info() {
    echo "Ingrese el identificador del concepto:"
    read id
    echo "Ingrese la definición:"
    read definicion
    echo "[$id] .- $definicion." >> "$archivo"
    echo "Información agregada correctamente."
    echo " "
}
```
__________________________

## Paso 5

Al ejecutar la opción buscar deberá solicitar el elemento a buscar dentro del archivo (se debe ubicar el identificador utilizando expresiones regulares).

__________________________
```
buscar_info() {
    echo "Ingrese el identificador a buscar:"
    read id
    grep "\[$id\]" "$archivo" || echo "No se encontró información."
}
```
__________________________

## Paso 6

Al eliminar información debe solicitarnos el concepto y quitarlo del archivo.

__________________________
```
eliminar_info() {
    echo "Ingrese el identificador a eliminar:"
    read id
    sed -i "/\[$id\]/d" "$archivo"
    echo "Información eliminada correctamente."
    echo " "    
}
```
__________________________

## Paso 7
Al seleccionar leer la base de información nos debe de imprimir en pantalla el contenido del archivo.
__________________________

```
leer_archivo() {
    echo "Contenido del archivo $archivo:"
    cat "$archivo"
}
```
__________________________

## Paso 8
Al terminar la ejecución de un comando debe pedirnos una siguiente opción, volver al menú anterior o terminar la ejecución.

__________________________
```
Ya implementado en el menú
```
__________________________

## Paso 9

Empaquete en una imagen de docker su aplicación bash, deberá al ejecutarse un contenedor lanzar inmediatamente su aplicación. 

## Versiones

Usamos Github, Gitlab y Bitbucket para el control de versiones. Para consultar las versiones de este proyecto consulte los commits en este repositorio.

## Autores

*Marcos ALfredo Aguilar Mata (353223)
*Fátima Monserrath Duarte Pérez (353324)
*América Guadalupe Martínez Cano (348810)

## Información Academica

* Ing. Luis Antonio Ramírez Martínez
* Universidad Autonóma de Chihuahua
* Facultad de Ingeniería | 6CC2
