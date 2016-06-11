::<?xml version="1.0" encoding="Cp850"?><contenido><[CDATA[
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: PROGRAMA ®bla bla bla¯
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::    Bla bla bla
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
SETLOCAL
CALL :removeFileName "%~0" _removeFileName
ECHO %_removeFileName%
ENDLOCAL
EXIT /B 0
::#include <removeFileName.bat>
::<?xml version="1.0" encoding="Cp850"?><contenido><![CDATA[
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: SUBRUTINA ®removeFileName¯
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::    Elimina el nombre de fichero de una ruta.
:: USO: 
::    CALL %bat.lib%\removeFileName ®["]path["]¯ ®retVar¯
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
SET dirPath=%~dp1

PUSHD %dirPath%
SET dirPath=%CD%
POPD

ENDLOCAL & SET %retVar%=%dirPath%
EXIT /B 0
::]]></contenido>::]]></contenido>
