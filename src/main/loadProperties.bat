::<?xml version="1.0" encoding="Cp850"?><contenido><![CDATA[
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: SUBRUTINA ®loadProperties¯
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::    Lee un fichero de propiedades y lo carga en variables de entorno.
:: USO:
::	  CALL %bat.lib%\loadProperties "®Ruta al fichero de propiedades¯" [®prefijo¯]
:: Donde...
::    ®Ruta al fichero de propiedades¯: Ruta absoluta o relativa del fichero de 
::                                      propiedades a leer.
::    ®prefijo¯:                        Prefijo con el que se crear n las 
::                                      variables de entorno. De no especificarse
::                                      se crear n sin prefijo
:: DEPENDENCIAS: NINGUNA
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO loadProperties
FOR /F "usebackq eol=# tokens=1 delims=ª" %%i IN ("%~1") DO (
	IF "%2" EQU "" (
		SET %%i
	) ELSE (
		SET %2.%%i
	)
)

EXIT /B 0
::]]></contenido>