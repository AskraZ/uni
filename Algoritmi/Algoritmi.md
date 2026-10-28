# Ricorsione 
---
> [!abstract] Cos'è la Ricorsione
> La ricorsione è una tecnica utilizzata negli algoritmi e nelle strutture Dati in cui si va a richiamare la funzione più volte fino ad arrivare ad un caso base.

Ecco un esempio basico dell'utilizzo della ricorsione, applicato al calcolo fattoriale:
$$n! = \begin{cases}1 & se \ n=0 \\  n\cdot(n-1) & se \ n>0\end{cases}$$
> [!tip] 
> In breve diciamo che per calcolare il Fattoriale di $n$ ci basta saperlo fare per $n-1$, arrivando al caso base e ricostruendo all'insù.

**LE DUE FASI DELLA RICORSIONE**
- *Fase di Suddivisione:* si suddivide il problema in tanti piccoli problemi che si fermano al caso base. 
- *Fase di Ricombinazione:* si ricompongono i risultati della fase precedente per arrivare alla prima chiamata.

**STRUTTURE DATI DEFINITE RICORSIVAMENTE**
- Lista: un elemento iniziale $n$ seguito da una lista dello stesso tipo.
$$Lista=\begin{cases}
Lista\ vuota,  & oppure \\
(Elemento, Lista) & \text{se contiene almeno un elemento} 
\end{cases}$$
- Array: Un array di lunghezza $n$ può essere definito come un elemento $m$ seguito da un array di lunghezza $n-1$
$$A[]_{Ricorsivo}=m\cup A_{n-1}$$
- Alberi: ogni nodo dell'albero può essere considerato come la radice di un nuovo albero.
$$Albero=\begin{cases}
\text{nodo vuoto}, & \text{(Albero nullo)} \\
\text{(valore, sottoalbero sinistro, sottoalbero destro)},  & \text{(albero non vuoto)}
\end{cases}$$
**STRUTTURE GENERALE DI UN PROGRAMMA RICORSIVO** 
1. Caso base: la condizione che ferma l'algoritmo dall'andare all'infinito.
2. Passo Ricorsivo: sezione dove la funzione chiama sé stessa per suddividire il problema.
3. Combinazione: Unione di tutti i risultati per risolvere il macro-problema.
---
### COMPLESSITÀ COMPUTAZIONALE

**NOTAZIONE $\theta(g(n))$**
Indica il caso medio, ovvero l’insieme di tutte le funzioni che crescono alla stessa velocità di una funzione di riferimento $g(n)$

$$  
\theta(g(n))=\{f(n)|\exists c_1,c_2,n_0>0:c_1g(n)\leq f(n) \leq c_2g(n), \forall n> n_0\}  
$$

![[954734A9-43E8-4DF0-907F-482EC13CD238 1.gif]]

**NOTAZIONE $O(g(n))$**
Indica il peggior caso possibile, ovvero un limite che la funzione può raggiungere ma non supera mai.

$$  
O(g(n))=\{f(n)|\exists c>0, n_0>0:0\leq f(n)\leq cg(n), \forall n>n_0\}  
$$

![[22E37816-145B-4F0A-97C9-70ECA8760203.gif]]

**NOTAZIONE $\Omega$**
Indica il caso migliore che la funzione può raggiungere, ovvero il caso ottimale.
$$\Omega(g(n))=\{f(n)|\exists c>0, n_0 >0:0\leq cg(n)\leq f(n), \forall n>n_0\}$$

## EQUAZIONI DI RICORRENZA
Un equazione di ricorrenza descrive la performance di un algoritmo con dimensione $n$:

$T(n)=\sum_{i=0}^{K}T(n_{i})+f(n) \text{ dove } T(n_{i})$ rappresenta il tempo necessario per risolvere il sotto problema i-esimo e f(n) rappresenta il tempo impiegato per la fase di divisione e ricomposizione.

> [!info] Come si costruisce un equazione di ricorrenza
> Fattoriale: ad ogni chiamata il problema riduce di 1 la sua dimensione, quindi
> $T(n)=T(n-1)+O(1)$
> Somma di un Array: se dividiamo l'array in due, allora avremo:
> $T(n)=2T\left( \frac{n}{2} \right)+O(1)$
> Merge Sort: Ogni livello di ricorsione prevede una divisione in due sottoarray, ma la fase di merge richiede tempo lineare:
> $T(n)=2T\left( \frac{n}{2} \right)+O(n)=O(n\log n)$

### ALBERO DI RICORSIONE
Ricordiamo l'equazione generale di Ricorrenza: $T(n)=aT\left( \frac{n}{b} \right)+f(n)$
	- La radice corrisponde al problema iniziale di dimensione $n$
- i nodi interni rappresentano le chiamate ricorsive generate a ciascun livello
- ogni nodo è etichettato con il costo del lavoro locale $f(n_{1})$ dove $n_{1}$ è la dimensione del sotto-problema.
- i figli di un nodo rappresentano le chiamate generate dal quel nodo.
quindi l'albero di ricorsione si calcola con $$\sum_{i=0}^{h}a^{i}f\left( \frac{n}{b^{i}} \right)$$  ![[OIP.webp]]
### METODO DELLA SOSTITUZIONE 
>[!warning] metodo che all'esame viene richiesto per dimostrare il risultato 

Questo metodo consiste nel formulare un ipotesi sulla forma asintotica della soluzione e dimostrare che l'ipotesi è corretta con un ragionamento induttivo.
**STEP DA SEGUIRE**
1. si formula un ipotesi del comportamento asintotico (con il teorema master)
2. si sostituisce l'ipotesi nell'equazione generale di ricorrenza 
3. Se necessario si aggiusta l'ipotesi e si riparte da (1)

>[!example] Esempio 1 - Ricerca Binaria
> consideriamo l'equazione della ricerca binaria trovata prima: $T (n) = T \left(  \frac{n}{2} \right) + 1$ 
> L'intuizione (l'albero di ricorsione) $n$ suggerisce una crescita logaritmica.
> Supponiamo quindi: $T (n) \leq c log_{2} n$ sostituendo otteniamo che:
> 
>  $T (n) \leq c log_{2} \frac{n}{2} + 1 = c(log_{2} n − 1) + 1 = c log_{2} n − c + 1$ Affinché la disuguaglianza
>   
>  $T (n) \leq c log_{2} n$ sia rispettata, è sufficiente che: $−c + 1 \leq 0$ cioè $c \geq 1$Anche in questo caso la nostra ipotesi è coerente ed è $T (n) = O(\log n)$
### TEOREMA MASTER 
$T(n)=aT\left( \frac{n}{b} \right)+F(n)$

$a\to$è il numero di sotto-problemi in cui viene suddiviso il problema
$b\to$ è di quanto viene ridotta la dimensione
$f(n)\to$ corrisponde al lavoro fatto alla radice dell'albero $n^{\log_{b}a}​$

#### CASO 1 $f(n)<n^{log_b a}​$
la funzione appartiene alla classe $\theta(n^{\log_b a})​$
#### CASO 2 $f(n) = n^{log_b a}$
la funzione appartiene alla classe $\theta(n^{\log_b a}\log n)$
#### CASO 3 $f(n)>n^{\log_b a}$ e $af(\frac{n}{b})\leq cf(n)$
la funzione appartiene alla classe $\theta(f(n))​$

**ESEMPI** 
**Ricerca Binaria** $T(n)=T\left( \frac{n}{2} \right)+1$
$F(n)=1=n^0$
$a=1, b=2\to\log_{2} 1=0=n^0=1$
$n^{0}\in \theta(n^{0}\log^{k}n)\to T(n)\in (\log n)$
**Merge Sort**
$T(n)=2T\left( \frac{n}{2} \right)+n$ 
$a=2, b=2$
$F(n)=n^{1}$  $n^{\log_{b}a}=n^1$
$n^{1}=T(n)\in\theta({n^{1}\log^{k}n})\to T(n\log n)$
**Algoritmo di Strassen**
$T(n)=7T\left( \frac{n}{2} \right)+n^{2}$
$a=7, b=2$
$F(n)=n^{2}$
$\log_{2} 7=n^{\log_{2} 7}$
$T(n)\in\theta(n^{\log_{2} 7)}$
**Generico**
$T(n)=T\left( \frac{n}{2} \right)+n$  $a=1, b=2$
$F(n)=n^{1}$ $n^{\log_{2} 1}=n^{0}$
$T(n)\in \theta(n)$
**Generico**
$T(n)=2T\left( \frac{n}{4} \right)+n$
$a=2,b=4$
$F(n)=n$ 
$\log_{4} 2<n^1$
$aF\left( \frac{n}{b} \right)\leq cn$ 
$T\left( \frac{n}{4} \right)<c\frac{n}{4}$
---
# Heap

L’heap si utilizza per implementare efficientemente le code con priorità.

Queste struttura dati serve i dati in ordine basandosi un un caratteristica chiamata **Chiave**.

> Spesso viene astratta come un albero e un array.

L'Heap è un albero con le seguenti caratteristiche:

- Binario: ogni nodo ha al massimo due figli
- Posizionale: è possibile distinguere figlio destro e figlio sinistro
- Completo: in ogni livello $i$ dell’albero sono presenti $2^i$ nodi
- Parzialmente ordinato: il valore di un nodo sarà sempre maggiore o uguale a quella dei suoi figli  
### COM’E’ FATTO UN HEAP
Un heap è un albero binario completo dove a differenza di un BST, nello Heap c’è solo una relazione

$$  
key[parent]\leq key[figlio]  
$$


> [!info] Questo è detto **Ordinamento parziale,** dove non c’è una relazione tra figlio destro e sinistro

>[!warning] NELL’ULTIMO LIVELLO I NODI VANNO DA SINISTRA A DESTRA, SENZA BUCHI TRA NODI



#### TIPI DI HEAP

- **Min Heap:** la chiave di un nodo è sempre minore o uguale a quella dei suoi figli (la radice contiene il minimo assoluto).
- **Max Heap:** la chiave di un nodo è sempre maggiore o uguale a quella dei suoi figli (la radice contiene il massimo).

## OPERAZIONI HEAP

#### MINIMO/MASSIMO
$\Theta(1)$ per il minimo nel min Heap

$\Theta(1)$ per il massimo nel max Heap
#### DECREASE KEY
Se riduciamo il valore di una chiave (Tipo un nodo che passa da $7$ a $1$, potremmo violare la proprietà dell’heap.
PROCEDURA: (Min heap)

1. si aggiorna il valore.
2. si confronta il nodo con il padre
3. se il nodo è minore del padre, si scambiano.
4. si ripete finché la proprietà è posseduta o si è raggiunta la radice

**CASO PEGGIORE: $O(\log n)$** in cui si risale tutto l’albero.
#### INSERIMENTO
PROCEDURA: (min Heap)

1. Inseriamo il nuovo nodo con valore $\infty$ alla fine.
2. Facciamo un Decrease key con il vero valore.
3. l’elemento risale fino alla sua posizione reale.
#### HEAPIFY
Si applica ad un nodo $i$ assumendo che i nodi sotto siano già Heap validi.
1. confronto la chiave di $i$ con il figlio sinistro $l$ e il figlio destro $r$
2. individuo il più piccolo tra $i,l,r$
3. se il minimo è non è $i$, scambio $i$ con il figlio minore
4. Richiamo ricorsivamente Heapify sul figlio appena scambiato.

> [!INFO] COMPLESSITA’: $\Theta(\log n)$
## HEAP CON ARRAY

- La radice è all’indice 1
- dato un nodo all’indice $i$:
    - il figlio sinistro si trova a $2i$
    - il figlio destro si trova a $2i+1$
    - il genitore a $\lfloor{\frac{i}{2}}\rfloor$

![[image.png]]


>[!tip] Queste operazioni possono essere fatte molto più efficientemente con gli shift
>- figlio sinistro i << 1
>- figlio destro (i << 1) + 1  

#### LEFT, RIGHT, PARENT

```cpp
int left(){
	return (2*i)+1; // perché l'array parte da 0
}

int right(){
	return (2*i)+2;
}

int parent(){
	return (i - 1) / 2;
}
```

#### HEAPIFY

```cpp
void min_heapify(int i){
int l = left(i);
int r = right(i);
int min = i;

if (l < size && array[l] < array[min]) min = l;
if (r < size && array[r] < array[min]) min = r;

if (min != i){
	int scambio = array[i];
	array[i] = array[min];
	array[min] = scambio;
	min_heapify(min);

}
}
```

```cpp
void max_heapify(int i){
int l = left(i);
int r = right(i);
int max= i;

if (l < size && array[l] > array[max]) max = l;
if (r < size && array[r] > array[max]) max = r;

if (min != i){
	int scambio = array[i];
	array[i] = array[max];
	array[max] = scambio;
	min_heapify(max);
}
```

#### INSERT

```cpp
void insert(int k){
	array[size++] = k;
	int i = size - 1;
	int p = parent(i);

	while(i > 0 && array[p]<array[i]){
		int scambio = array[i];
		array[i] = array[p];
		array[p] = scambio;
		i = p;
		p = parent(i);
	}
}
```

#### BUILD-MAX-HEAP

```cpp
 void BuildMaxHeap(){
	 for (int i = size/2 - 1; i >= 0; i--){
		 max_heapify(i);
	 }
 }
```

### HEAPSORT

L’algoritmo utilizza **Build-max-heap** per costruire un max-heap nell’array in input, l’elemento più grande è memorizzato nella radice, quindi ci basta scambiarlo con l’ultimo elemento nell’array per ordinarlo.

![[heapsort_heap_reduce.webp]]

> [!nfo] COMPLESSITA’ COMPUTAZIONALE: $O(n \log n)$
# Algoritmi di Ordinamento senza Confronti

## Counting Sort