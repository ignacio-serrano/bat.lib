::<?xml version="1.0" encoding="cp850"?><contenido><![CDATA[
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: PROGRAMA ®test-${subroutine}¯
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::    Prueba autom ticamente la subrutina ®${subroutine}¯.
::
:: USO:
::    SET testWorkDir=C:\myTestsWorkDir
::    CALL test-${subroutine}.bat
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


SET logFile="%testWorkDir%\test-${subroutine}.log"
>%logFile% ECHO TEST ®${subroutine}¯ results

:: ${test with number:example}
:: TEST 1
SETLOCAL
SET testId=1
>>%logFile% 2>&1 CALL "%mainDir%"\removeFileName.bat "D:\Users\I¤aki\Documents\Mi c¢digo\@github.com\bat.lib\src\main\removeFileName.bat" return

IF "%return%" EQU "D:\Users\I¤aki\Documents\Mi c¢digo\@github.com\bat.lib\src\main" (
	ECHO %~n0/TEST %testId%: SUCCESS
	>>%logFile% ECHO %~n0/TEST %testId%: SUCCESS
) ELSE (
	ECHO %~n0/TEST %testId%: FAILURE
	>>%logFile% ECHO %~n0/TEST %testId%: FAILURE
	ECHO El resultado fu‚ ®%return%¯
	>>%logFile% ECHO El resultado fu‚ ®%return%¯
)
ENDLOCAL
:: ${/test with number:example}

:: ${test with name:example}
:: TEST Absolute path
SETLOCAL
SET testId=Absolute path
>>%logFile% 2>&1 CALL "%mainDir%"\findOutInstall.bat "D:\Users\I¤aki\Documents\Mi c¢digo\@github.com\bat.lib\src\main\findOutInstall.bat" return

IF "%return%" EQU "D:\Users\I¤aki\Documents\Mi c¢digo\@github.com\bat.lib\src\main" (
	ECHO %~n0/TEST %testId%: SUCCESS
	>>%logFile% ECHO %~n0/TEST %testId%: SUCCESS
) ELSE (
	ECHO %~n0/TEST %testId%: FAILURE
	>>%logFile% ECHO %~n0/TEST %testId%: FAILURE
	ECHO El resultado fu‚ ®%return%¯
	>>%logFile% ECHO El resultado fu‚ ®%return%¯
)
ENDLOCAL
:: ${/test with name:example}

ENDLOCAL
EXIT /B 0
::]]></contenido>