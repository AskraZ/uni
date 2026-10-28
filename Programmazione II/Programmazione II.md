```
	# Alberi
```

[[Lezione 21-22 Alberi.pdf]]

---

Si dice "grafo diretto" un insieme di nodi collegati mediante archi direzionati.

- Un albero è un grafo diretto in cui ogni nodo può avere un solo arco entrante ed un qualunque numero di archi uscenti (generalmente 1 o 2).
- Se un nodo non ha archi uscenti, è detto ==foglia==.
- se un nodo non ha archi entranti è detto ==radice==.

![[Schermata del 2026-06-19 12-20-05.png|293]]

Gli alberi sono di natura ricorsiva: un Albero è un insieme di nodi che

- è vuoto
- oppure ha un nodo denominato radice da cui discendono zero o più sottoalberi che essi stessi alberi.

![[Schermata del 2026-06-19 12-23-00.png]]

- dato un nodo, i nodi che appartengono al suo sottoalbero si dicono suoi discendenti.
- dato un qualunque nodo, i nodi che si trovano nel cammino della radice ad esso sono i suoi ascendenti.

---

![[Schermata del 2026-06-19 13-31-36.png|485]]

- Il livello (profondità) di un nodo è la sua distanza dalla radice.
- la radice ha livello 0, i suoi figli livello 1, i suoi nipoti livello 2 e così via
- i fratelli hanno lo stesso ma non tutti i nodi dello stesso livello sono fratelli
- la profondità di un albero è la lunghezza del cammino più lungo dalla radice ad una foglia

---

- La radice ha profondità 0
- La profondità di un nodo non radice è 1 + la profondità del genitore

```c
void profondita(u){
	p = 0;
	while (u.genitore != null){
		p = p + 1;
		u = u.genitore;
	}
}
```

##### ALBERI BILANCIATI

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Programmazione%20II/PROGRAMMAZIONE%20II.md#alberi-bilanciati)

Un albero di profondità h è bilanciato se:

1. Tutte le foglie si trovano allo stesso livello.
2. Dato k numero massimo di figli per nodo, ogni nodo ha esattamente k figli.

![[Schermata del 2026-06-20 10-18-23.png]]

##### ALBERO BINARIO

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Programmazione%20II/PROGRAMMAZIONE%20II.md#albero-binario)

Un albero è binario se ogni nodo non ha più di due figli, il sinistro ed il destro. ![[images.png|323]]

> Un albero binario si dice ==degenere== se ogni nodo diverso da una foglia ha un solo figlio.

- Ad ogni livello n un albero binario può contenere al più 2n nodi.
- Il numero totale di nodi di un albero (incluse le foglie) di profondità n è al massimo 2n+1−1
- La profondità di un albero bilanciato è O(log(n))

## IMPLEMENTAZIONE (C++)

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Programmazione%20II/PROGRAMMAZIONE%20II.md#implementazione-c)

###### POSIZIONAMENTO

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Programmazione%20II/PROGRAMMAZIONE%20II.md#posizionamento)

x nodo generico, y è un nodo nel sottoalbero sinistro di radice x allora y.valore≤x.valore, sennò y.valore≥x.valore. I nuovi elementi vanno sempre inseriti come foglie, e si avanza con la regola dettata precedentemente:

```c
void insert(Node* u, int a){
	Node* x = u;
	Node* y = NULL;
	while (x != nullptr){
		y = x;
		if (a < x.valore){
			x = x.left;
		}
		else{
			x = x.right;
		}
	}
	new newNode* = new Node;
	newNode.father = y;
	if (y == nullptr) u = newNode;
	else if(newNode.valore < y.valore){
		y.left = newNode;
	}
	else{
		y.right = newNode;
	}
	
}
```

#### TIPOLOGIE DI VISITA DI UN ALBERO BINARIO

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Programmazione%20II/PROGRAMMAZIONE%20II.md#tipologie-di-visita-di-un-albero-binario)

- Preorder La visita preorder visita prima la radice, poi il sottoalbero sinistro e per ultimo quello destro. ![[Schermata del 2026-06-20 11-07-40.png]]
- Inorder La visita inorder visita prima il sottoalbero sinistro, poi la radice e per ultimo quello destro ![[Schermata del 2026-06-20 11-08-59.png]]
- postOrder la visita postorder visita prima il sottoalbero sinistro, poi quello destro e per ultimo la radice

> COSTO COMPLESSIVO O(n)

##### RICERCA IN UN ALBERO BINARIO

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Programmazione%20II/PROGRAMMAZIONE%20II.md#ricerca-in-un-albero-binario)

```c
Node* cerca(Node* T, int a){
	if (T == nu### DEFINIZIONE TEORICA llptr || a == t.valore){return T;}
	if (a < T.valore){return cerca(T.left, a);}
	else {return cerca(T.right, a);}
}
```

> COSTO O(n) n = profondità albero

###### MASSIMO E MINIMO

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Programmazione%20II/PROGRAMMAZIONE%20II.md#massimo-e-minimo)

```c
	int max(Node* T){
		Node* x = T;
		while(x.right != nullptr){
		x = x.right;
		}
		return x;
	}
	
	int min(Node* T){
		Node* x = T;
		while (x.left != nullptr){
			x = x.left;
		}
		return x;
	}
```

##### SUCCESSORE

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Programmazione%20II/PROGRAMMAZIONE%20II.md#successore)

```c
	Node* successore(Node* x){
if (x->right != nullptr){
	return min(x->right);
}
Node* y = x->father;
while(y != nullptr && x==y->right){
x = y;
y = y->father;
}
return y 
}

```

##### CANCELLAZIONE DI UN NODO (IMPORTANTE)

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Programmazione%20II/PROGRAMMAZIONE%20II.md#cancellazione-di-un-nodo-importante)

Ci sono tre casi da considerare:

- Z non ha figli
- Z ha un solo figlio
- Z ha due figli

###### CASO 1

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Programmazione%20II/PROGRAMMAZIONE%20II.md#caso-1)

Cancelliamo Z e modifichiamo il puntatore del padre a nullptr.

###### CASO 2

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Programmazione%20II/PROGRAMMAZIONE%20II.md#caso-2)

Cancelliamo Z e modifichiamo il puntatore del padre al figlio di Z

###### CASO 3

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Programmazione%20II/PROGRAMMAZIONE%20II.md#caso-3)

- Cerchiamo il successore y di Z.
- y prende la posizione di Z nell'albero.
- la rimanente parte del sottoalbero destro (di Z) diventa il nuovo albero destro di y

```c
void Trapianta(Node* Root, Node* u, Node* v){
			if (u->father == nullptr){Root = v}
	else if(u == u->father.left()){u->father().left() = v;}
	else{u->father.right = v;}
	if (v != nullptr){v.father = u.father;}
}


void Delete(Node* Root, Node* z){
	if (z->left() == nullptr){
		Trapianta(Root, z, z->right);
	}
	else if(z->right() == nullptr){
		Trapianta(Root, z, z->left());
	}
	else{
		y = min(z->right());
		if (y.father != z){
			Trapianta(Root, y, y->right());
			y->right() = z->right();
			y->right->father() = y;
		}
		Trapianta(Root, z, y)
		y->left = z->left();
		y->left->father = y;
	}
	}
	
}
```

# ALGORITMI

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Programmazione%20II/PROGRAMMAZIONE%20II.md#algoritmi)

#### BUBBLE SORT

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Programmazione%20II/PROGRAMMAZIONE%20II.md#bubble-sort)

[5,3,8,4,2]

- **Inizializzazione:** L'algoritmo parte dal primo elemento dell'array (indice 0).
- **Confronto Adiacente:** Si confronta l'elemento corrente con quello immediatamente successivo (l'elemento all'indice i con l'elemento all'indice i+1).
    - _Esempio:_ Confronta **5** e **3**.
- **Scambio (Swap):** Se l'elemento di sinistra è maggiore di quello di destra, i due elementi vengono scambiati di posto.
    - _Esempio:_ Poiché 5 > 3, li scambiamo. L'array diventa `[3, 5, 8, 4, 2]`.
- **Avanzamento:** Il puntatore si sposta in avanti di una posizione e ripete il confronto fino alla fine dell'array.
    - _Esempio (continuazione):_ Confronta **5** e **8**. Nessuno scambio (5 non è maggiore di 8).
    - Confronta **8** e **4**. Scambio! L'array diventa `[3, 5, 4, 8, 2]`.
    - Confronta **8** e **2**. Scambio! L'array diventa `[3, 5, 4, 2, 8]`.
- **Fine del primo "Passaggio" (Pass):** Una volta arrivati in fondo, l'elemento più grande in assoluto (in questo caso l'8) ha "galleggiato" fino all'ultima posizione. Quella posizione è ora considerata **ordinata** e bloccata.
- **Ripetizione:** L'algoritmo ricomincia dal primo elemento. Questa volta, però, si ferma al penultimo elemento, perché l'ultimo è già al posto giusto.
- **Condizione di Terminazione:** L'algoritmo continua a fare passaggi completi. Si ferma **solo** quando riesce a completare un intero passaggio dall'inizio alla fine senza effettuare nemmeno uno scambio. Questo è il segnale matematico che tutto è perfettamente in ordine.

```c
void bubblesort(vector<int>& array){
	for (int i = 0; i < array.size() - 1; i++){
		for (int j = 0; j < array.size() - 1; j++){
			if (array[j]>array[j+1]){
				int aux = array[j+1];
				array[j+1] = array[j];
				array[j] = aux;
			}
		}
	}
	
}
```

#### INSERTION SORT

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Programmazione%20II/PROGRAMMAZIONE%20II.md#insertion-sort)

[5,3,8,4,2] L'algoritmo divide idealmente l'array in due parti: una **sotto-lista ordinata** (inizialmente composta solo dal primo elemento) e una **sotto-lista non ordinata** (il resto dell'array).

1. **Inizializzazione:** Il primo elemento (indice 0, valore **5**) è considerato già ordinato. La sotto-lista ordinata è `[5]`.
2. **Selezione della "Chiave" (Key):** L'algoritmo prende il primo elemento della parte _non ordinata_ per inserirlo al posto giusto. Partiamo quindi dall'indice 1 (valore **3**). La chiave è **3**.
3. **Confronto e Spostamento (Shift):** Si confronta la chiave con gli elementi della sotto-lista ordinata, partendo da destra verso sinistra.
    - _Confronto:_ 3 è minore di 5? Sì.
    - _Spostamento:_ Copiamo il 5 una posizione più a destra per fare spazio. L'array temporaneamente diventa `[5, 5, 8, 4, 2]`.
4. **Inserimento:** Poiché non ci sono altri elementi a sinistra con cui confrontarsi, inseriamo la chiave (3) nello spazio appena liberato.
    - L'array diventa `[3, 5, 8, 4, 2]`. Ora la sotto-lista ordinata è `[3, 5]`.
5. **Avanzamento e Ripetizione:**
    - **Passaggio successivo (chiave = 8):** Confrontiamo l'8 con il 5. L'8 è maggiore, quindi è già al posto giusto. Nessuno spostamento necessario. L'array rimane `[3, 5, 8, 4, 2]`. La sotto-lista ordinata è `[3, 5, 8]`.
    - **Passaggio successivo (chiave = 4):**
        - Confrontiamo il 4 con l'8: 4 < 8. Spostiamo l'8 a destra. (Array temp: `[..., 8, 8, ...]`)
        - Confrontiamo il 4 con il 5: 4 < 5. Spostiamo il 5 a destra. (Array temp: `[..., 5, 5, 8, ...]`)
        - Confrontiamo il 4 con il 3: 4 > 3. Ci fermiamo.
        - Inseriamo il 4 nello spazio libero. L'array diventa `[3, 4, 5, 8, 2]`.
    - **Ultimo passaggio (chiave = 2):** Il 2 viene confrontato con 8, 5, 4 e 3. Essendo più piccolo di tutti, tutti questi numeri vengono spostati di una posizione verso destra. Alla fine, il 2 viene inserito in prima posizione. L'array finale è `[2, 3, 4, 5, 8]`.

```c
void insertionsort(vector<int>& array){
	int i, key, j;
	for (i = 1; i < array.size(); i++){
	key = array[i];
	j = i - 1;
	while (j >= 0 && array[j] > key){
		array[j+1] = array[j];
		j = j - 1;
	}
	array[j+1] = key;
	}
}
```

#### SELECTION SORT

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Programmazione%20II/PROGRAMMAZIONE%20II.md#selection-sort)

[5,3,8,4,2] L'array è idealmente diviso in una parte sinistra **ordinata** (inizialmente vuota) e una parte destra **non ordinata** (inizialmente tutto l'array).

1. **Passaggio 1 (Indice di partenza 0):**
    - L'algoritmo si posiziona sul primo elemento (valore **5**). Assume temporaneamente che questo sia il "minimo assoluto".
    - Inizia a scansionare il resto dell'array (`3, 8, 4, 2`) per verificare se esiste un numero più piccolo.
    - Trova il **3** (è minore di 5? Sì. Nuovo minimo provvisorio: 3).
    - Trova l'8 (è minore di 3? No).
    - Trova il 4 (è minore di 3? No).
    - Trova il **2** (è minore di 3? Sì. Nuovo minimo assoluto trovato: 2).
    - Fine della scansione. Scambia l'elemento di partenza (5) con il minimo assoluto trovato (2).
    - L'array diventa `[2, 3, 8, 4, 5]`. Il numero 2 è ora nella sua posizione definitiva.
2. **Passaggio 2 (Indice di partenza 1):**
    - Si posiziona sul secondo elemento (valore **3**). Lo assume come minimo.
    - Scansiona il resto (`8, 4, 5`).
    - Non trova nessun numero minore di 3.
    - Il 3 è già al suo posto. Nessuno scambio necessario.
    - L'array rimane `[2, 3, 8, 4, 5]`. La parte ordinata è `[2, 3]`.
3. **Passaggio 3 (Indice di partenza 2):**
    - Si posiziona sul terzo elemento (valore **8**).
    - Scansiona il resto (`4, 5`).
    - Trova il **4** (minore di 8). Nuovo minimo provvisorio.
    - Trova il 5 (non è minore di 4).
    - Fine scansione. Scambia l'elemento di partenza (8) con il minimo trovato (4).
    - L'array diventa `[2, 3, 4, 8, 5]`. Parte ordinata: `[2, 3, 4]`.
4. **Passaggio 4 (Indice di partenza 3):**
    - Si posiziona sul quarto elemento (valore **8**).
    - Scansiona il resto, che in questo caso è solo l'ultimo elemento (valore **5**).
    - Il 5 è minore di 8.
    - Scambia l'8 con il 5.
    - L'array diventa `[2, 3, 4, 5, 8]`.
5. **Fine:** Essendo rimasto un solo elemento (l'8 nell'ultima posizione), deve essere per forza il più grande di tutti. L'array è completamente ordinato.

```c
	void swap(int* xp, int* yp){
		int temp = *xp;
		*xp = *yp;
		*yp = temp;
	}
	
	void selectionsort(vector<int>& arr){
		int i, j, min_idx;
		for (i = 0; i < arr.size() - 1; i++){
		min_idx = i;
		for (j = i + 1; j < n; j++){
			if (arr[j] < arr[min_idx]){
				min_idx = j;
			}
		}
		swap(&arr[min_idx], &arr[i]);
		}
	}
```

#### MERGE SORT

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Programmazione%20II/PROGRAMMAZIONE%20II.md#merge-sort)

[5,3,8,4,2] Il processo si divide in due grandi fasi: la **Divisione** e l'**Unione** (Merge). **Fase 1: La Divisione (Divide)** L'algoritmo non fa nessun confronto in questa fase. Taglia semplicemente l'array a metà, ricorsivamente, finché ogni sotto-array contiene un solo elemento. Un array di un solo elemento è, per definizione, già ordinato.

1. **Divisione 1:** L'array `[5, 3, 8, 4, 2]` viene diviso circa a metà.
    - Sinistra: `[5, 3, 8]`
    - Destra: `[4, 2]`
2. **Divisione 2:** Dividiamo ancora i sotto-array.
    - Da `[5, 3, 8]` otteniamo `[5]` e `[3, 8]`. (Poi `[3, 8]` si divide in `[3]` e `[8]`).
    - Da `[4, 2]` otteniamo `[4]` e `[2]`.
3. **Fondo toccato:** Ora abbiamo 5 array indipendenti: `[5]`, `[3]`, `[8]`, `[4]`, `[2]`. La fase di divisione è finita. **Fase 2: L'Unione (Conquer / Merge)** Ora l'algoritmo inizia a ricostruire l'array fondendo le coppie di sotto-array. _Il trucco è che fonde sempre due array che sono già ordinati tra loro_.
4. **Primo livello di unione:**
    - Fonde `[3]` e `[8]`. Poiché 3 < 8, il risultato è `[3, 8]`.
    - Fonde `[4]` e `[2]`. Poiché 2 < 4, il risultato è `[2, 4]`.
    - Il `[5]` per ora aspetta. Stato attuale: `[5]`, `[3, 8]`, `[2, 4]`.
5. **Secondo livello di unione:**
    - Fonde `[5]` con `[3, 8]`. Per farlo, l'algoritmo guarda i primi elementi di entrambi:
        - 5 contro 3. Vince il 3. L'array fuso inizia con `[3]`.
        - 5 contro 8. Vince il 5. Aggiunge il 5: `[3, 5]`.
        - Rimane l'8. Lo aggiunge. Risultato: `[3, 5, 8]`.
    - Lo stato attuale è ora: `[3, 5, 8]` e `[2, 4]`.
6. **Ultimo Merge:** Fonde `[3, 5, 8]` con `[2, 4]`.
    - Confronta i "capofila" (3 e 2). Il 2 è minore, lo prende. (Nuovo array: `[2]`)
    - Confronta i nuovi capofila (3 e 4). Il 3 è minore. (Nuovo array: `[2, 3]`)
    - Confronta 5 e 4. Il 4 è minore. (Nuovo array: `[2, 3, 4]`)
    - Confronta 5 e vuoto. Prende il 5 e poi l'8 rimasto.
    - Risultato finale: `[2, 3, 4, 5, 8]`.

```c
void merge(vector<int> arr, int left, int mid, int right){
	int i, j, k;
	int n1 = mid - left + 1;
	int n2 = right - mid;
	
	vector<int> leftvec(n1), rightvec(n2);
	
	for (i = 0; i < n1; i++){
		leftvec[i] = arr[left + 1];
	}
	for (j = 0; j < n2; j++){
		rightvec[j] = arr[mid + 1 + j];
	}
	
	i = 0;
	j = 0;
	k = left;
	
	while (i < n1 && j < n2){
		if (leftvec[i] <= rightvec[j]){
			arr[k] = leftvec[i];
			i++;
		}
		else{
		arr[k] = rightvec[i];
		j++
		}
		k++;
	}
	
	while(i < n1){
			arr[k] = leftvec[i];
			i++;
			k++;
	}
	
	while (j < n2){
		arr[k] = rightvec[j];
		j++;
		k++;
	}
}

void mergesort(vector<int>& arr, int left, int right){
	if (left < right){
		int mid = left + (right - left) / 2;
		
		mergesort(arr, left, mid);
		mergesort(arr, mid + 1, right);
		
		merge(arr, left, mid, right);
	}
}

```

#### QUICK SORT

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Programmazione%20II/PROGRAMMAZIONE%20II.md#quick-sort)

[5,1,8,4,3]

#### **1. Scelta del Pivot**

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Programmazione%20II/PROGRAMMAZIONE%20II.md#1-scelta-del-pivot)

L'algoritmo sceglie un elemento dell'array che farà da "termine di paragone". Esistono varie strategie (il primo, l'ultimo, uno a caso). Scegliamo l'ultimo elemento come pivot: il numero **3**.

#### **2. Il Partizionamento

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Programmazione%20II/PROGRAMMAZIONE%20II.md#2-il-partizionamento)

Questo è il passo cruciale. L'obiettivo è riorganizzare l'array in modo che:

- Tutti gli elementi **minori o uguali** al pivot finiscano alla sua **sinistra**.
- Tutti gli elementi **maggiori** al pivot finiscano alla sua **destra**. Per farlo, l'algoritmo usa due puntatori (uno che scorre l'array e uno che "tiene il segno" di dove finisce la zona dei numeri più piccoli):
- Confronta **5** con il pivot (3). 5 > 3, non fa nulla.
- Confronta **1** con il pivot (3). 1 < 3. L'algoritmo sposta l'1 all'inizio e lo scambia con il 5. L'array diventa: `[1, 5, 8, 4, 3]`.
- Confronta **8** con il pivot (3). 8 > 3, non fa nulla.
- Confronta **4** con il pivot (3). 4 > 3, non fa nulla.
- **Posizionamento del Pivot:** Ora che la scansione è finita, l'algoritmo sa esattamente dove deve stare il 3. Lo scambia con il primo elemento della zona dei "maggiori" (il 5).
- L'array diventa: `[1, 3, 8, 4, 5]`. Il pivot **3** si trova ora nella sua **posizione finale e definitiva**. Non si muoverà più da lì.

#### **3. Ricorsione

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Programmazione%20II/PROGRAMMAZIONE%20II.md#3-ricorsione)

Ora l'algoritmo si accorge di avere due sotto-array separati dal pivot:

- A sinistra: `[1]` (ha un solo elemento, quindi è già ordinato).
- A destra: `[8, 4, 5]`. Il Quicksort viene applicato nuovamente (in modo ricorsivo) sul sotto-array di destra `[8, 4, 5]`
- Sceglie un nuovo pivot: **5**.
- Partiziona: il 4 è minore di 5, l'8 è maggiore. Dopo gli scambi e il posizionamento del pivot, il sotto-array diventa `[4, 5, 8]`.
- Il 5 è fisso. Restano `[4]` a sinistra e `[8]` a destra (entrambi da un solo elemento, quindi ordinati). Unendo mentalmente i pezzi, l'array è completamente ordinato: `[1, 3, 4, 5, 8]`.

```c
int partition(vector<int>& arr, int low, int high){
	int pivot = arr[high];
	
	int i = (low - 1);
	
	for (int j = low; j <= high - 1; j++){
		if (arr[j] <= pivot){
			i++;
			swap(arr[i+1], arr[high]);
			return (i + 1);
		}
	}
}

void quicksort(vector <int>& arr, int low, int high){
	if (low < high){
	int pi = partition(arr, low, high);
	
	quicksort(vec, low, pi - 1);
	quicksort(vec, pi + 1, high);
	}
}
```

# STRUTTURE DATI

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Programmazione%20II/PROGRAMMAZIONE%20II.md#strutture-dati)

#### PILA

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Programmazione%20II/PROGRAMMAZIONE%20II.md#pila)

```c
class Pila{
    private:
        Node* Head;
    public:
        Pila(){Head = nullptr;}
        bool empty(){
            if (Head == nullptr){
                return true;
            }
            return false;
        }
        void push(Studente* el){
            Node* newNode = new Node;
            newNode->nextPtr = Head;
            Head = newNode;
            newNode->student = el;
        }
        void pop(){
            if (!empty()){
            Node* temp = Head;
            Head = Head->nextPtr;
            delete temp;
            }
            else{
                cerr << "Pila vuota!" << endl;
                return;
            }
};

```

#### CODA

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Programmazione%20II/PROGRAMMAZIONE%20II.md#coda)

```c
template <typename T> class Queue{
    private:
        Node<T>* Head;
        Node<T>* tail;
    public:
    Queue(){Head = nullptr; tail = nullptr;}
    void enqueue(T el){
        Node<T>* newNode = new Node<T>();
        newNode->setElement(el);
        if (Head == nullptr){
            Head = newNode;
            tail = newNode;
        }
        else{  
            tail->setNext(newNode);
            tail = newNode;
       }

    }
    void dequeue(){
        Node<T>* aux = Head;
        Head = Head->getNext();
        delete aux;
    }
```

# Complessità

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Programmazione%20II/PROGRAMMAZIONE%20II.md#complessit%C3%A0)

[[Lezione 17 Complessità - Parte 1.pdf]] [[Lezione 18 Complessità - Parte 2.pdf]]

---

Costo di un algoritmo è in funzione di n (dimensione dei dati in input):

- tempo = numero di operazioni RAM eseguite
- spazio = numero di celle di memoria occupate (escluse quelle per contenere l'input)

---

###### COSTO FUNZIONE

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Programmazione%20II/PROGRAMMAZIONE%20II.md#costo-funzione)

il costo di una funzione è dato dal costo del suo corpo (più il passaggio dei parametri).

> le funzioni ricorsive hanno un discorso separato.

il costo di una sequenza di istruzioni è la somma dei costi delle istruzioni nella sequenza.

---

##### CASO PEGGIORE E CASO MEDIO

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Programmazione%20II/PROGRAMMAZIONE%20II.md#caso-peggiore-e-caso-medio)

complessità o costo computazione f(n) in tempo o in spazio di un algoritmo:

- caso peggiore = costo max tra tutte le possibili istanze di input con dimensione dati n
- caso medio = costo mediato tra tutte le istanze di input aventi dimensioni pari a n

##### COMPLESSITÀ TEMPORALE

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Programmazione%20II/PROGRAMMAZIONE%20II.md#complessit%C3%A0-temporale)

per un algoritmo, la complessità temporale è determinata contando il numero di operazioni aritmetiche e logiche, accesso ai file, letture e scritture in memoria, etc..

PRIMA IPOTESI:

- Tempo impiegato proporzionale al numero di operazioni eseguite (ciascuna a costo unitario)
- Non ci si riferisce a una specifica macchina

---

il tempo impiegato per risolvere un problema dipende sia dall'algoritmo utilizzato sia dalla dimensione dei dati in questione.

---

SECONDA IPOTESI:

- È sufficiente stabilire il comportamento asintotico della funzione quando le dimensioni dell'input tendono a ∞
- Si usa a questo scopo la notazione asintotica

Mediante l'analisi asintotica valutiamo le performance di un algoritmo in termini di dimensioni di input. non calcoliamo il tempo (o lo spazio) impiegato dall'algoritmo, ma come possono variare con il variare della dimensione di input.

### O-grande

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Programmazione%20II/PROGRAMMAZIONE%20II.md#o-grande)

O(g(n))=f(n):∃c,n0>0:0≤f(n)≤c⋅g(n)    ∀n>n0 TIPI DI COMPLESSITÀ

- Costante 1,2,3…
- Sotto-lineare log⁡n,nc con c<1
- Lineare n
- Polinomiale n∗log⁡n,n2,n3,…,nc con c>1
- Esponenziale cn,…nn… ![[1734702748422.jpeg|415]]

#### ESEMPI

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Programmazione%20II/PROGRAMMAZIONE%20II.md#esempi)

```c
for (i=n/2; i <= n; i++){ // O(n/2) ma la costante si annulla quindi O(n)
	for (j=1; j <= n; j = 2*j){ // O(log n)
		for (K=1; k <= n; k=k*2){ // O(log n)
			count++;
		}
	}
}
```

## O(n⋅log2⁡n)

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Programmazione%20II/PROGRAMMAZIONE%20II.md#oncdot-log2_n)

```c
int ricercalineare(int vettore[], int dim, int chiave){
	for (int i = 0; i < dim; i++){
		if (vettore[i] == chiave) return i;
	}
	return -1;
} 
```

CASO MIGLIORE: 1 CASO PEGGIORE: n CASO MEDIA: n+12 -> O(n)

## DIVIDE ET IMPERA

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Programmazione%20II/PROGRAMMAZIONE%20II.md#divide-et-impera)

Algoritmi ricorsivi, si basano su tre passaggi:

- Dividi: spezza il problema in più sottoproblemi.
- Conquista: risolvere i sottoproblemi ricorsivamente.
- Combina: combina le soluzione dei sottoproblemi.

#### RELAZIONE DI RICORRENZA

[](https://github.com/AskraZ/Uni/blob/main/Primo%20Anno/Programmazione%20II/PROGRAMMAZIONE%20II.md#relazione-di-ricorrenza)

La complessità di una funzione ricorsiva può essere espressa mediante una relazione di ricorrenza.

- Sommatorie Quando un algoritmo contiene un ciclo, il suo tempo di esecuzione può essere espresso come sommatoria dei tempi impiegati in ogni esecuzione del corpo del ciclo.