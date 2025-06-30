@Echo OFF
setlocal enabledelayedexpansion
title Menu limpiador de Perfiles de cursos

:inicio
cls
color 0A
echo ============================================================
echo ================                            ================
echo ================    Limpiador de Perfiles   ================
echo ================           by SABAS         ================
echo ================       WINDOWS VISTA/7/8    ================
echo ================                            ================
echo ================        Version MENU        ================
echo ============================================================
echo.
echo.
echo ************************************************************
echo *************************-=[MENU]=-*************************
echo ************************************************************
echo 1) Limpiar todos los perfiles    
echo 6) Borrar perfiles indicados
echo ************************************************************
echo 7) Salir
set /p var=Seleccione una opcion [1-7]: 
if "%var%"=="6" goto borrar_personalizados
if "%var%"=="7" goto salir
echo. Lo que has indicado no esta dentro del 1 al 7.... ESPABILA TIO!
echo 6) Salir
echo ************************************************************
echo.

set /p var=Seleccione una opcion [1-6]: 
if "%var%"=="1" goto op1
if "%var%"=="2" goto op2
if "%var%"=="3" goto op3
if "%var%"=="4" goto op4
if "%var%"=="5" goto op5
if "%var%"=="6" goto salir

::Mensaje de error, validaci??uando se selecciona una opci??uera de rango
echo. Lo que has indicado no esta dentro del 1 al 6.... ESPABILA TIO!
echo.
pause
echo.
goto inicio

:op1
    echo.
    echo. Limpiando todos los perfiles
    echo.
	::Eliminacion de archibos de los usuarios
       	del /S /Q "C:\Users\CURSO MA¥NA"
		del /S /Q "C:\Users\Curso Ma¤ana"
		del /S /Q "C:\Users\curso ma¤ana"
		del /S /Q "C:\Users\curso ma¤anas"
		
		del /S /Q "C:\Users\curso medio dia"
		
		del /S /Q "C:\Users\Curso Tarde"
		del /S /Q "C:\Users\CURSO TARDE"
		del /S /Q "C:\Users\curso tardes"
		del /S /Q "C:\Users\curso tarde"
	::Eliminacion de las carpetas de los usuarios	
		rd /S /Q "C:\Users\CURSO MA¥NA"
		rd /S /Q "C:\Users\Curso Ma¤ana"
		rd /S /Q "C:\Users\curso ma¤anas"
		rd /S /Q "C:\Users\curso ma¤ana"
		
		rd /S /Q "C:\Users\curso medio dia"
		
		rd /S /Q "C:\Users\Curso Tarde"
		rd /S /Q "C:\Users\curso tardes"
		rd /S /Q "C:\Users\curso tarde"
		rd /S /Q "C:\Users\CURSO TARDE"
	::Eliminacion de usuarios de curso ma??	
		net user "CURSO MA¥NA" /delete
		net user "curso ma¤ana" /delete
		net user "Curso Ma¤ana" /delete
		net user "curso ma¤ana" /delete	
		net user "curso ma¤anas" /delete
	::Eliminacion de usuarios de curso medio dia	
		net user "curso medio dia" /delete
	::Eliminacion de usuarios de curso tarde	
		net user "curso tarde" /delete
		net user "CURSO TARDE" /delete
		net user "Curso Tarde" /delete
		net user "curso tardes" /delete
		net user "curso tarde" /delete
	::Creacion de usuarios	
		net user "curso ma¤ana" /add
		net localgroup administradores "curso ma¤ana" /add
		WMIC USERACCOUNT WHERE "Name='curso mañana'" SET PasswordExpires=FALSE
		net user "curso tarde" /add
		net localgroup administradores "curso tarde" /add
		WMIC USERACCOUNT WHERE "Name='curso tarde'" SET PasswordExpires=FALSE
	::Cambio de contrase??l usuario tecnicos
		NET USER Tecnicos "d1p4w38"
		NET USER tecnicos "d1p4w38"
		echo FINALIZADO!!!
    echo.
    pause 
    exit

:op2
    echo.
    echo. Limpiando perfiles Curso Mañana
    echo.
        del /S /Q "C:\Users\CURSO MA¥NA"
		del /S /Q "C:\Users\Curso Ma¤ana"
		del /S /Q "C:\Users\curso ma¤ana"
		del /S /Q "C:\Users\curso ma¤anas"
		rd /S /Q "C:\Users\CURSO MA?NA"
		rd /S /Q "C:\Users\Curso Ma¤ana"
		rd /S /Q "C:\Users\curso ma¤anas"
		rd /S /Q "C:\Users\curso ma¤ana"
		net user "CURSO MA¥NA" /delete
		net user "curso ma¤ana" /delete
		net user "Curso Ma¤ana" /delete
		net user "curso ma¤ana" /delete	
		net user "curso ma¤anas" /delete
		net user "curso ma¤ana" /add
		net localgroup administradores "curso ma¤ana" /add
		WMIC USERACCOUNT WHERE "Name='curso ma¤ana'" SET PasswordExpires=FALSE
    echo.
    pause
    exit

:op3
    echo.
    echo. Limpiando perfiles Curso Tarde
    echo.
        del /S /Q "C:\Users\Curso Tarde"
		del /S /Q "C:\Users\CURSO TARDE"
		del /S /Q "C:\Users\curso tardes"
		del /S /Q "C:\Users\curso tarde"
		rd /S /Q "C:\Users\Curso Tarde"
		rd /S /Q "C:\Users\curso tardes"
		rd /S /Q "C:\Users\curso tarde"
		rd /S /Q "C:\Users\CURSO TARDE"
		net user "curso tarde" /delete
		net user "CURSO TARDE" /delete
		net user "Curso Tarde" /delete
		net user "curso tardes" /delete
		net user "curso tarde" /delete
		net user "curso tarde" /add
		net localgroup administradores "curso tarde" /add
		WMIC USERACCOUNT WHERE "Name='curso tarde'" SET PasswordExpires=FALSE
    echo.
    pause
    exit
    
:op4
    echo.
    echo. Crear perfiles Curso Ma¤ana y Curso Tarde
    echo.
        net localgroup administradores "curso ma¤ana" /add
		WMIC USERACCOUNT WHERE "Name='curso ma¤ana'" SET PasswordExpires=FALSE
		net user "curso tarde" /add
		net localgroup administradores "curso tarde" /add
		WMIC USERACCOUNT WHERE "Name='curso tarde'" SET PasswordExpires=FALSE
    echo.
    pause
    exit

:op5
cls
color 0A
    echo.
    echo. Acerca de...
    echo.
    echo. Esta version del Limpiador de perfiles by SABAS 
    echo. se la dedico a todos los Tecnicos informaticos 
:borrar_personalizados
    set /p cantidad=Introduce el numero de perfiles a eliminar:
    for /l %%i in (1,1,!cantidad!) do (
        set /p usuario=Nombre de usuario %%i:
        set /p requiere=Requiere contrasena? (s/n):
        if /I "!requiere!"=="s" (
            set /p clave=Introduce la contrasena para !usuario!:
            net user "!usuario!" "!clave!" /delete
        ) else (
            net user "!usuario!" /delete
        )
        rd /S /Q "C:\Users\!usuario!"
    )
    goto inicio
    echo. de Dipaweb que tanto y tanto me han ense¤ado.	
	echo. Javier	
	echo. Pedro	
	echo. JC	
	echo. Oscar	
	echo. Rober	
	echo. Alex quien me animo y reto hacer este menu...	
	echo.
	echo. Un saludo a todos y disfrutarlo con moderacion.
	echo.
	echo. ...PAZ Y DINERO FACIL...
	echo.
	echo. Juan Antonio Sanchez Plaza a.k.a. SABAS
	echo.
    pause
    goto inicio

:salir
    @cls&exit
