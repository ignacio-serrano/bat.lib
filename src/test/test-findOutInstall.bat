::<?xml version="1.0" encoding="cp850"?><contenido><![CDATA[
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: PROGRAMA ®test-findOutInstall¯
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::    Prueba autom ticamente la subrutina ®findOutInstall¯.
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
SETLOCAL
IF NOT DEFINED testWorkDir (
	ECHO ERROR: Entorno de tests no inicializado correctamente.
	ENDLOCAL
	EXIT /B 1
)

SET logFile="%testWorkDir%\test-findOutInstall.log"

:: findOutInstall depende de removeFileName por lo que la variable %bat.lib% debe
:: est r inicializada.
SET bat.lib="%mainDir%"

:: TEST Absolute path
SETLOCAL
SET testId=Absolute path
>%logFile% 2>&1 CALL "%mainDir%"\findOutInstall.bat "D:\Users\I¤aki\Documents\Mi c¢digo\@github.com\bat.lib\src\main\findOutInstall.bat" result

IF "%result%" EQU "D:\Users\I¤aki\Documents\Mi c¢digo\@github.com\bat.lib\src\main" (
	ECHO %~n0/TEST %testId%: SUCCESS
	>>%logFile% ECHO %~n0/TEST %testId%: SUCCESS
) ELSE (
	ECHO %~n0/TEST %testId%: FAILURE
	>>%logFile% ECHO %~n0/TEST %testId%: FAILURE
	ECHO El resultado fu‚ ®%result%¯
	>>%logFile% ECHO El resultado fu‚ ®%result%¯
)
ENDLOCAL

:: TEST Relative path
SETLOCAL
SET testId=Relative path

PUSHD D:\Users\I¤aki\Documents\Mi c¢digo\@github.com\bat.lib\src
>>%logFile% 2>>&1 CALL "%mainDir%"\findOutInstall.bat "main\findOutInstall.bat" result

IF "%result%" EQU "D:\Users\I¤aki\Documents\Mi c¢digo\@github.com\bat.lib\src\main" (
	ECHO %~n0/TEST %testId%: SUCCESS
	>>%logFile% ECHO %~n0/TEST %testId%: SUCCESS
) ELSE (
	ECHO %~n0/TEST %testId%: FAILURE
	>>%logFile% ECHO %~n0/TEST %testId%: FAILURE
	ECHO El resultado fu‚ ®%result%¯
	>>%logFile% ECHO El resultado fu‚ ®%result%¯
)

POPD
ENDLOCAL

:: TEST PATH install
SETLOCAL
SET testId=PATH install
SET PATH=%PATH%;D:\Users\I¤aki\Documents\Mi c¢digo\@github.com\bat.lib\src\main\

>>%logFile% 2>>&1 CALL "%mainDir%"\findOutInstall.bat findOutInstall.bat result

IF "%result%" EQU "D:\Users\I¤aki\Documents\Mi c¢digo\@github.com\bat.lib\src\main" (
	ECHO %~n0/TEST %testId%: SUCCESS
	>>%logFile% ECHO %~n0/TEST %testId%: SUCCESS
) ELSE (
	ECHO %~n0/TEST %testId%: FAILURE
	>>%logFile% ECHO %~n0/TEST %testId%: FAILURE
	ECHO El resultado fu‚ ®%result%¯
	>>%logFile% ECHO El resultado fu‚ ®%result%¯
)
ENDLOCAL

ENDLOCAL
EXIT /B 0
::]]></contenido>