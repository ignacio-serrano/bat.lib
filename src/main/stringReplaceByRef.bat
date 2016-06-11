::<?xml version="1.0" encoding="Cp850"?><contenido><![CDATA[
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: SUBRUTINA ®stringReplaceByRef¯
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::    Busca texto dentro de una cadena y lo reemplaza por otro.
::
:: USO:
::    CALL %bat.lib%\stringReplace ®sourceString¯ ®searchString¯ ®replacementString¯ ®returnVar¯
:: Donde...
::    ®sourceString¯:      Nombre de la variable que contenga la cadena de texto 
::                         sobre la que se realizar  la b£squeda y remplazo de 
::                         texto.
::    ®searchString¯:      Nombre de la variable que contenga la cadena de texto 
::                         que se buscar  en ®sourceString¯ y se reemplazar  por 
::                         el contenido de ®replacementString¯.
::    ®replacementString¯: Nombre de la variable que contenga la cadena de texto 
::                         con la que se reemplazar  ®searchString¯ si es 
::                         encontrada.
::    ®returnVar¯:         Nombre de una variable existente o no a trav‚s de la 
::                         que se devolver  el resultado.
::
:: DEPENDENCIAS: NINGUNA
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
SETLOCAL
:: Guarda los nombres de las variables en variables "*Var".
SET sourceVar=%1
SET searchVar=%2
SET replacementVar=%3
SET returnVar=%4

:: Guarda un éNICO s¡mbolo de % en la variable "_".
SET _=%%%

:: Al ejecutarse CALL, se produce una primera expasi¢n de las expresiones entre
:: porcentajes, quedando SET sourceStr=%foo%. Al ejecutarse SET la variable
:: "*Str" queda informada con el valor de la variable apuntada por "*Var".
CALL SET sourceStr=%_%%sourceVar%%_%
CALL SET searchStr=%_%%searchVar%%_%
CALL SET replacementStr=%_%%replacementVar%%_%

CALL SET return=%%sourceStr:%searchStr%=%replacementStr%%%

ENDLOCAL & SET %returnVar%=%return%
EXIT /B 0
::]]></contenido>