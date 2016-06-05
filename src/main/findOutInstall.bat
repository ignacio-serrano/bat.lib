::<?xml version="1.0" encoding="cp850"?>
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: SUBRUTINA ®findOutInstall¯
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
:: DEPENDENCIAS: %lib%\removeFileName
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
SETLOCAL
SET retVar=%2

SET installDir=%~$PATH:1
IF "%installDir%" EQU "" (
	SET installDir=%~f1
)

CALL %lib%\removeFileName "%installDir%" _removeFileName
SET installDir=%_removeFileName%

ENDLOCAL & SET %retVar%=%installDir%
EXIT /B 0
::]]></contenido>