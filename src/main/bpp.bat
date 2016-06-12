::<?xml version="1.0" encoding="Cp850"?><contenido><![CDATA[
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: PROGRAMA ®bpp¯
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::    Batch Preprocessor
::    Procesa un fichero .bat procesando directivas como #include o #define
::
:: USO:
::    bpp.bat ®["]fichero entrada["]¯ ®[["]fichero salida["]]¯
:: Donde...
::    ®["]fichero entrada["]¯:  Ruta absoluta o relativa del fichero de salida. 
::                              El entrecomillado es opcional si la ruta no 
::                              contiene espacios y obligatorio en caso 
::                              contrario. 
::    ®[["]fichero salida["]]¯: Ruta absoluta o relativa del fichero de salida. 
::                              El entrecomillado es opcional si la ruta no 
::                              contiene espacios y obligatorio en caso 
::                              contrario. Este par metro es OPCIONAL.
::
:: DEPENDENCIAS: :findOutInstall :loadProperties
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@ECHO OFF
SETLOCAL EnableDelayedExpansion
:::::::::::::::::::::::::::::::::: PREPROCESO ::::::::::::::::::::::::::::::::::
:: Esta variable se utilizar  para gestionar el ERRORLEVEL definitivo del 
:: programa.
SET errLvl=0

CALL :parseParameters %*
IF ERRORLEVEL 1 (
	SET errLvl=1
	GOTO :exit
)

ECHO [DEBUG]: inputFile=%inputFile%
ECHO [DEBUG]: outputFile=%outputFile%

CALL :findOutInstall "%~0" installDir
ECHO [DEBUG]: installDir=%installDir%
CALL :loadProperties "%installDir%\bpp.properties" properties
ECHO [DEBUG]: properties.bat.lib=%properties.bat.lib%
SET bat.lib=%properties.bat.lib%

IF EXIST "%outputFile%" (
	DEL "%outputFile%"
)
:::::::::::::::::::::::::::::::::::: PROCESO :::::::::::::::::::::::::::::::::::
FOR /F "delims=ª eol=ª tokens=1 usebackq" %%i IN ("%inputFile%") DO (
	SET lineIn=%%i
	CALL :processLine lineIn
)

GOTO :exit

:::::::::::::::::::::::::::::::::: POSTPROCESO :::::::::::::::::::::::::::::::::
:exit
EXIT /B %errLvl% & ENDLOCAL

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: INICIO: SUBRUTINA ®parseParameters¯
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::    Convierte los par metros pasados al programa en variables que el programa
:: pueda utilizar.
:: 
:: USO: 
::    CALL :parseParameters %*
::
:: DEPENDENCIAS: removeFileName (bueno, en realidad ninguna pero las habr )
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:parseParameters
:: Como los par metros pueden contener comillas u otros separadores de cadenas, 
:: no se pueden comparar con la cadena vac¡a. En su lugar, se informa con ellos
:: una variable y si est  queda definida es que se ha pasado algo como par metro.
SET aux=%*
IF NOT DEFINED aux (
	ECHO Debe pasarse un fichero como par metro.
	EXIT /B 1
) ELSE (
	ECHO [DEBUG]: Parseando par metros recibidos: ®%*¯
)
SET inputFile=%~1
SET outputFile=%~2
IF NOT DEFINED outputFile (
	SET outputFile=%inputFile%.bat
)

:: Valida que el fichero de entrada exista.
IF NOT EXIST "%inputFile%" (
	ECHO El fichero especificado ®%inputFile%¯ no existe.
	EXIT /B 2
)
:: NOTA: Habr  m s par metros en el futuro. Ver :parseNextParameter en dapro.bat
:: para m s detalles sobre c¢mo implementarlos.

EXIT /B 0
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: FIN: SUBRUTINA ®parseParameters¯
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: INICIO: SUBRUTINA ®processLine¯
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::    Procesa una de las l¡neas del fichero procesado.
:: 
:: USO: 
::    CALL :parseParameters %*
::
:: DEPENDENCIAS: removeFileName (bueno, en realidad ninguna pero las habr )
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:processLine
:: EnableDelayedExpansion hace que las expansiones de variables se realicen al 
:: ejecutar los comandos y no al parsearlo. Esto evita un mont¢n de problemas al 
:: manipular el contenido de ficheros que contienen car cteres especiales en 
:: .BAT como <, > o ^. Pr cticamente elimina la necesidad de escaparlos.
SETLOCAL EnableDelayedExpansion
ECHO [DEBUG]:processLine: ¨?
SET lineVar=%1
SET returnVar=%2
SET line=!%lineVar%!

SET aux=!line:#include=!
IF "%line%" NEQ "%aux%" (
	ECHO Found !line!
	
	FOR /F "usebackq eol=ª tokens=2 delims=<>" %%i IN ('!line!') DO (
		ECHO %%i
	)
	
	>>"%outputFile%" ECHO ::!line!
	>>"%outputFile%" TYPE "%bat.lib%\removeFileName.bat"
) ELSE (
	>>"%outputFile%" ECHO !line!
)
ENDLOCAL
EXIT /B 0
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: FIN: SUBRUTINA ®processLine¯
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: INICIO: SUBRUTINA ®findOutInstall¯
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::    Obtiene la ruta absoluta del .bat pasado como par metro. Esta subrutina 
:: ayuda a identificar el directorio de instalaci¢n del script .bat que la 
:: invoca.
:: USO: 
::    CALL :findOutInstall "%~0" ®retVar¯
:: Donde...
::    ®retVar¯: Nombre de una variable existente o no a trav‚s de la que se 
::              devolver  el directorio.
::
:: DEPENDENCIAS: removeFileName
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:findoutInstall
ECHO [DEBUG]:findoutInstall: %%*=®%*¯
SETLOCAL
SET retVar=%2

SET installDir=%~$PATH:1
IF "%installDir%" EQU "" (
	SET installDir=%~f1
)

CALL :removeFileName "%installDir%" _removeFileName
SET installDir=%_removeFileName%

ENDLOCAL & SET %retVar%=%installDir%
EXIT /B 0
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: FIN: SUBRUTINA ®findOutInstall¯
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: INICIO: SUBRUTINA ®removeFileName¯
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::    Elimina el nombre de fichero de una ruta.
:: USO: 
::    CALL %lib%\removeFileName ®["]path["]¯ ®retVar¯
:: Donde...
::    ®["]path["]¯: Ruta de la que se desea eliminar el nombre de fichero. Si la
::                  ruta contiene espacios debe ponerse entre comillas, si no, 
::                  es opcional.
::    ®retVar¯:     Nombre de una variable existente o no a trav‚s de la que se 
::                  devolver  el directorio.
::
:: DEPENDENCIAS: NINGUNA
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:removeFileName
SETLOCAL
SET retVar=%2
SET path=%~dp1

PUSHD %path%
SET path=%CD%
POPD

ENDLOCAL & SET %retVar%=%path%
EXIT /B 0
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: FIN: SUBRUTINA ®removeFileName¯
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: INICIO: SUBRUTINA ®loadProperties¯
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::    Lee un fichero de propiedades y lo carga en variables de entorno.
::
:: USO:
::	  CALL :loadProperties "®Ruta al fichero de propiedades¯" [®prefijo¯]
:: Donde...
::    ®Ruta al fichero de propiedades¯: Ruta absoluta o relativa del fichero de 
::                                      propiedades a leer.
::    ®prefijo¯:                        Prefijo con el que se crear n las 
::                                      variables de entorno. De no especificarse
::                                      se crear n sin prefijo
::
:: DEPENDENCIAS: NINGUNA
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:loadProperties
FOR /F "usebackq eol=# tokens=1 delims=ª" %%i IN ("%~1") DO (
	IF "%2" EQU "" (
		SET %%i
	) ELSE (
		SET %2.%%i
	)
)

EXIT /B 0
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: FIN: SUBRUTINA ®loadProperties¯
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

REM Dead code

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: INICIO: SUBRUTINA ®safeMKDIR¯
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::    Crea un directorio borr ndolo previemente si ya exist¡a.
:: USO: 
::    CALL :safeMKDIR "®Directorio a crear¯"
:: Donde...
::    ®Directorio a crear¯: Ruta absoluta o relativa del directorio a crear. El 
::                          entrecomillado es opcional si la ruta no contiene 
::                          espacios y obligatorio en caso contrario.
::
:: DEPENDENCIAS: NINGUNA
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:safeMKDIR
IF EXIST %1 (
	RD /S /Q %1
)
MD %1

EXIT /B 0
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: FIN: SUBRUTINA ®safeMKDIR¯
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::]]></contenido>