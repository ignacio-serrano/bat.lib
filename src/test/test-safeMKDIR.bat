::<?xml version="1.0" encoding="cp850"?><contenido><![CDATA[
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: PROGRAMA ®test-safeMKDIR¯
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::    Prueba autom ticamente la subrutina ®safeMKDIR¯.
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
SETLOCAL
IF NOT DEFINED testWorkDir (
	ECHO ERROR: Entorno de tests no inicializado correctamente.
	ENDLOCAL
	EXIT /B 1
)

SET logFile="%testWorkDir%\test-safeMKDIR.log"

:: TEST 1
SETLOCAL
SET testId=1
MKDIR "%testWorkDir%\someDir"
>"%testWorkDir%\someDir\someFile.txt" ECHO Lorem ipsum dolor sit amet, ...

>%logFile% 2>&1 CALL "%mainDir%"\safeMKDIR.bat "%testWorkDir%\someDir"

IF NOT EXIST "%testWorkDir%\someDir\" (
	ECHO %~n0/TEST %testId%: FAILURE
	>>%logFile% ECHO %~n0/TEST %testId%: FAILURE
	ECHO No exite el directorio ®%testWorkDir%\someDir\¯.
	>>%logFile% ECHO No exite el directorio ®%testWorkDir%\someDir\¯.
) ELSE IF EXIST "%testWorkDir%\someDir\someFile.txt" (
	ECHO %~n0/TEST %testId%: FAILURE
	>>%logFile% ECHO %~n0/TEST %testId%: FAILURE
	ECHO El directorio ®%testWorkDir%\someDir\¯ no se borr¢.
	>>%logFile% ECHO El directorio ®%testWorkDir%\someDir\¯ no se borr¢.
) ELSE (
	ECHO %~n0/TEST %testId%: SUCCESS
	>>%logFile% ECHO %~n0/TEST %testId%: SUCCESS
)
ENDLOCAL

ENDLOCAL
EXIT /B 0
::]]></contenido>