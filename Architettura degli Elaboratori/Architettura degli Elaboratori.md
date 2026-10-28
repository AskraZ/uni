
Libro: [Introduzione all'architettura dei calcolatori](https://mega.nz/folder/qhBy0IzY#TqPKZbmW05D6HCURQkTsiA/file/qxoDzbjQ)

# INTRODUZIONE

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#introduzione)

un'algoritmo è una serie di istruzioni ben definite, codificate in un linguaggio x che mira al risolvere un dato problema. Con "Architettura del calcolatore" intendiamo l'insieme della unità principali che compongono il calcolatore e come interagiscono tra di esse. Le funzioni base di un calcolatore possono essere suddivise in:

- Memorizzare dei dati
- Elaborare dei dati
- Trasferire dei dati
- Controllo

## IL PROCESSORE

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#il-processore)

Il processore è costituito da 4 parti fondamentali:

- Il **Program Counter**, che è una locazione di memoria contenente l'indirizzo dell'istruzione da eseguire.
- Il **Registro delle Istruzioni**, che è una locazione di memoria contenente l'istruzione da eseguire.
- **L'unità logico-aritmetica**, che fa i calcoli.
- **L'unità di controllo**, decodifica l'operation code e genera segnali di controllo.

## La Memoria Centrale

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#la-memoria-centrale)

La memoria si suddivide in due categorie:

- Volatile
- Non Volatile

La memoria volatile è un tipo di memoria che "perde" i dati quando il calcolatore viene spento, ed anch'essa si suddivide in due componenti:

- RAM (Random access memory), che immagazzina i programmi in esecuzione.
- CACHE, che immagazzina i dati più utilizzati per tenerli pronti al momento di riutilizzarli. La memoria non volatile è la ROM (Read only Memory), che immagazzina i dati a lungo termine, anche a spegnimento del calcolatore.

## MACCHINA DI VON NEUMANN

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#macchina-di-von-neumann)

La macchina di Von Neumann è un concetto diverso rispetto alla MdT, infatti si focalizza sul concetto "pratico" della risoluzione di un algoritmo, essa infatti è composta da:

- CPU
- MEMORIA
- BUS
- I/O
- MEMORIA DI MASSA

> A livello teorico, è una terna di {N, IS, P}:
> 
> - N = 0,1,2,3..., è l'insieme dei numeri naturali (rappresenta l'alfabeto della macchina).
> - IS = ZERO,INC,SOM,SOT,MOL, è l'istruction set, ovvero l'insieme delle istruzioni generiche della macchina.
> - P =  ${I_0, I_1, I_2, I_3,...,I_p}$ , è una sequenza finita e non vuota di istruzioni prese da IS, con valori specifici della variabili, andando a comporre un programma.

## Layer fondamentali

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#layer-fondamentali)

L'architettura è un "contratto tra hardware e software" (se l'architettura è 32bit/64bit, il sistema operativo o le applicazioni devo corrispondere alla versione dell'architettura). l'implementazione riguarda invece come l'architettura viene realizzata fisicamente. l'informatica è suddivisa in 3 layer fondamentali:

- APPLICAZIONI
- SISTEMA OPERATIVO
- HARDWARE L'architettura di von neumann è tutt'oggi il fondamento architetturale. il bottleneck di von neumann è un effetto causato dalla differenza di banda tra CPU e memoria, come se la latenza della memoria facesse da "tappo" alla cpu.

## LA PIPELINE

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#la-pipeline)

la pipeline è la catena di distribuzione:

> FETCH (recupero dell'istruzione della memoria) DECODE (decodifica e interpreta l'istruzione) EXECUTE (escuzione dell'operazione) MEMORY (accesso alla memoria) WRITEBACK (salva nei registri)

## Hazard

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#hazard)

Quando più istruzioni vengono eseguite in parallelo, possono verificarsi **hazard**, cioè conflitti che impediscono l’esecuzione simultanea corretta.

### Tipologie principali

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#tipologie-principali)

- **Data Hazard** → un’istruzione dipende dal risultato di un’altra non ancora completata._Esempio: B usa un valore che A deve ancora calcolare._
- **Structural Hazard** → due istruzioni vogliono usare la stessa risorsa hardware._Esempio: entrambe vogliono accedere all’unità di moltiplicazione._
- **Control Hazard** → causati dai salti condizionali, dove il processore non sa ancora quale direzione prendere.

> I processori moderni riducono gli hazard tramite riordino dinamico e predizione dei salti.

---

## Esecuzione Fuori Ordine (Out-of-Order Execution)

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#esecuzione-fuori-ordine-out-of-order-execution)

Con questa tecnica, il processore **riorganizza dinamicamente le istruzioni** per sfruttare al massimo le proprie risorse.

Se un’istruzione deve aspettare un dato, il processore può **eseguirne un’altra indipendente** nel frattempo.

Le strutture come la **Reorder Buffer** assicurano che i risultati vengano comunque resi visibili **nell’ordine corretto**, garantendo coerenza del programma.

---

## Branch Prediction

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#branch-prediction)

I **salti condizionali** (branch) introducono incertezza nel flusso del programma.

La **branch prediction** tenta di **indovinare in anticipo** quale percorso verrà preso.

I processori moderni:

- usano **predittori storici** o **reti neurali**,
- raggiungono **accuratezze superiori al 95%**.

> Se la predizione è sbagliata, entra in gioco il rollback per ripristinare lo stato precedente.

---

### ROLLBACK

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#rollback)

Il **rollback** permette di **annullare le istruzioni speculative** e **ripristinare lo stato corretto** del processore.

È analogo ai **punti di ripristino** di un sistema operativo: se qualcosa va storto, si torna indietro all’ultimo stato valido.

## IL MICROPROCESSORE

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#il-microprocessore)

il microprocressore è stato una rivoluzione, avendo un'intera cpu su un singolo chip di silicio, portando l'informatica in tutti i contesti, tra cui il personal computer. ulteriore agevolazione dall'integrazione in un singolo chip, si elimina il BUS e quindi riduciamo drasticamente il rallentamento provocato da esso, evitando il bottleneck.

## EVOLUZIONE ISA (ISTRUCTION SET ARCHITECTURE)

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#evoluzione-isa-istruction-set-architecture)

- CISC (complex istruction set computer) istruzioni complesse che eseguono operazioni elaborate in un singolo comando. esempi sono: x86 intel e amd
- RISC (REDUCED ISTRUCTION SET COMPUTER) set di istruzioni semplificate ma efficienti. esempi sono: ARM per i dispositivi mobile, MIPS per sistemi embedded
- le architetture moderne utilizzano un sistema ibrido tra CISC e RISC

## ARCHITETTURE SUPERSCALARI

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#architetture-superscalari)

Le architetture superscalari rappresentano un'importante evoluzione nel design dei processori moderni. Questi processori sono caratterizzati dalla capacità di eseguire simultaneamente molteplici istruzioni durante ogni singolo ciclo di clock, sfruttando il parallelismo a livello di istruzioni per migliorare significativamente le prestazioni complessive del sistema.

## SUPERPIPELINING

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#superpipelining)

Il superpipelining rappresenta una tecnica avanzata che consiste nell'aumentare significativamente il numero di stadi che compongono la pipeline del processore. Attraverso questa suddivisione più granulare, ogni singolo stadio della pipeline viene ridotto in termini di complessità e durata, permettendo così di raggiungere frequenze di clock molto più elevate rispetto alle architetture tradizionali.

> Entrambe le tecnologie, sia i processori superscalari che il superpipelining, contribuiscono in modo sostanziale all'aumento del throughput complessivo del sistema, ovvero la quantità totale di istruzioni che possono essere elaborate nell'unità di tempo.

## Issue Width

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#issue-width)

L’**issue width** rappresenta il **numero massimo di istruzioni** che un processore _superscalare_ può inviare in esecuzione in un singolo ciclo di clock. Ad esempio, se un processore ha un’issue width di **4**, significa che può potenzialmente eseguire fino a **4 istruzioni nello stesso ciclo**.

> Aumentare la issue width migliora il parallelismo, ma aumenta anche la complessità e il rischio di conflitti tra istruzioni.

## Era Multicore

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#era-multicore)

Quando i limiti fisici (calore, consumo) hanno bloccato l’aumento delle frequenze, si è passati dai **processori single-core** ai **multicore**. In questo modo più core lavorano in parallelo, aumentando le prestazioni tramite **parallelismo spaziale**. Il problema principale è la **coerenza della memoria condivisa**.

Per risolverlo, vengono usati protocolli come:

- **MESI (Modified, Exclusive, Shared, Invalid)** → garantisce che tutti i core abbiano una visione coerente della memoria.

---

## GPU e Parallelismo Massivo

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#gpu-e-parallelismo-massivo)

Le **GPU (Graphics Processing Unit)** portano il concetto di parallelismo all’estremo.

A differenza delle CPU (pochi core potenti), le GPU hanno **centinaia o migliaia di core leggeri**, ideali per eseguire **molti calcoli in parallelo**.

Sono perfette per:

- elaborare immagini (matrici R-G-B),
- machine learning,
- simulazioni scientifiche.

> Le GPU privilegiano il throughput elevato (tante operazioni contemporanee) piuttosto che la bassa latenza.

## Architetture ibride ed Eterogenee

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#architetture-ibride-ed-eterogenee)

L'evoluzione verso architetture ibride rappresenta la risposta moderna e più avanzata alle crescenti esigenze di efficienza energetica e di prestazioni altamente specializzate nei sistemi di calcolo contemporanei. L'integrazione strategica di più processori diversificati e componenti di elaborazione su un singolo chip consente di ottimizzare in modo significativo il consumo energetico complessivo del sistema e di migliorare notevolmente le prestazioni complessive per tipologie di lavori specifici e carichi computazionali mirati.

> L'offload computazionale permette alla CPU di delegare compiti specifici agli acceleratori più efficienti, dato che gli acceleratori dedicati sono 10-100 volte più efficienti.

# MEMORIA

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#memoria)

La **memoria** di un calcolatore può essere vista come un **contenitore ordinato di celle, ognuna delle quali può contenere un dato.

Ogni **cella di memoria** ha una **dimensione di 1 byte** (8 bit) e possiede un **indirizzo univoco** che serve per localizzarla e accedere al valore che contiene.

Gli **indirizzi** partono sempre da **zero**, quindi l’indirizzo dell’ultima cella corrisponde al **numero totale di celle meno uno**.

Ad esempio, una memoria composta da 1024 celle avrà indirizzi che vanno da 0 a 1023.

l'insieme di tutte le celle della memoria viene chiamato **spazio di indirizzamento della memoria**

---

L’**ampiezza dello spazio di indirizzamento** dipende dal numero di linee del **bus indirizzi** del sistema. In generale, se il bus indirizzi ha _n_ linee, lo spazio di indirizzamento sarà pari a: 2n Questo valore indica **quante celle di memoria** è possibile indirizzare. Ad esempio:

- con 16 linee di indirizzi → (216=65.536) locazioni (64 KB);
- con 32 linee → (232=4.294.967.296) locazioni (4 GB). In un sistema operativo moderno, la memoria può essere **riassegnata** a più processi, grazie alle tecniche di **allocazione dinamica** e **memoria virtuale**.

Un esempio pratico è il **file system FAT32**, che non può gestire file superiori a 4 GB, ma può accettare più trasferimenti da dimensioni inferiori (ad esempio, due file da 3 GB ciascuno).

---

> Il **contenuto della memoria principale** rimane memorizzato solo **finché il computer è alimentato**. Quando l’alimentazione viene interrotta, i dati vengono persi: per questo motivo la memoria RAM è detta **volatile**

---

Esistono due principali tipi di memoria RAM:

- **DRAM (Dynamic RAM)**: più lenta ma economica, utilizzata come memoria principale del sistema. I moduli DRAM sono installati negli **slot DIMM** della scheda madre.
- **SRAM (Static RAM)**: più veloce ma anche molto più costosa. Per questo motivo è usata solo per memorie temporanee ad alte prestazioni, come la **memoria cache** del processore.  
    ![[Memory-Organization-in-Computer-Organization-and-Architecture-4-638.webp]]

## Cache e Gerarchie di Memoria

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#cache-e-gerarchie-di-memoria)

La memoria principale (RAM) è molto più lenta rispetto al processore.  
Per ridurre questa latenza, si usano le **cache**, memorie piccole ma velocissime.

### Livelli di cache

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#livelli-di-cache)

- **L1:** la più veloce, ma piccola e dedicata a ciascun core.
- **L2:** intermedia per velocità e capacità.
- **L3:** condivisa tra i core, più grande ma più lenta.

Quando un dato non è presente nella cache (**cache miss**), deve essere recuperato dalla RAM, rallentando l’esecuzione.

### Politiche di sostituzione

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#politiche-di-sostituzione)

- **LRU (Least Recently Used):** rimuove il dato usato meno recentemente.
- **FIFO (First In, First Out):** elimina il dato più vecchio.
- **Random:** scelta casuale, utile quando si vuole semplicità di implementazione.

## Memoria Virtuale

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#memoria-virtuale)

La **memoria virtuale** consente a ogni programma di vedere uno **spazio di memoria continuo e più ampio** rispetto a quello fisico disponibile utilizzando il disco fisso.  
Il sistema operativo traduce gli **indirizzi virtuali** in **indirizzi fisici reali** tramite la **MMU (Memory Management Unit)**.

> la memoria virtuale è più lenta rispetto alla RAM

### Tecniche di mappatura

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#tecniche-di-mappatura)

- **Paginazione:** la memoria è divisa in blocchi di dimensione fissa (pagine).
- **Segmentazione:** la memoria è suddivisa in segmenti logici di dimensione variabile.
- **Ibridi:** combinano entrambi i metodi.

> Grazie alla memoria virtuale, parte del disco può essere usata come memoria di supporto (swap).

---

### BIOS

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#bios)

> All’interno della memoria di sistema è presente una sezione fondamentale: il **BIOS (Basic Input/Output System)**.

Il BIOS contiene due fasi principali:

1. **Bootstrap** – avvia il sistema e immette sul bus le prime istruzioni necessarie per inizializzare i dispositivi di base;
2. **POST (Power-On Self Test)** – esegue i controlli di base e carica il sistema operativo. Le aree di memoria che contengono il BIOS e altri **firmware** sono realizzate in tecnologia **ROM (Read Only Memory)**, che è **non volatile**: mantiene i dati anche senza alimentazione. Queste sezioni possono essere riprogrammate solamente tramite il programma di setup del bios o cambiando direttamente il bios.

> Il bios però è stato superato dalla tecnologia UEFI, che fornisce le stesse principali funzioni del bios migliorandole come:
> 
> - Supporto dischi GPT (Bios supportava Solo dischi MBR) GPT -> permette di avere molte partizioni, il limite lo dichiara il sistema operativo (windows limita a 128 partizioni), tra l'altro i dati di avvio e di gestione delle partizioni sono immagazzinate in più posizioni MBR -> è un sistema vecchio che permette di avere solo 4 partizioni primarie, dato che ogni partizione occupa 16 byte e la partizione di gestione è grande 64 byte, altro lato negativo è che i dati di avvio e di gestione sono immagazzinati in una sola partizione portando il disco ad un rischio di corruzione maggiore ai dischi GPT
> - Interfaccia grafica migliorata, con integrazione di cursore del mouse
> - introduzione di funzionalità come Secure Boot, che accetta solo programmi firmati

![[mbr-vs-gpt-guide-3.jpg]]

# BUS

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#bus)

Il **bus** è un insieme di fili (chiamati _linee_) che collegano tra loro le varie parti del computer:

- il **processore (CPU)**,
- la **memoria**,
- e i **dispositivi di input/output (I/O)**. In pratica, è come una **strada a più corsie** su cui viaggiano i dati. Ogni filo del bus trasporta un bit (0 o 1). Tutti i componenti principali del computer “si affacciano” su questa strada per leggere, scrivere o scambiare informazioni.

Il **modello di von Neumann** prevede che:

- i dati e le istruzioni risiedano in memoria,
- il processore li legga, li elabori e li riscriva,
- e che tutto questo avvenga tramite il **bus**.

Quindi, la maggior parte delle operazioni di un computer sono **trasferimenti di bit** tra CPU, memoria e dispositivi di I/O.

il **processore** è il **Master** (cioè quello che comanda),

mentre **memoria** e **I/O** sono gli **Slave** (cioè quelli che eseguono le richieste).

Il bus è il “mezzo di trasporto” che collega tutto.

Ci sono due tipi principali di trasferimenti:

- **Scrittura (Write)**: il processore invia dati alla memoria o ai dispositivi di I/O.
- **Lettura (Read)**: il processore riceve dati dalla memoria o dagli I/O.

Per gestire queste operazioni, il bus è diviso in **tre sottoblocchi** principali:

|Tipo di Bus|Nome|Funzione|
|---|---|---|
|Bus degli indirizzi|**Address Bus (ABus)**|Specifica _dove_ leggere o scrivere in memoria.|
|Bus dei dati|**Data Bus (DBus)**|Trasporta _i dati veri e propri_.|
|Bus di controllo|**Control Bus (CBus)**|Indica _cosa fare_ e _quando_ (es. leggere, scrivere, fine operazione).|

Il **Control Bus** contiene linee di controllo che dicono:

- se l’operazione è **tra memoria e CPU** oppure **tra I/O e CPU**;
- se è una **lettura (R/W = 1)** o **scrittura (R/W = 0)**;
- se il trasferimento è **finito (Wait = 1)** o **in corso (Wait = 0)**.

Il bus ha anche un **clock** (una specie di metronomo) che regola il tempo dei trasferimenti.

Tutto avviene in modo **sincronizzato**: prima si indica l’indirizzo, poi il tipo di operazione, poi si inviano o ricevono i dati.

Il segnale _Wait_ serve perché la **memoria è più lenta** della CPU → questo crea il famoso **collo di bottiglia di von Neumann**: la CPU deve aspettare la memoria.

Ogni bus ha un certo numero di linee (fili).

- L’**Address Bus** determina **quanta memoria può essere indirizzata**.
    
    Esempio: con 16 linee si possono indirizzare (216=65.536) locazioni (cioè 64 KB).
    
- Il **Data Bus** indica **quanti bit si possono trasferire per volta** (cioè il “grado di parallelismo”).
    
    Esempio: un DBus a 32 linee trasferisce 32 bit (4 byte) alla volta.
    

Sulla **scheda madre** del computer il bus di sistema è realizzato dal **Chipset**, cioè un insieme di circuiti che collegano tutto.

Si divide in due parti:

- **NorthBridge** → collega la CPU con la memoria e la scheda video.
- **SouthBridge** → collega la CPU con le periferiche (tastiera, USB, disco, ecc.).

Nel tempo i bus sono diventati sempre più veloci:

|Standard|Larghezza|Frequenza|Note|
|---|---|---|---|
|**ISA**|8 bit|8,33 MHz|Bus storico, lento|
|**EISA**|16 bit|8,33 MHz|Migliorato ma ancora lento|
|**PCI**|32 bit|33 MHz|Bus standard per anni|
|**PCI-X**|32–64 bit|66 MHz|Fino a 1 GB/s|
|**AGP**|dedicato alla scheda video|||
|**PCI Express (PCIe)**|bus moderno e veloce|sostituisce AGP e PCI||

Il numero di linee del bus **non sempre coincide** con la dimensione dell’architettura (32 o 64 bit), ma spesso è simile.

|Architettura|Address Bus|Memoria indirizzabile|Data Bus|Dati per trasferimento|
|---|---|---|---|---|
|**32 bit**|32 linee|232=4GB|32 linee|4 byte|
|**64 bit**|64 linee|264≈16 exabyte|64 linee|8 byte|

Non sempre serve avere tutte le linee teoriche.

Per esempio, un processore **a 64 bit** può avere **solo 48 linee di indirizzi**, sufficienti per gestire 256 TB di memoria fisica.

Le scelte su quanti fili usare dipendono da:

- **efficienza**,
- **costi**,
- e **requisiti del sistema**.

# I/O

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#io)

La sezione **Input/Output (I/O)** di un computer serve per:

- **acquisire** dati e programmi dall’esterno (input);
- **rappresentare** i risultati delle elaborazioni (output).

Le forme di rappresentazione sono molteplici: sullo schermo, tramite la stampante, o come dati memorizzati su dispositivi di massa (hard disk, DVD, pendrive, ecc.).

---

Dal punto di vista concettuale, la sezione di I/O si può immaginare come una **memoria con celle**, ma con uno **spazio di indirizzamento separato e più piccolo** rispetto alla memoria principale.

Ogni dispositivo di I/O (come tastiera, monitor o stampante) possiede:

- un proprio **intervallo di indirizzi** riservato, chiamato **registri di I/O** o **porte di I/O**;
- questi indirizzi servono al processore per comunicare con quella specifica periferica.

---

Alcuni dispositivi richiedono un grande spazio di I/O e utilizzano **indirizzi di memoria normali** invece degli indirizzi di I/O.

In questo caso si parla di **dispositivi mappati in memoria (Memory-Mapped I/O)**.

Questa tecnica permette di trattare la periferica come se fosse una parte della memoria principale, semplificando le operazioni di lettura e scrittura.

---

Per gestire in modo efficiente la comunicazione tra CPU e periferiche, esistono **linee di sincronizzazione dedicate**, chiamate **linee di interruzione** o **interrupt**.

Sul **Control Bus (CBus)** sono presenti due segnali principali:

- **INTR**: richiesta di interruzione da parte di una periferica;
- **INTA**: risposta del processore che accetta e gestisce l’interruzione.

Quando arriva un interrupt, il processore sospende temporaneamente ciò che sta facendo per eseguire una **procedura specifica** chiamata **ISR (Interrupt Service Routine)**.

Questo meccanismo è essenziale per i dispositivi che funzionano in modo **asincrono**, cioè che possono richiedere attenzione in qualsiasi momento (come il mouse o la tastiera).

I processi infatti possono essere Sincroni e Asincroni:

- Sincroni -> i processi vengono messi in coda con un ordine
- Asincroni -> i processi non hanno un ordine ma possono arrivare in qualsiasi momento (tipo lo spostamento del mouse).

---

Non sempre conviene che il processore gestisca direttamente ogni trasferimento di I/O, perché ciò rallenterebbe l’esecuzione.

Per questo motivo esistono modalità speciali:

- **DMA (Direct Memory Access)**: il trasferimento dei dati avviene direttamente tra la memoria e la periferica, senza coinvolgere la CPU.
    - **Burst Transfer**: il bus viene completamente riservato al DMA fino alla fine della task, negando l'accesso alla CPU.
    - **Cycle Stealing**: il bus viene occupato per un solo ciclo alla volta per trasferire una parola (un bit o un insieme di bit), così che la CPU non verrà rallentata dal processo.
    - **Transparent/Hidden**: Il DMA occupa il BUS solo quando la CPU non ne avrà bisogno.

Queste tecniche permettono di spostare grandi quantità di dati senza occupare la CPU.

---

Ogni periferica dispone di una circuiteria chiamata **scheda controller**, che ha il compito di:

- collegarsi al bus di sistema;
- gestire i propri indirizzi di I/O;
- sincronizzare i trasferimenti tramite il Control Bus;
- gestire eventuali linee di interrupt o DMA.

Le periferiche interne (come scheda video, rete, tastiera) hanno la scheda controller **integrata nel Chipset** della scheda madre.

Esistono anche **controller dedicati** per gestire in modo centralizzato le interruzioni e il DMA: l’**Interrupt Controller** e il **DMA Controller**.

---

Con l’introduzione del **bus PCI**, che collega CPU, memoria e I/O attraverso il **SouthBridge**, si è semplificata la gestione degli indirizzi e dei canali DMA.

Prima del PCI, le schede controller dovevano essere **configurate manualmente** (tramite ponticelli o interruttori) per assegnare indirizzi, linee di interrupt e canali DMA, evitando conflitti con altre schede.

Il PCI ha introdotto la tecnologia **Plug & Play**, grazie alla quale:

- il BIOS, il sistema operativo e il firmware della scheda controller stabiliscono automaticamente gli indirizzi e le linee di comunicazione;
- l’utente non deve più configurare manualmente i dispositivi;
- è possibile collegare dispositivi “a caldo” (senza spegnere il computer).

---

Le **periferiche esterne** si collegano al bus del sistema tramite **connettori standard**.

Esempi:

- **Slot PCI o PCIe**: per collegare schede aggiuntive (come una seconda scheda di rete o una scheda audio dedicata);
- **Connessioni IDE/EIDE (ATA-ATA2)**: usate in passato per hard disk e DVD, oggi quasi del tutto sostituite da interfacce più moderne.

---

Gli standard moderni per il collegamento dei dispositivi di I/O sono:

- **USB (Universal Serial Bus)**: consente il collegamento e l’installazione “a caldo” (Hot Swap), supporta alte velocità (480 Mbit/s per USB 2.0) e fornisce alimentazione ai dispositivi;
- **FireWire (IEEE 1394)**: simile all’USB, con velocità di 400 Mbit/s e possibilità di connessioni multiple in cascata;
- **Ethernet (802.x)**: standard per la rete locale.

Gli standard più vecchi come **RS232**, **porte parallele Centronics** e **PS/2** sono stati progressivamente abbandonati o convertiti in connessioni USB.

# PROCESSORE

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#processore)

Un **processore (CPU – Central Processing Unit)** è un **circuito integrato** in grado di eseguire operazioni logiche, aritmetiche e di controllo sui dati.

È composto da varie **unità funzionali**, ciascuna con un ruolo specifico.

- **UNITA' DI CONTROLLO**
- **L'AREA DEI REGISTRI**
- **L'UNITA' LOGICA-ARITMETICA**

---

### COMPONENTI PRINCIPALI

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#componenti-principali)

- **I Registri**: contengono i dati letti dall'UC per predisporli nella ALU e i dati relativi ai risultati delle operazioni.
    
- **ALU**: è l'unità di esecuzione effettiva del processore, è composta da microprogrammi cablati direttamente in hardware.
    
- **Unità di controllo (Control Unit):** gestisce il flusso delle istruzioni, decodifica gli **opcode**, coordina le operazioni tra registri, ALU e memoria.
    
- **Program Counter (PC):** registro speciale che contiene l’indirizzo dell’**istruzione successiva** da eseguire. Dopo ogni istruzione, viene **incrementato automaticamente** della lunghezza dell’istruzione appena completata.
    

OPCODE -> è un codice operativo che rappresenta un'istruzione dell'ISA, per esempio: `0001`=ADD.

---

### DATA PATH

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#data-path)

Il **data path** rappresenta il percorso che i dati compiono all’interno del processore:

**Registri -> Registri di Input -> ALU -> Registri di Output -> Registri**

Questo ciclo consente il trasferimento e l’elaborazione continua delle informazioni.

---

## CICLO DI ISTRUZIONE DEL PROCESSORE

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#ciclo-di-istruzione-del-processore)

Il processore opera secondo una **sequenza ciclica di fasi**, nota come **FETCH – DECODE – EXECUTE – STORE**:

1. **FETCH (Prelievo):**

L’unità di controllo pone sul **bus degli indirizzi (Address Bus)** il valore contenuto nel **Program Counter**, per leggere dalla memoria l’istruzione da eseguire.

L’**opcode (Operation Code)** dell’istruzione viene caricato nel registro istruzioni (Instruction Register).

2. **DECODE (Decodifica):**

L’unità di controllo **interpreta l’Op.code**, determinando **quali operandi servono** e **quale operazione** eseguire.

In questa fase vengono caricati gli **operandi** dai registri o dalla memoria (**Operand Fetch**).

3. **EXECUTE (Esecuzione):**

L’ALU o un’unità funzionale specializzata **esegue l’operazione richiesta** sull’input.

La velocità di questa fase dipende dal **clock della CPU**, che regola la frequenza di esecuzione dei microprogrammi.

4. **STORE (Memorizzazione):**

I risultati dell’operazione vengono **memorizzati** nei registri o **scritti in memoria** (tramite il **bus dei dati**) oppure inviati ai dispositivi di I/O.

---

## TIPOLOGIE DI ARCHITETTURA

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#tipologie-di-architettura)

### CISC (Complex Instruction Set Computer)

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#cisc-complex-instruction-set-computer)

- Ogni istruzione può eseguire **operazioni complesse** (ad esempio accesso in memoria + calcolo + memorizzazione).
- Le istruzioni sono **numerose e variabili in lunghezza**, quindi la fase di **decodifica è complessa**.
- Richiede un **data path a più cicli** per completare l’esecuzione di un’istruzione.
- È più **compatibile e portabile** a livello software: lo stesso codice Assembly può essere usato su CPU successive.
- Esempi: **Intel x86, AMD64**.

### RISC (Reduced Instruction Set Computer)

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#risc-reduced-instruction-set-computer)

- Utilizza un **insieme ridotto e uniforme di istruzioni**, generalmente di **lunghezza fissa (es. 32 bit)**.
- Ogni istruzione viene **eseguita in un solo ciclo di clock**, con un **data path a singolo passo**.
- L’esecuzione è più **rapida e prevedibile**.
- Per eseguire un’operazione complessa serve una **sequenza di più istruzioni semplici**.
- Esempi: **ARM, MIPS, RISC-V, SPARC**.

**Differenze principali:**

|Caratteristica|CISC|RISC|
|---|---|---|
|Numero di istruzioni|Alto|Basso|
|Lunghezza istruzione|Variabile|Fissa|
|Fasi per istruzione|Più cicli|Un solo ciclo|
|Decodifica|Complessa|Semplice|
|Velocità media|Inferiore|Maggiore|
|Esempi|x86, 68000|ARM, RISC-V|

### **Sistema di Cache**

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#sistema-di-cache)

Per evitare il _bottleneck_ dovuto alla lentezza della memoria principale rispetto alla CPU, si utilizza un sistema di **cache**.

Quando la CPU legge un indirizzo dalla memoria, gli indirizzi successivi vengono memorizzati nella cache.

Questo avviene tramite un **bus dedicato**, molto più veloce rispetto al bus della memoria principale (più lunga è la linea del bus, minore è la velocità di trasmissione).

Il funzionamento può essere riassunto così:

1. La CPU cerca il dato **prima nella cache**.
2. Se il dato **non è presente** (_cache miss_), viene letto dalla memoria principale.
3. Il dato viene quindi **copiato nella cache**, eventualmente **rimpiazzando** la linea meno utilizzata (_Least Recently Used – LRU_).

### Livelli di cache:

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#livelli-di-cache-1)

- **Cache L1** → all’interno della CPU (la più veloce, ma più piccola)
- **Cache L2** → collegata alla CPU (più grande, ma leggermente più lenta)
- **Cache L3** → condivisa, collegata alla scheda madre (ancora più grande, ma meno veloce)

---

### **Prefetch**

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#prefetch)

Fin dalle prime CPU, si è introdotto il **prefetch**:

la CPU preleva e memorizza in anticipo alcuni byte (ad esempio 6 o 8) successivi a quelli richiesti, in modo da **anticipare l’uso futuro dei dati** e **ridurre l’accesso al bus**.

Questo meccanismo aumenta la probabilità che le istruzioni necessarie siano già disponibili nella cache.

---

### **Superscalar Architecture**

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#superscalar-architecture)

Un processore con **più ALU (Arithmetic Logic Unit)** può gestire più pipeline contemporaneamente:

→ questo tipo di architettura si chiama **superscalare**.

---

### **Architetture CISC e ibridi moderni**

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#architetture-cisc-e-ibridi-moderni)

I processori **Intel i7** e **i9** appartengono alla famiglia **CISC (Complex Instruction Set Computer)**,

ma internamente sono **ibridi**, poiché utilizzano una microarchitettura **RISC-like** per ottimizzare l’esecuzione delle istruzioni complesse.

# LIVELLO SOFTWARE

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#livello-software)

## Il Processo di Programmazione e Traduzione

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#il-processo-di-programmazione-e-traduzione)

### Livelli di Linguaggio

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#livelli-di-linguaggio)

- I programmi sono scritti in **Linguaggio ad Alto Livello** (es. C, C++, ecc.), che è il più espressivo.
- Questo codice viene tradotto in **Linguaggio macchina assemblativo (Assembly)**.
- Il linguaggio assemblativo viene infine tradotto in **Linguaggio macchina binario**.

### Strumenti di Traduzione

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#strumenti-di-traduzione)

|**Strumento**|**Trasformazione**|**Note**|
|---|---|---|
|**Compilatore**|Codice ad Alto Livello → Codice Assemblativo|Automatizza molti compiti del programmatore assembly. Un compilatore che riorganizza le istruzioni è detto **Ottimizzante**.|
|**Assemblatore**|Codice Assemblativo → Codice Macchina Binario (File Oggetto)|Esegue passi come la generazione della codifica binaria e la gestione delle direttive di allocazione di memoria.|

## Generazione del Programma Oggetto

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#generazione-del-programma-oggetto)

La generazione di un file eseguibile completo (Programma Oggetto) richiede la collaborazione di più strumenti.

### Flusso di Lavoro

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#flusso-di-lavoro)

**Compilatore**: Trasforma i file sorgenti ad alto livello in file sorgenti assembly.

**Assemblatore**: Trasforma i file sorgenti assembly in **File Oggetto**.

**Linker (Collegatore)**: Collega assieme vari file oggetto e file di libreria in un unico **Programma Oggetto**.

> Il Ruolo del Linker e delle Librerie
> 
> - Quando un file sorgente chiama sottoprogrammi dichiarati altrove, l'assemblatore genera un file oggetto incompleto (con riferimenti a nomi esterni).
> - Il Linker risolve questi riferimenti combinando più file oggetto separati.
> - Le Librerie sono file che raggruppano file oggetto riutilizzabili e contengono le informazioni necessarie al Linker per risolvere i riferimenti a nomi esterni. Sono create dall'utility Archiver.

### Assemblatore a Due Passate

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#assemblatore-a-due-passate)

Si usa un metodo a 2 passate per gestire i simboli (es. etichette dei salti in avanti) che vengono usati prima di essere dichiarati.

**Passo 1**: Scorre il codice sorgente e raccoglie tutti i simboli e i rispettivi valori numerici nella **tabella dei simboli.**

**Passo 2**: Scorre nuovamente il codice sorgente, sostituisce i simboli con i valori in tabella e genera il codice oggetto finale.

## Esecuzione e Debug del Programma

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#esecuzione-e-debug-del-programma)

### Loader (Caricatore)

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#loader-caricatore)

Il Loader è il programma che carica il programma oggetto dalla memoria secondaria (disco) alla **memoria centrale** per l'esecuzione.

- Legge informazioni (lunghezza e locazione di caricamento) dall'header del file oggetto.
- Carica il programma in memoria.
- Salta alla prima istruzione del programma da eseguire.

### Debugger

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#debugger)

Il Debugger è un programma che consente di eseguire e interrompere il programma oggetto per controllare lo stato della memoria e dei registri e individuare errori di programmazione (bug).

|**Modalità**|**Descrizione**|**Meccanismo**|
|---|---|---|
|**Trace Mode**|Il programma viene eseguito **passo-passo**, interrompendosi dopo ogni istruzione.|Si genera un'eccezione al termine di ogni istruzione; il Debugger è la routine di servizio dell'interruzione.|
|**Breakpoint**|L'esecuzione si interrompe in punti di osservazione specifici definiti dal programmatore.|Il Debugger sostituisce temporaneamente le istruzioni nei punti di osservazione con speciali interruzioni software (**Trap**).|

## Il Sistema Operativo (SO)

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#il-sistema-operativo-so)

Il **Sistema Operativo** gestisce il coordinamento generale di tutte le attività del calcolatore.

**Funzioni**: Esecuzione concorrente di programmi, gestione degli I/O, gestione dell'accesso alla memoria, gestione dell'interfaccia utente, etc.

**Struttura**: Formato da un insieme di routine essenziali che risiedono nella memoria centrale e programmi di utilità che risiedono su disco.

**Sistemi Multitasking**: Sistemi operativi capaci di eseguire più programmi contemporaneamente (virtualmente).

- **Gestione Concorrente (Time Slicing)**: Il SO divide l'esecuzione dei programmi in **quanti di tempo** (τ). Un contatore lancia un'interruzione a intervalli regolari, attivando la routine **SCHEDULER** per scegliere il prossimo programma da eseguire.

**Stati dei Programmi**: **RUNNING**, **RUNNABLE** e **BLOCKED**.

# PIPELINE

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#pipeline)

la pipeline serve a parallelizzare i processi della CPU durante l’esecuzione di un programma.

il pipelining è una tecnica avanzata nei processori:

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md)

il principio fondamentale è la parallelizzazione dei processi per ottimizzare tutti i processi in meno cicli di clock.

gli stadi della pipeline sono:

FETCH → DECODE →EXECUTE →MEMORY → WRITE

nel caso migliore (senza cache miss) si hanno 5 istruzioni eseguite in parallelo

per gestire l’esecuzione in pipeline di più istruzioni, è necessario mantenere informazioni tra uno stadio e l’altro.

queste informazioni vengono mantenute nei buffer interstadi che contengono il dato tra uno stadio e l’altro della pipeline e contengono:

- i registri interstadio (RA,RB,PC_TEMP, etc..)
- il registro IR (per mantenere gli identificatori dei registri sorgente e destinazione)
- segnali di controllo per i vari stadi

I PROBLEMI DEL PIPELINING:

- DATA HAZARD
- RITARDO ACCESSO MEMORIA
- RITARDO NEI SALTI
- LIMITE DI RISORSE

## DATA HAZARD

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#data-hazard)

un data hazard accade quando un istruzione contiene un registro sorgente che ancora non è stato aggiornato dalle istruzioni precedenti:

- in questo caso l’istruzione ADD aggiornerà il contenuto di R2 alla fine della fase WRITE
- l’istruzione subtract legge il contenuto di R2 mentre si trova in fase di EXECUTE
- l’istruzione subtract resterà in stallo finché R2 non sarà aggiornato (3 cicli di clock)

i vari tipi di data hazard sono:

- RAW
    
    R2 legge il contenuto di R1 prima che l’istruzione su R1 abbia finito la fase MEMORY, andando a leggere un valore errato
    
- WAW
    
    istruzione i salva un operando in R3 prima che lo salvi istruzione j, lasciando così solo l’istruzione j
    
- WAR
    
    R1 viene cambiato nell’istruzione i e nell’istruzione j viene letto
    

### ISTRUZIONI NOP

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#istruzioni-nop)

per mettere un istruzione in stallo si utilizzano le istruzioni nop tra le due istruzioni.

ciascuna NOP crea un ciclo di inattività chiamato _bolla._

le istruzioni nulle possono essere generate via compilatore o via hardware tramite circuiti complessi.

è una tecnica usata per evitare i ritardi causati dai data hazard, con questa tecnica indirizziamo direttamente gli operandi dell’istruzione precedente senza doverli pprima salvare in memoria

i compilatori ottimizzanti possono spostare istruzioni utili nelle posizioni delle NOP

## INOLTRO DEGLI OPERATORI (FORWARDING)

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#inoltro-degli-operatori-forwarding)

pper risolvere il problema si ricorre all’operand forwarding dove alla fine di istruzioni 1 il dato viene rimandato direttamente alla ALU della prossima istruzione, saltando quindi il WRITEBACK e dei possibili stalli.

## **Ritardi della memoria**

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#ritardi-della-memoria)

Gli accessi alla memoria principale possono richiedere un numero di cicli di clock superiore a quello necessario per gli accessi alla cache. Nei casi di _cache miss_, il dato richiesto non risiede nella cache e deve essere recuperato dalla memoria centrale, introducendo ritardi dell’ordine di dieci o più cicli di clock.

Poiché la pipeline è organizzata in stadi sequenziali, un’istruzione che permane nello stadio di accesso alla memoria impedisce l’avanzamento delle istruzioni successive, causando un blocco globale della pipeline per tutta la durata del ritardo.

---

## **Ritardi nei salti**

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#ritardi-nei-salti)

Le istruzioni di salto condizionato e incondizionato producono una deviazione del normale flusso di esecuzione. Nel modello classico a cinque stadi, l’indirizzo di destinazione del salto viene determinato nello stadio di esecuzione (_Execution_). Tale ritardo implica che le due istruzioni che entrano nella pipeline immediatamente dopo il salto siano state già prelevate e debbano essere scartate.

La penalità associata corrisponde quindi a due cicli di clock per ogni salto preso. Lo stesso meccanismo si applica ai salti condizionati la cui condizione risulta vera.

---

## **Riduzione della penalità di salto**

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#riduzione-della-penalit%C3%A0-di-salto)

La penalità può essere ridotta spostando al secondo stadio della pipeline (Decodifica) sia il calcolo dell’indirizzo di salto, mediante l’introduzione di un sommatore dedicato, sia la valutazione della condizione di salto, mediante il trasferimento del comparatore allo stesso stadio.

In questo modo, l’indirizzo di destinazione è determinato con un ciclo di anticipo rispetto al modello tradizionale, riducendo la penalità del salto a un singolo ciclo di clock.

---

## **Salto differito (Delayed Branch)**

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#salto-differito-delayed-branch)

Nel modello a salto differito, l’istruzione immediatamente successiva al salto viene sempre eseguita, indipendentemente dall’esito della condizione di salto. In questo contesto, l’istruzione collocata nello _slot_ successivo al salto viene denominata _delay slot_.

Il compilatore ha il compito di individuare un’istruzione semanticamente valida da collocare nel _delay slot_, al fine di evitare l’inserimento di istruzioni nulle (_NOP_). Qualora non sia possibile individuare una tale istruzione, viene inserita una _NOP_, mantenendo comunque una riduzione della penalità rispetto allo scarto delle istruzioni.

---

## **Predizione dei salti**

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#predizione-dei-salti)

La predizione dei salti ha l’obiettivo di ridurre l’impatto dei ritardi di salto prevedendo anticipatamente l’esito di un'istruzione di salto e consentendo il prelievo dell’istruzione corretta senza attendere la valutazione della condizione.

### **Predizione statica**

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#predizione-statica)

La predizione statica si basa su strategie fisse, quali:

- presumere che il salto non venga effettuato;
- presumere che i salti all’indietro siano presi e quelli in avanti non presi;
- utilizzare un bit di predizione incorporato nell’istruzione.

Questi metodi presentano complessità ridotta ma accuratezza limitata.

### **Predizione dinamica**

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#predizione-dinamica)

La predizione dinamica utilizza il comportamento storico di ciascun salto per migliorare l’accuratezza.

Modelli tipici includono:

- predittori a due stati, con stati “probabilmente salta” e “probabilmente non salta”;
- predittori a quattro stati, che introducono i livelli “molto probabilmente salta” e “molto probabilmente non salta”.

L’impiego dei predittori a più stati riduce la sensibilità agli errori sporadici e incrementa l’accuratezza della predizione.

---

## **Buffer di destinazione di salto (Branch Target Buffer)**

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#buffer-di-destinazione-di-salto-branch-target-buffer)

Per consentire la predizione sin dallo stadio di prelievo (_Fetch_), è utilizzata una memoria veloce denominata _Branch Target Buffer_ (BTB). Essa contiene per ciascun salto:

- l’indirizzo dell’istruzione di salto;
- uno o più bit di predizione relativi all’algoritmo adottato;
- l’indirizzo di destinazione.

Durante il prelievo, se l’indirizzo dell’istruzione corrisponde a una voce nel BTB, il valore memorizzato viene utilizzato per aggiornare immediatamente il Program Counter. Qualora la tabella non possa contenere tutte le istruzioni di salto del programma, viene aggiornata dinamicamente sulla base dell’esecuzione.

---

## **Limiti di risorse**

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#limiti-di-risorse)

La pipeline può andare incontro a blocchi quando più istruzioni richiedono l’uso simultaneo di una risorsa hardware condivisa. Un esempio tipico riguarda le cache unificate: durante il prelievo dell’istruzione, un accesso simultaneo alla memoria per operazioni di _load_ o _store_ può causare uno stallo.

Una soluzione efficace consiste nell’adozione di cache separate per istruzioni e dati, riducendo il conflitto di accesso.

---

## **Valutazione delle prestazioni**

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#valutazione-delle-prestazioni)

### **Modello senza pipeline**

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#modello-senza-pipeline)

Il tempo di esecuzione di un programma è:

T=N⋅SR

dove:

- (N) è il numero di istruzioni,
- (S) è il numero medio di cicli per istruzione (_CPI_),
- (R) è la frequenza di clock.

### **Modello con pipeline**

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#modello-con-pipeline)

In condizioni ideali, il throughput della pipeline è:

Pp=R

ossia una istruzione completata per ciclo.

### **Effetto dei conflitti**

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#effetto-dei-conflitti)

I conflitti introducono un incremento del CPI. Per ciascuna categoria di conflitto si definisce una penalità:

δ=p⋅c

dove:

- (p) è la probabilità del verificarsi del conflitto,
- (c) è il numero medio di cicli di stallo introdotti.

Il CPI effettivo diventa:

Stot=S+δdato+δsalto+δmiss

---

## **Processori superscalari**

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#processori-superscalari)

I processori superscalari possono emettere più istruzioni per ciclo, sfruttando la presenza di più unità funzionali organizzate in pipeline indipendenti.

### **Componenti principali**

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#componenti-principali-1)

- unità di prelievo con coda di istruzioni;
- unità di smistamento (_dispatch_) con stazioni di prenotazione;
- unità di esecuzione parallele;
- registri temporanei;
- unità di _commit_ con buffer di riordino.

Le istruzioni possono essere inviate in esecuzione quando le risorse e gli operandi necessari risultano disponibili.

---

## **Dipendenze di dato e stazioni di prenotazione**

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#dipendenze-di-dato-e-stazioni-di-prenotazione)

Per ogni unità di esecuzione è presente una stazione di prenotazione che contiene:

- l’istruzione in attesa di esecuzione,
- gli operandi o i riferimenti ai registri temporanei che li conterranno,
- eventuali informazioni di controllo.

Un’istruzione è resa disponibile all’esecuzione solo quando tutti gli operandi sono stati prodotti. Le unità produttori distribuiscono i risultati alle stazioni di prenotazione tramite meccanismi di inoltro dei dati.

---

## **Esecuzione fuori ordine**

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#esecuzione-fuori-ordine)

Per mitigare l’impatto degli stalli dovuti a _cache miss_ o eccezioni, è consentita l’esecuzione delle istruzioni in un ordine diverso rispetto a quello del prelievo, purché ciò non alteri la semantica del programma.

### **Ridenominazione dei registri**

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#ridenominazione-dei-registri)

I risultati delle unità funzionali non vengono scritti direttamente nei registri architetturali ma in registri temporanei, prevenendo conflitti di nome e garantendo la correttezza delle dipendenze tra istruzioni.

### **Buffer di riordino (Reorder Buffer)**

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#buffer-di-riordino-reorder-buffer)

L’unità di _commit_ trasferisce i risultati dai registri temporanei a quelli architetturali secondo l’ordine originale, garantendo precisione nelle eccezioni e consistenza dello stato del processore.

---

## **Pipeline nei processori CISC**

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#pipeline-nei-processori-cisc)

Le architetture CISC presentano sfide specifiche nella realizzazione di pipeline, dovute a:

- complessità del formato delle istruzioni,
- molteplicità dei modi di indirizzamento,
- uso di operandi in memoria,
- presenza di flag di stato.

### **Soluzione nei processori Intel Core i7**

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#soluzione-nei-processori-intel-core-i7)

I processori Intel Core i7 adottano:

- pipeline molto profonde (14 stadi),
- emissione multipla fino a quattro istruzioni per ciclo,
- traduzione dinamica delle istruzioni CISC in _micro-operazioni_ interne di tipo RISC.

Le micro-operazioni vengono quindi eseguite dalle unità funzionali superscalari secondo logiche di esecuzione e riordino analoghe a quelle descritte in precedenza.

---

# STRUTTURA BASE CPU

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#struttura-base-cpu)

il processore è un circuito integrato (chip) che fa da "cervello" al calcolatore. è capace di effettuare le istruzioni elementari necessarie per eseguire i programmi (operazioni aritmetiche, operazioni logiche, confronti, salti). ![[Schermata del 2025-11-29 12-41-11.png]]

## COMPONENTI

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#componenti)

- UNITÀ ARITMETICA-LOGICA (ALU) esegue le operazioni aritmetiche e logiche ![[Schermata del 2025-11-29 12-42-57.png]]
- CIRCUITI DI CONTROLLO generano i bit di controllo per gestire il funzionamento della CPU
- BANCO DI REGISTRI blocco di memoria contenente i registri generici della CPU
- PC e IR registri che contengono rispettivamente l'indirizzo della prossima istruzione e l'istruzione in esecuzione
- GENERATORE DI INDIRIZZI aggiorna il contenuto di PC
- INTERFACCIA PROCESSORE/MEMORIA gestisce il trasferimento dei dati tra memoria e CPU.

### BANCO DI REGISTRI

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#banco-di-registri)

il banco dei registri si trova all'interno della CPU e contiene n registri in base all'architettura del calcolatore. i registri vengono utilizzati per memorizzare gli operandi delle operazioni, dato che sono molto più veloci della RAM, dato che è indispensabile il passaggio dal BUS. ![[Schermata del 2025-11-29 13-38-35.png]] prende in input due registri e ne tiene uno in output per la scrittura.

### ALU

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Architettura%20degli%20Elaboratori/ARCHITETTURA%20DEGLI%20ELABORATORI.md#alu)