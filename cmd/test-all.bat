::<?xml version="1.0" encoding="cp850"?><contenido><![CDATA[
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: PROGRAMA ®test-all¯
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::    Prueba autom ticamente todos los componentes de bat.lib.
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@ECHO OFF
SETLOCAL
CALL :findOutInstall "%~0" installDir

SET lib=%installDir%\bat.lib
SET testWorkDir=%installDir%\..\work\test
SET mainDir=%installDir%\..\src\main
SET testDir=%installDir%\..\src\test

CALL :safeMKDIR "%testWorkDir%"
CALL "%testDir%"\test-removeFileName.bat
CALL "%testDir%"\test-findOutInstall.bat

ENDLOCAL
EXIT /B 0

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