::<?xml version="1.0" encoding="cp850"?><contenido><![CDATA[
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: PROGRAMA ®test-bpp¯
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::    Prueba autom ticamente el programa ®bpp¯.
::
:: USO:
::    SET testWorkDir=C:\myTestsWorkDir
::    CALL test-bpp.bat
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


SET logFile="%testWorkDir%\test-bpp.log"
>%logFile% ECHO TEST ®bpp¯ results

:: ${test with number:example}
:: TEST 1
REM SETLOCAL
REM SET testId=1
REM >>%logFile% 2>&1 CALL "%mainDir%"\removeFileName.bat "D:\Users\I¤aki\Documents\Mi c¢digo\@github.com\bat.lib\src\main\removeFileName.bat" return
REM 
REM IF "%return%" EQU "D:\Users\I¤aki\Documents\Mi c¢digo\@github.com\bat.lib\src\main" (
REM 	ECHO %~n0/TEST %testId%: SUCCESS
REM 	>>%logFile% ECHO %~n0/TEST %testId%: SUCCESS
REM ) ELSE (
REM 	ECHO %~n0/TEST %testId%: FAILURE
REM 	>>%logFile% ECHO %~n0/TEST %testId%: FAILURE
REM 	ECHO El resultado fu‚ ®%return%¯
REM 	>>%logFile% ECHO El resultado fu‚ ®%return%¯
REM )
REM ENDLOCAL
:: ${/test with number:example}

:: TEST tl-removeFileName.bat
SETLOCAL
SET testId=tl-removeFileName.bat
>>%logFile% 2>&1 CALL "%mainDir%"\bpp.bat "%testDir%\use-case\tl-removeFileName.bat"
>"%testDir%\use-case\tl-removeFileName.bat.bat.output" 2>&1 CALL "%installDir%\%testDir%\use-case\tl-removeFileName.bat.bat"
FOR /F "delims=ª eol=ª tokens=1 usebackq" %%i IN ("%testDir%\use-case\tl-removeFileName.bat.bat.output") DO (
	SET return=%%i
)

SET expectedReturn=D:\Users\I¤aki\Documents\Mi c¢digo\@github.com\bat.lib\src\test\use-case
IF "%return%" EQU "%expectedReturn%" (
	ECHO %~n0/TEST %testId%: SUCCESS
	>>%logFile% ECHO %~n0/TEST %testId%: SUCCESS
) ELSE (
	ECHO %~n0/TEST %testId%: FAILURE
	>>%logFile% ECHO %~n0/TEST %testId%: FAILURE
	ECHO El resultado fu‚ ®%return%¯. Se esperaba ®%expectedReturn%¯.
	>>%logFile% ECHO El resultado fu‚ ®%return%¯. Se esperaba ®%expectedReturn%¯.
)
ENDLOCAL

ENDLOCAL
EXIT /B 0
::]]></contenido>