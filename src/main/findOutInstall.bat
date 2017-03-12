::<?xml version="1.0" encoding="Cp850"?><contenido><![CDATA[
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: BEGINNING: SUBROUTINE ®findOutInstall¯
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::    Computes the absolute path of the .bat passed as parameter. This 
:: subroutine helps identify the installation directory of .bat script which 
:: invokes it.
:: 
:: USAGE: 
::    CALL :findOutInstall "%~0" ®retVar¯
:: WHERE...
::    ®retVar¯: Name of a variable (existent or not) by means of which the 
::              directory will be returned.
::
:: DEPENDENCIES: :removeFileName
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:findoutInstall
SETLOCAL
SET retVar=%2

SET extension=%~x1
:: If the program is invoked without extension, it won't be found in the PATH. 
:: Adds the extension and recursively invokes :findoutInstall.
IF "%extension%" == "" (
	CALL :findOutInstall "%~1.bat" installDir
	GOTO :findOutInstall.end
) ELSE (
	SET installDir=%~$PATH:1
)

IF "%installDir%" EQU "" (
	SET installDir=%~f1
)

CALL :removeFileName "%installDir%" _removeFileName
SET installDir=%_removeFileName%

:findOutInstall.end
ENDLOCAL & SET %retVar%=%installDir%
EXIT /B 0
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: END: SUBROUTINE ®findOutInstall¯
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

::]]></contenido>