::<?xml version="1.0" encoding="cp850"?><contenido><![CDATA[
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: PROGRAMA ®test-stringReplaceByRefByRef¯
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::    Prueba autom ticamente la subrutina ®stringReplaceByRefByRef¯¯.
::
:: USO:
::    SET testWorkDir=C:\myTestsWorkDir
::    CALL test-stringReplaceByRef.bat
::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
SETLOCAL
IF NOT DEFINED testWorkDir (
	ECHO ERROR: Entorno de tests no inicializado correctamente.
	ENDLOCAL
	EXIT /B 1
)
IF NOT DEFINED mainDir (
	ECHO ERROR: Entorno de tests no inicializado correctamente.
	ENDLOCAL
	EXIT /B 1
)
IF NOT DEFINED lib (
	ECHO ERROR: Entorno de tests no inicializado correctamente.
	ENDLOCAL
	EXIT /B 1
)



SET logFile="%testWorkDir%\test-stringReplaceByRef.log"
>%logFile% ECHO TEST ®stringReplaceByRef¯ results

:: TEST Simple
SETLOCAL
SET testId=Simple

SET sourceString=Hola mundo.
SET searchString=mundo
SET replacementString=Pedro
SET expectedReturn=Hola Pedro.
>>%logFile% 2>&1 CALL "%mainDir%"\stringReplaceByRef.bat sourceString searchString replacementString return

IF "%return%" EQU "%expectedReturn%" (
	ECHO %~n0/TEST %testId%: SUCCESS
	>>%logFile% ECHO %~n0/TEST %testId%: SUCCESS
) ELSE (
	ECHO %~n0/TEST %testId%: FAILURE
	>>%logFile% ECHO %~n0/TEST %testId%: FAILURE
	ECHO El resultado fu‚ ®%result%¯
	>>%logFile% ECHO El resultado fu‚ ®%return%¯. Se esperaba ®%expectedReturn%¯.
)
ENDLOCAL

:: TEST With double quotes
SETLOCAL
SET testId=With double quotes

SET sourceString="Hola mundo."
SET searchString=mundo
SET replacementString=Pedro
SET expectedReturn="Hola Pedro."
>>%logFile% 2>&1 CALL "%mainDir%"\stringReplaceByRef.bat sourceString searchString replacementString return

:: Al poder haber comillas en las variables la comparaci¢n se hace tras sustituirlas por ù
IF "%return:"=ù%" EQU "%expectedReturn:"=ù%" (
	ECHO %~n0/TEST %testId%: SUCCESS
	>>%logFile% ECHO %~n0/TEST %testId%: SUCCESS
) ELSE (
	ECHO %~n0/TEST %testId%: FAILURE
	>>%logFile% ECHO %~n0/TEST %testId%: FAILURE
	ECHO El resultado fu‚ ®%result%¯
	>>%logFile% ECHO El resultado fu‚ ®%return%¯. Se esperaba ®%expectedReturn%¯.
)
ENDLOCAL

ENDLOCAL
EXIT /B 0
::]]></contenido>