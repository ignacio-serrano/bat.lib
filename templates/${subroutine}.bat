::<?xml version="1.0" encoding="Cp850"?><contenido><![CDATA[
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: SUBRUTINA ®${subroutine}¯
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
::    ®returnVar¯:  Nombre de una variable existente o no a trav‚s de la que se 
::                  devolver  el directorio.
::    ${/parameters details:example}
::
:: DEPENDENCIAS: NINGUNA
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
SETLOCAL
:: ${code}
::
:: ${ENDLOCAL sentence:example}
ENDLOCAL & SET %returnVar%=%return%
:: ${/ENDLOCAL sentence:example}
EXIT /B 0
::]]></contenido>