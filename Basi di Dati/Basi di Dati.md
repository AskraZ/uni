Canale di Comunicazione: moodle
Esame: Prova Scritta + Progetto 
Itinere:
Sito Algebra relazionale: https://dbis-uibk.github.io/relax/
#  Introduzione
Un database è un insieme organizzato di dati che si evolvono nel tempo.
**DBMS** è un sistema software in grado di gestire collezioni di dati che sono:
- Grande dimensione
- Persistenti
- Condivise
---
> [!info] **PROBLEMI**: Ridondanza (Informazioni Ripetute), Incoerenza (Informazioni non coincidono).

Siano $T_{1},T_{2},T_{3}$ tipi primitivi e $A_{1},A_{2},A_{3}$ etichette allora:
$\{A_{1}:T_{1},A_{2}:T_{2},A_{n}:T_{n}\}$ è detta una **n-upla di grado $n$.**
Il tipo di $A_{n}$ dev'essere uguale a $T_{n}$.

>La cardinalità di una relazione è il numero di n-uple presenti.

![[screenshot-2026-10-05_11-37-06.png]]
###### **VINCOLI DI INTEGRITA'**
1. Attribuzione di *Null*
2. Quali Attributi sono *Chiave*
3. Quali Attributi sono *Chiavi esterne*
#### **CHIAVI**
Diremo che $X$ è una superchiave se ogni istanza valida dello schema non contiene due record $t_{1}$ e $t_{2}$ con $t_{1}[X]=t_{2}[X]$
Una chiave è una superchiave minimale se rimuovendo degli attributi la proprietà non persiste.
Chiave $=$ Superchiave minimale
![[screenshot-2026-10-05_11-50-08.png]]
**CHIAVE PRIMARIA**

**CHIAVE ESTERNA**
## ALGEBRA RELAZIONALE 
OPERATORI:
- RIDENOMINAZIONE
- UNIONE
- DIFFERENZA
- PROIEZIONE
- RESTRIZIONE (O SELEZIONE)
- PRODOTTO
**RIDENOMINAZIONE**
$$\delta Matricola\to Codice \ studente(STUDENTE)$$
![[screenshot-2026-10-05_12-43-31.png]]
**UNIONE, DIFFERENZA, INTERSEZIONE**
Due relazioni $R$ e $S$ possono usufruire di queste operazioni:

$$R\cup S=\{t|t\in R\ \vee t\in S\}$$
$$R-S=\{t|t\in R \wedge t\not\in S\}$$
$$R\cap S=\{t|t\in R\wedge t\in S\}$$
**PROIEZIONE**
Serve ad estrapolare colonne e si indica con $\pi$
![[screenshot-2026-10-07_08-18-40.png|432]]
**RESTRIZIONE**
$$\sigma(R)=\{t|t\in R\vee\lambda(t)=VERA\}$$
con $\lambda$ che indica un predicato vero o falso.
![[screenshot-2026-10-07_08-20-57.png|427]]
**PRODOTTO CARTESIANO**
$$R\times S=\{tu|t\in R\vee u\in S\}$$
con $R=\{A_{1}:T_{1},\dots,A_{n}:T_{n}\}$ e $S=\{A_{n+1}:T_{n+1},\dots,A_{n+m}:T_{n+m}\}$

**JOIN**
- Natural JOIN
- $\theta$ JOIN
$$R\bowtie S=\{t|t[XY]\in R\vee t[YZ]\in S\}\implies R\bowtie S=t[XYZ]$$![[screenshot-2026-10-07_08-28-14.png|497]]
$$R\bowtie_{\sigma_{F}}S={\sigma(R\times S)}$$

**DIVISIONE**
$$R\div S=\{w|\{w\}\times S\subseteq R\}$$
restituisce tutti i record di $R$ che hanno correlazione con tutti i record di $S$
![[Screenshot 2026-10-13 155504.png|482]]
###### QUERY 
ESERCIZIO 
![[screenshot-2026-10-07_08-52-36.png|607]]$$Employees\bowtie_{Number=Employee}Supervision$$
**ESERCIZI**

---
Trovare gli impiegati che guadagnano più di 40k€
$\pi_{NAME,SURNAME,AGE}=[\sigma_{sal>40}(Employees)]$
---
Trovare i responsabili che guadagnano più di 40k€
$\pi_{Head}=[Supervision \bowtie_{Employee=Number} \sigma_{sal >40}(Employees)]$
---
Trovare nome e salario dei responsabili degli impiegati che guadagnano più di 40k€
$\pi_{Name, Salary}=[Employees \bowtie_{Number=Head}\pi_{Head}(Supervision \bowtie_{Employee=Number}\sigma_{sal>40}(Employees))]$
---
Trovare gli impiegati che guadagnano più dei loro responsabili e visualizzare numero, nome, salario sia dell'impiegato che del responsabile.
$\pi(\sigma_{Sal>salH}(\sigma_{Number\to NumbH,Name \to NameH, Age\to AgeH, Salary\to SalH}\bowtie_{Number=Head}(Employees)\bowtie Supervision \bowtie_{Employee=Number}Employees))$
---
Trovare numero e nome dei responsabili i cui impiegati guadagnano tutti meno di 40k€.
$\pi_{Head}(Supervision)-\pi_{Head}[Supervision \bowtie_{Employee=Number}\sigma_{sal<40}(Employees)]$

**JOIN INCOMPLETI**

Nel caso in cui alcuni valori tra gli attributi comuni non coincidono

![[Schermata_20261012_105226.png]]

in questo caso perdiamo la riga di Smith in r_1 e la riga di purchasing in r_2.

Le n-uple che non partecipano al JOIN sono dette dangling n-uple.

**OUTER JOIN**

Un JOIN senza n-uple dangling, sostituendo gli attributi con NULL.

ci sono tre tipi di outer join:

LEFT: Solo dangling del primo operando

RIGHT: Solo dangling del secondo operando

FULL: Teniamo i dangling di entrambi gli operandi


# ALGORITMO DI QUERY OPTIMIZATION

> [!info] Due espressioni sono dette *Equivalenti* se producono lo stesso risultato.
- Push selection: $\sigma_{A=10}(R_{1}\bowtie R_{2})=R_{1}\bowtie\sigma_{A=10}R_{2}$
 
> [!example] Supponiamo di voler trovare tutti i professori che hanno dato a Mario Rossi più di 27.
> $\pi_{Professore}(\sigma_{Nome='Mario Rossi'\wedge Voto>27}(STUDENTI \bowtie ESAMI \bowtie CORSI))$
> può essere espressa come:
> $\pi_{Professore}(\sigma_{Nome='MarioRossi'}Studenti\bowtie\sigma_{Voto>27}(ESAMI\bowtie CORSI))$

# SQL 
### SELECT 
SINTASSI GENERALE:
```sql
SELECT [DISTINCT] Attributi 
FROM Tabelle
WHERE Condizione
```
>[!example] Indirizzo e telefono di Teo Verdi 
> ![[Schermata_20261014_083035.png]]
> `SELECT indirizzo, Telefono
> FROM Studenti
> WHERE Nome='Teo Verdi'`

>[!info] CONVENZIONI 
>- I comandi SQL non sono case-sensitive.
>- Si possono distribuire su più righe

> [!summary] utilizzando DISTINCT evitiamo la proiezione di duplicati.

---
#### OPERATORI ARITMETICI

| Operatore | Descrizione     |
| --------- | --------------- |
| $+$       | Somma           |
| $-$       | Sottrazione     |
| $*$       | Moltiplicazione |
| $/$       | Divisione       |
![[Schermata_20261014_083452.png|564]]


#### ALIAS DELLE COLONNE 
Si può proiettare la query con un nome diverso tramite due metodi:
![[Schermata_20261014_083647.png|609]]

![[Schermata_20261014_083732.png|606]]

---
### WHERE
```sql
SELECT [DISTINCT] {*|colonna[alias],...}
FROM tabella
WHERE condizione(i)
```
> [!info] la clausola WHERE è opzionale 

![[Schermata_20261014_084838.png|626]]

>[!hint] si possono usare i confronti nella clausola WHERE 

![[Schermata_20261014_084945.png]]

---

| Operatori           | Significato                               |
| ------------------- | ----------------------------------------- |
| BETWEEN ... AND ... | compreso tra due valori                   |
| IN(list)            | Corrisponde ad uno dei valori della lista |
| LIKE                | Operatore di pattern matching             |
| IS NULL             | Valore nullo                              |
#### BETWEEN
![[Schermata_20261014_085257.png]]

>[!info] si può anche inserire NOT BETWEEN 

#### IN
Compara il valore di un attributo con una lista di valori e restituisce i record che hanno lo stesso valore.
![[Schermata_20261014_085506.png]]

#### LIKE 
con LIKE inserito nella clausola WHERE andiamo a cercare:
- con LIKE 'S%' andiamo a cercare tutte le stringhe che iniziano per S
% $\to$ indica zero o più caratteri
_ $\to$ denota un carattere
![[Schermata_20261014_085954.png]]

#### IS NULL
```sql
SELECT nome
FROM studenti 
WHERE Telefono IS NOT NULL
```
#### OPERATORI LOGICI 

| operatore | descrizione               |
| --------- | ------------------------- |
| AND       | ENTRAMBE VERE = VERO      |
| OR        | ALMENO UNA VERA = VERO    |
| NOT       | AFFERMAZIONE FALSA = VERA |
![[Schermata_20261014_091508.png]]
>[!warning] REGOLE DI PRECEDENZA 
> ![[Schermata_20261014_091637.png]]

#### ORDER BY 
- ASC: ordine crescente (default)
- DESC: ordine decrescente
la clausola ORDER BY è inserita per ultima nei comandi SELECT 
```sql
SELECT empno, ename, sal*12 annsal
FROM emp
ORDER BY annsal DESC 
```
### JOIN 
![[Schermata_20261014_092629.png]]

la Join si trova nella clausola WHERE.
#### JOIN ESPLICITO 
```sql
SELECT paternita.figlio, padre, madre
FROM maternita JOIN paternita ON
paternita.figlio = maternita.figlio
```
> [!example] Selezionare i padri di persone che guadagnano più di 20

```sql
SELECT distinct padre
FROM persone, paternita
JOIN paternita ON figlio = nome
WHERE reddito > 20; 
```
## AGGREGAZIONE DATI 
SQL prevede 5 possibili operatori di aggregazione.
- AVG (media)
- COUNT (numero dei record)
- MAX 
- MIN 
- SUM (Somma)
**SINTASSI** 
```sql
SELECT [column], group_function(column)
FROM table 
WHERE condition
GROUP BY column 
ORDER BY column
```
![[Schermata_20261019_112322.png]]
> [!warning] AVG E SUM ignorano i valori Null

