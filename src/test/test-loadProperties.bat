::<?xml version="1.0" encoding="cp850"?><contenido><![CDATA[
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: PROGRAMA ®test-loadProperties¯
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::    Prueba autom ticamente la subrutina ®loadProperties¯.
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
SETLOCAL
IF NOT DEFINED testWorkDir (
	ECHO ERROR: Entorno de tests no inicializado correctamente.
	ENDLOCAL
	EXIT /B 1
)

SET logFile="%testWorkDir%\test-loadProperties.log"

:: TEST 1
SETLOCAL
SET testId=1
>"%testWorkDir%\test-loadProperties-%testId%.properties" ECHO simpleProperty=Simple property value
>>"%testWorkDir%\test-loadProperties-%testId%.properties" ECHO nested.propery=Nested property value
>>"%testWorkDir%\test-loadProperties-%testId%.properties" ECHO #disabled.propery=Disabled

>%logFile% 2>&1 CALL "%mainDir%"\loadProperties.bat "%testWorkDir%\test-loadProperties-%testId%.properties" properties

IF NOT DEFINED properties.simpleProperty (
	ECHO %~n0/TEST %testId%: FAILURE
	>>%logFile% ECHO %~n0/TEST %testId%: FAILURE
	ECHO Propiedad ®properties.simpleProperty¯ no cargada.
	>>%logFile% ECHO Propiedad ®properties.simpleProperty¯ no cargada.
) ELSE IF "%properties.simpleProperty%" NEQ "Simple property value" (
	ECHO %~n0/TEST %testId%: FAILURE
	>>%logFile% ECHO %~n0/TEST %testId%: FAILURE
	ECHO Valor de la propiedad ®properties.simpleProperty¯ es ®%properties.simpleProperty%¯.
	>>%logFile% ECHO Valor de la propiedad ®properties.simpleProperty¯ es ®%properties.simpleProperty%¯.
) ELSE IF NOT DEFINED properties.nested.propery (
	ECHO %~n0/TEST %testId%: FAILURE
	>>%logFile% ECHO %~n0/TEST %testId%: FAILURE
	ECHO Propiedad ®properties.nested.propery¯ no cargada.
	>>%logFile% ECHO Propiedad ®properties.nested.propery¯ no cargada.
) ELSE IF "%properties.nested.propery%" NEQ "Nested property value" (
	ECHO %~n0/TEST %testId%: FAILURE
	>>%logFile% ECHO %~n0/TEST %testId%: FAILURE
	ECHO Valor de la propiedad ®properties.nested.propery¯ es ®%properties.simpleProperty%¯.
	>>%logFile% ECHO Valor de la propiedad ®properties.nested.propery¯ es ®%properties.nested.propery%¯.
) ELSE IF DEFINED properties.disabled.propery (
	ECHO %~n0/TEST %testId%: FAILURE
	>>%logFile% ECHO %~n0/TEST %testId%: FAILURE
	ECHO Propiedad ®properties.disabled.propery¯ cargada a pesar de estar comentada.
	>>%logFile% ECHO Propiedad ®properties.disabled.propery¯ cargada a pesar de estar comentada.
) ELSE (
	ECHO %~n0/TEST %testId%: SUCCESS
	>>%logFile% ECHO %~n0/TEST %testId%: SUCCESS
)
ENDLOCAL

ENDLOCAL
EXIT /B 0
::]]></contenido>