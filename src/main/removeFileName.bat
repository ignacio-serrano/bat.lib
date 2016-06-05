::<?xml version="1.0" encoding="Cp850"?><contenido><![CDATA[
:: TODO: Probar
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
SETLOCAL
SET retVar=%2
SET path=%~dp1

PUSHD %path%
SET path=%CD%
POPD

ENDLOCAL & SET %retVar%=%path%
EXIT /B 0
::]]></contenido>