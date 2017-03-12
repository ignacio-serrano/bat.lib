::<?xml version="1.0" encoding="Cp850"?><contenido><![CDATA[
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: PROGRAM ®${program}¯
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::    ${description}
::
:: USO:
::    ${usage:example}
::    bpp.bat ®["]fichero entrada["]¯ ®[["]fichero salida["]]¯
::    ${/usage:example}
:: Donde...
::    ${parameters details:example}
::    ®["]fichero entrada["]¯:  Ruta absoluta o relativa del fichero de entrada. 
::                              El entrecomillado es opcional si la ruta no 
::                              contiene espacios y obligatorio en caso 
::                              contrario. 
::    ®[["]fichero salida["]]¯: Ruta absoluta o relativa del fichero de salida. 
::                              El entrecomillado es opcional si la ruta no 
::                              contiene espacios y obligatorio en caso 
::                              contrario. Este par metro es OPCIONAL.
::    ${/parameters details:example}
::
:: DEPENDENCIAS: NINGUNA
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@ECHO OFF
SETLOCAL
:::::::::::::::::::::::::::::::::: PREPROCESO ::::::::::::::::::::::::::::::::::
:: Esta variable se utilizar  para gestionar el ERRORLEVEL definitivo del 
:: programa.
SET errLvl=0

CALL :parseParameters %*
IF ERRORLEVEL 1 (
	SET errLvl=1
	GOTO :exit
)

:: ${more preprocess code}

:::::::::::::::::::::::::::::::::::: PROCESO :::::::::::::::::::::::::::::::::::
:: ${main code}

GOTO :exit
:::::::::::::::::::::::::::::::::: POSTPROCESO :::::::::::::::::::::::::::::::::
:exit
:: ${more postprocess code}
EXIT /B %errLvl% & ENDLOCAL

:::::::::::::::::::::::::::::::::: SUBRUTINAS ::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: INICIO: SUBRUTINA ®parseParameters¯
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::    Convierte los par metros pasados al programa en variables que el programa
:: pueda utilizar.
:: 
:: USO: 
::    CALL :parseParameters %*
::
:: DEPENDENCIAS: NINGUNA
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:parseParameters
:: ${parseParameters code:example}
:: Como los par metros pueden contener comillas u otros separadores de cadenas, 
:: no se pueden comparar con la cadena vac¡a. En su lugar, se informa con ellos
:: una variable y si est  queda definida es que se ha pasado algo como par metro.
SET aux=%*
IF NOT DEFINED aux (
	ECHO Debe pasarse un fichero como par metro.
	EXIT /B 1
) ELSE (
	ECHO Parseando par metros recibidos: ®%*¯
)
SET inputFile=%~1
:: ${/parseParameters code:example}

EXIT /B 0
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: FIN: SUBRUTINA ®parseParameters¯
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: BEGINNING: SUBROUTINE ®findOutInstall¯
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::    Computes the absolute path of the .bat passed as parameter. This 
:: subroutine helps identify the installation directory of .bat script which 
:: invokes it.
:: 
:: USAGE: 
::    CALL :findOutInstall "%~0" ®retVar¯
:: WHERE...
::    ®retVar¯: Name of a variable (existent or not) by means of which the 
::              directory will be returned.
::
:: DEPENDENCIES: :removeFileName
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:findoutInstall
SETLOCAL
SET retVar=%2

SET extension=%~x1
:: If the program is invoked without extension, it won't be found in the PATH. 
:: Adds the extension and recursively invokes :findoutInstall.
IF "%extension%" == "" (
	CALL :findOutInstall "%~1.bat" installDir
	GOTO :findOutInstall.end
) ELSE (
	SET installDir=%~$PATH:1
)

IF "%installDir%" EQU "" (
	SET installDir=%~f1
)

CALL :removeFileName "%installDir%" _removeFileName
SET installDir=%_removeFileName%

:findOutInstall.end
ENDLOCAL & SET %retVar%=%installDir%
EXIT /B 0
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: END: SUBROUTINE ®findOutInstall¯
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: INICIO: SUBRUTINA ®removeFileName¯
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::    Elimina el nombre de fichero de una ruta.
::
:: USO: 
::    CALL %lib%\removeFileName ®["]path["]¯ ®retVar¯
:: Donde...
::    ®["]path["]¯: Ruta de la que se desea eliminar el nombre de fichero. Si la
::                  ruta contiene espacios debe ponerse entre comillas, si no, 
::                  es opcional.
::    ®retVar¯:     Nombre de una variable existente o no a trav‚s de la que se 
::                  devolver  el directorio.
::
:: DEPENDENCIAS: NINGUNA
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:removeFileName
SETLOCAL
SET retVar=%2
SET path=%~dp1

PUSHD %path%
SET path=%CD%
POPD

ENDLOCAL & SET %retVar%=%path%
EXIT /B 0
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: FIN: SUBRUTINA ®removeFileName¯
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: INICIO: SUBRUTINA ®safeMKDIR¯
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::    Crea un directorio borr ndolo previemente si ya exist¡a.
:: USO: 
::    CALL :safeMKDIR "®Directorio a crear¯"
:: 
:: Donde...
::    ®Directorio a crear¯: Ruta absoluta o relativa del directorio a crear. El 
::                          entrecomillado es opcional si la ruta no contiene 
::                          espacios y obligatorio en caso contrario.
::
:: DEPENDENCIAS: NINGUNA
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:safeMKDIR
IF EXIST %1 (
	RD /S /Q %1
)
MD %1

EXIT /B 0
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: FIN: SUBRUTINA ®safeMKDIR¯
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: SUBRUTINA ®processLine¯
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::    ${description}
::
:: USO: 
::    ${usage:example}
::    CALL %bat.lib%\removeFileName ®["]path["]¯ ®retVar¯
::    ${/usage:example}
:: Donde...
::    ${parameters details:example}
::    ®["]path["]¯: Ruta de la que se desea eliminar el nombre de fichero. El 
::                  entrecomillado es opcional si la ruta no contiene espacios y 
::                  obligatorio en caso contrario. 
::    ®retVar¯:     Nombre de una variable existente o no a trav‚s de la que se 
::                  devolver  el directorio.
::    ${/parameters details:example}
::
:: DEPENDENCIAS: NINGUNA
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:processLine
SETLOCAL

SET line=%*

:: ${ENDLOCAL sentence:example}
ENDLOCAL & SET %retVar%=%path%
:: ${/ENDLOCAL sentence:example}
EXIT /B 0
::]]></contenido>
