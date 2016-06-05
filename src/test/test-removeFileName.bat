::<?xml version="1.0" encoding="cp850"?><contenido><![CDATA[
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: PROGRAMA ®test-removeFileName¯
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::    Prueba autom ticamente la subrutina ®removeFileName¯.
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
SETLOCAL
IF NOT DEFINED testWorkDir (
	ECHO ERROR: Entorno de tests no inicializado correctamente.
	ENDLOCAL
	EXIT /B 1
)

SET logFile="%testWorkDir%\test-removeFileName.log"

:: TEST 1
SET testId=1
>%logFile% 2>&1 CALL "%mainDir%"\removeFileName.bat "D:\Users\I¤aki\Documents\Mi c¢digo\@github.com\bat.lib\src\main\removeFileName.bat" result

IF "%result%" EQU "D:\Users\I¤aki\Documents\Mi c¢digo\@github.com\bat.lib\src\main" (
	ECHO %~n0/TEST %testId%: SUCCESS
	>>%logFile% ECHO %~n0/TEST %testId%: SUCCESS
) ELSE (
	ECHO %~n0/TEST %testId%: FAILURE
	>>%logFile% ECHO %~n0/TEST %testId%: FAILURE
	ECHO El resultado fu‚ ®%result%¯
	>>%logFile% ECHO El resultado fu‚ ®%result%¯
)

:: TEST 2
SET testId=2
>>%logFile% 2>>&1 CALL "%mainDir%"\removeFileName.bat "C:\Windows\System32\cmd.exe" result

IF "%result%" EQU "C:\Windows\System32" (
	ECHO %~n0/TEST %testId%: SUCCESS
	>>%logFile% ECHO %~n0/TEST %testId%: SUCCESS
) ELSE (
	ECHO %~n0/TEST %testId%: FAILURE
	>>%logFile% ECHO %~n0/TEST %testId%: FAILURE
	ECHO El resultado fu‚ ®%result%¯
	>>%logFile% ECHO El resultado fu‚ ®%result%¯
)

ENDLOCAL
EXIT /B 0
::]]></contenido>