# Compiladores2018
Repositorio del proyecto de compiladores 2018

El archivo ejecutable es "minic.jar"
Al correr el archivo se mostraran dos cajas de texto, la primera caja de texto viendolo de arriba para abajo es en donde se se puede
colocar la dirección de un archivo para ver si es parte del lenguaje minic. 

Errores:
Si encuentra un comentario sin terminar, mostrara error y dejara de leer el archivo despues de ese inicio de comentario, 
ya que todo el resto se puede considerar como un comentario

Si encuentra una cadena sin cerrar (ejemplo: "hola) se mostrara un error que indica que no se ha reconocido el caracter '"', lo omitira y seguira leyendo

Si encuentra un identificador con mas de 31 caracteres, eliminara todos los carecteres despues de 31 caracteres y ya. Mostrara que es un ID truncado. 
