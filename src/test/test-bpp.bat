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

:: TEST No parameters
SETLOCAL
SET testId=No parameters
>>%logFile% >>"%testDir%\%testId%.output" 2>&1 CALL "%mainDir%\bpp.bat"
SET testErrLvl=%ERRORLEVEL%
IF %testErrLvl% LEQ 0 (
	ECHO %~n0/TEST %testId%: FAILURE
	>>%logFile% ECHO %~n0/TEST %testId%: FAILURE
	ECHO El ERRORLEVEL fu‚ ®%testErrLvl%¯. Se esperaba mayor que 0.
	>>%logFile% ECHO El ERRORLEVEL fu‚ ®%testErrLvl%¯. Se esperaba mayor que 0.
	GOTO :endTest
)
FOR /F "delims=ª eol=ª tokens=1 usebackq" %%i IN ("%testDir%\%testId%.output") DO (
	SET return=%%i
)

SET expectedReturn=Debe pasarse un fichero como par metro.
IF "%return%" EQU "%expectedReturn%" (
	ECHO %~n0/TEST %testId%: SUCCESS
	>>%logFile% ECHO %~n0/TEST %testId%: SUCCESS
) ELSE (
	ECHO %~n0/TEST %testId%: FAILURE
	>>%logFile% ECHO %~n0/TEST %testId%: FAILURE
	ECHO El resultado fu‚ ®%return%¯. Se esperaba ®%expectedReturn%¯.
	>>%logFile% ECHO El resultado fu‚ ®%return%¯. Se esperaba ®%expectedReturn%¯.
)
:endTest
ENDLOCAL

:: TEST Non existing input file
SETLOCAL
SET testId=Non existing input file
>>%logFile% >>"%testDir%\%testId%.output" 2>&1 CALL "%mainDir%\bpp.bat" C:\non-existing-file.bat
SET testErrLvl=%ERRORLEVEL%
IF %testErrLvl% LEQ 0 (
	ECHO %~n0/TEST %testId%: FAILURE
	>>%logFile% ECHO %~n0/TEST %testId%: FAILURE
	ECHO El ERRORLEVEL fu‚ ®%testErrLvl%¯. Se esperaba mayor que 0.
	>>%logFile% ECHO El ERRORLEVEL fu‚ ®%testErrLvl%¯. Se esperaba mayor que 0.
	GOTO :endTest
)
FOR /F "delims=ª eol=ª tokens=1 usebackq" %%i IN ("%testDir%\%testId%.output") DO (
	SET return=%%i
)

SET expectedReturn=El fichero especificado ®C:\non-existing-file.bat¯ no existe.
IF "%return%" EQU "%expectedReturn%" (
	ECHO %~n0/TEST %testId%: SUCCESS
	>>%logFile% ECHO %~n0/TEST %testId%: SUCCESS
) ELSE (
	ECHO %~n0/TEST %testId%: FAILURE
	>>%logFile% ECHO %~n0/TEST %testId%: FAILURE
	ECHO El resultado fu‚ ®%return%¯. Se esperaba ®%expectedReturn%¯.
	>>%logFile% ECHO El resultado fu‚ ®%return%¯. Se esperaba ®%expectedReturn%¯.
)
:endTest
ENDLOCAL

:: TEST tl-removeFileName.bat
SETLOCAL
SET testId=tl-removeFileName.bat
>>%logFile% 2>&1 CALL "%mainDir%\bpp.bat" "%testDir%\use-case\tl-removeFileName.bat"
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