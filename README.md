bat.lib
=======

Helpful resources for the development of .BAT scripts.

TODO:
-----
* Develop a logging framework.
* [WONT DO] Desarrollar un preprocesador mínimo para permitir la inclusión estática de
subrutinas.
  * Conseguir que incluya cualquier fichero y no solo `removeFileName.bat`.
    * Probar bpp con algún fichero que incluya el carácter `¬`.
* Combinar este proyecto con el de BAT/lib de X-Projects tools.
  * El contenido de X-Projects tools estará más avanzado.
* [DONE] Desarrollar `stringReplaceByRef`.
* [DONE: Como `stringReplace`] Incorporar `strReplace`.
* [DONE] Incorporar `loadProperties`.
* [DONE] Incorporar `safeMKDIR`.
* [DONE] Escribir tests automáticos para `findOutInstall`.

Project layout
--------------
* `cmd`: Useful executables for development.
* `src`: Here it is where source code lives.
  * `main`: Here it is where code under development used to live. Currently it
            contains code meant to be moved somewhere else.
  * `prototypes`: These are resources ready to copy and paste or demonstrations
                  of how some things can be achieved by means of .BAT scripts.
  * `test`: These used to be automatic tests for stuff in `main`. No longer in
            use but kept as example, just in case I need them in the future.
* `templates`: Copy & paste & edit type of resources, to be used in the
               development of new resources for this lib.
