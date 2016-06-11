::<?xml version="1.0" encoding="cp850"?><contenido><![CDATA[
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: PROGRAMA ®test-stringReplace¯
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::    Prueba autom ticamente la subrutina ®stringReplace¯.
::
:: USO:
::    SET testWorkDir=C:\myTestsWorkDir
::    CALL test-stringReplace.bat
::
:: DEPENDENCIAS: NINGUNA
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


SET logFile="%testWorkDir%\test-stringReplace.log"
>%logFile% ECHO TEST ®stringReplace¯ results

:: TEST 1
SETLOCAL
SET testId=1
>>%logFile% 2>&1 CALL "%mainDir%"\stringReplace.bat "Hola mundo." mundo Pedro return

IF "%return%" EQU "Hola Pedro." (
	ECHO %~n0/TEST %testId%: SUCCESS
	>>%logFile% ECHO %~n0/TEST %testId%: SUCCESS
) ELSE (
	ECHO %~n0/TEST %testId%: FAILURE
	>>%logFile% ECHO %~n0/TEST %testId%: FAILURE
	ECHO El resultado fu‚ ®%result%¯
	>>%logFile% ECHO El resultado fu‚ ®%return%¯
)
ENDLOCAL

:: ${test with name:example}
:: TEST Absolute path
REM SETLOCAL
REM SET testId=Absolute path
REM >>%logFile% 2>&1 CALL "%mainDir%"\findOutInstall.bat "D:\Users\I¤aki\Documents\Mi c¢digo\@github.com\bat.lib\src\main\findOutInstall.bat" result

REM IF "%result%" EQU "D:\Users\I¤aki\Documents\Mi c¢digo\@github.com\bat.lib\src\main" (
REM 	ECHO %~n0/TEST %testId%: SUCCESS
REM 	>>%logFile% ECHO %~n0/TEST %testId%: SUCCESS
REM ) ELSE (
REM 	ECHO %~n0/TEST %testId%: FAILURE
REM 	>>%logFile% ECHO %~n0/TEST %testId%: FAILURE
REM 	ECHO El resultado fu‚ ®%result%¯
REM 	>>%logFile% ECHO El resultado fu‚ ®%result%¯
REM )
REM ENDLOCAL
:: ${/test with name:example}

ENDLOCAL
EXIT /B 0
::]]></contenido>