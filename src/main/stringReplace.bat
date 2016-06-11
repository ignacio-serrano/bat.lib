::<?xml version="1.0" encoding="Cp850"?><contenido><![CDATA[
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: SUBRUTINA ®stringReplace¯
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::    Busca texto dentro de una cadena y lo reemplaza por otro.
::
:: USO:
::    CALL :stringReplace ®["]Cadena original["]¯ ®["]Texto a buscar["]¯ ®["]Texto con el que reemplazar["]¯ ®retVar¯
:: Donde...
::    ®["]Cadena original["]¯:             Cadena de texto sobre la que se 
::                                         realizar  la b£squeda y remplazo de 
::                                         texto. El entrecomillado es opcional 
::                                         si la cadena no contiene espacios y 
::                                         obligatorio en caso contrario. 
::    ®["]Texto a buscar["]¯:              Cadena de texto que se buscar  en el
::                                         ®["]Texto a buscar["]¯ y se 
::                                         reemplazar  por el ®["]Texto con el 
::                                         que reemplazar["]¯. El entrecomillado 
::                                         es opcional si la cadena no contiene
::                                         espacios y obligatorio en caso 
::                                         contrario. 
::    ®["]Texto con el que reemplazar["]¯: Cadena de texto con la que se 
::                                         reemplazar  el ®["]Texto a buscar["]¯
::                                         si es encontrado. El entrecomillado 
::                                         es opcional si la cadena no contiene
::                                         espacios y obligatorio en caso 
::                                         contrario. 
::    ®retVar¯:                            Nombre de una variable existente o 
::                                         no a trav‚s de la que se devolver  
::                                         el resultado.
::
:: DEPENDENCIAS: NINGUNA
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
SETLOCAL
SET sourceStr=%~1
SET searchStr=%~2
SET replacementStr=%~3
SET returnVar=%4
CALL SET return=%%sourceStr:%searchStr%=%replacementStr%%%

ENDLOCAL & SET %returnVar%=%return%
EXIT /B 0
::]]></contenido>