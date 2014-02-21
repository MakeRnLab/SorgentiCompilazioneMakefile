* File Sorgente, Compilazione, Linking, Makefile *


- Contatti -

  	paolondon at gmail dot com
Skype: 	paolovag
Lab:	MakeRn, via Cagni 14, Rimini, Italia


- Un po' di terminologia ed un breve riassunto -

Questo documento spiega le basi dei makefile e dei passaggi da affrontare per passare
dai file sorgente al programma completo e funzionante.
Il codice ( scritto nel linguaggio C ) del progetto serve come esempio.

Un file sorgente è un file di testo puro che contiene un programma sotto forma di
indicazioni scritte in un certo linguaggio di programmazione.

Un progetto è un insieme di file sorgente.

La compilazione è un processo attraverso il quale un opportuno programma (il compilatore)
è in grado di generare un file che il calcolatore può eseguire direttamente
(difficilmente comprensibile e leggibile da parte degli esseri umani) a partire da un file
sorgente (che il programmatore può scrivere e leggere in maniera semplice, dopo un po'
di pratica e studio).

Un file oggetto è il risultato della compilazione di uno o più file sorgente.

Il processo di creazione di un programma eseguibile è praticamente diviso in 2: la
compilazione e il linking. Più file sorgente possono venire compilati singolarmente,
dando luogo a vari file oggetto. I vari file oggetto vengono infine linkati insieme in un
unico programma eseguibile. Riassumendo: files sorgente --> compilazione --> files oggetto
--> linking --> programma eseguibile.


- Le dipendenze -

Un file sorgente può dipendere da uno o più altri file sorgente. Si capisce dunque
che, quando un progetto è composto da vari file sorgente, gestire le dipendenze
diventa un lavoro complicato.


- I makefile -

Se un progetto è dotato di un file chiamato makefile, è sufficiente lanciare il comando
make per ottenere il programma eseguibile finale a partire dai sorgenti del progetto.
(Per programmi più complessi è necessario un altro step, chiamato configure, prima di
lanciare make, ma non verrà discusso in questo riassunto.)

In maniera automatica il programma make va a cercare un file chiamato makefile.

Un makefile è un file di testo che contiene le istruzioni per la compilazione
e il linking di un intero progetto. Contiene le dipendenze dei vari file sorgente (A) da
altri file sorgente (B), in modo che se i (B) sono più recenti dei file oggetto degli (A),
gli (A) verranno ri-compilati. Infatti, se questa situazione si verifica, significa che
dopo la compilazione degli (A), i (B) sono cambiati, perciò, una nuova esecuzione del
comando make nella cartella del progetto, farà sì che vengano ri-compilati non solo i (B),
ma anche gli (A) (in quanto dipendenti dai (B) ). Dopodiché avverrà di nuovo il linking
e si otterrà un nuovo programma eseguibile, contente le modifiche apportate ai (B).
Usando i makefile, tutta questa catena viene automatizzata e si verifica autonomamente
lanciando il comando make.


- Il test -

Per un semplice esempio di quanto scritto, leggi il file chiamato makefile all'interno
di questo progetto, leggi il contenuto di main.c, raddoppia.c e dati.h . Prova a lanciare
make. Ora esegui il programma. Lancia di nuovo make. Ora modifica uno dei sorgenti e poi
lancia di nuovo make: avverrà una nuova compilazione. Puoi infine lanciare di nuovo il
programma e verificare che ora include le modifiche che hai appena inserito nei sorgenti.
