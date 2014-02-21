# Esempio di makefile #
# La funzione main chiama la funzione raddoppia
# passandole un numero intero da raddoppiare.
# Poi il numero raddoppiato viene stampato a schermo.

# E' sufficiente chiamare il comando make da shell.
# Tutte le compilazioni e linkaggi necessari verranno
# eseguiti in automatico.

# Terminologia dei makefile: #
# target : prerequisites
#		recipes

# Il target è il risultato delle recipes.
# Dipende dai prerequisites.
# Se i prerequisites sono più recenti del target,
# le recipes vengono eseguite.
# Se un prerequisite è un file sorgente, se esso è più
# recente del target, il sorgente viene ricompilato.
# Se un prerequisite è un file header, se esso è più
# recente del target, il sorgente viene ricompilato.

###### contenuto del makefile ######

# La lista dei file oggetto
objects = raddoppia.o main.o

# il default goal
# questo linka solo, non compila!
mioProg : $(objects)
	gcc -o mioProg $(objects)

# cosa fare per ottenere il target raddoppia.o
# n.b. il file viene solo compilato
raddoppia.o : raddoppia.c dati.h # da chi dipende raddoppia.o
	gcc -c raddoppia.c

# cosa fare per ottenere main.o
# n.b. il file viene solo compilato
main.o : main.c
	gcc -c main.c

# cosa fare quando 'make clean' viene chiamato
# è un phony target perché non si riferisce a files
clean :
	rm mioProg $(objects)
