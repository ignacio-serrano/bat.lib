::<?xml version="1.0" encoding="Cp850"?><contenido><![CDATA[
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: PROGRAMA ®bla bla bla¯
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::    Bla bla bla
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@ECHO OFF
SETLOCAL
ECHO %0
CALL :removeFileName "%0" _removeFileName
ECHO %_removeFileName%
ENDLOCAL
EXIT /B 0
#include <removeFileName.bat>
::]]></contenido>
