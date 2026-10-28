 SCRITTO: PARTE A (RISPOSTA MULTIPLA, 10 DOMANDE IN 10 MINUTI), PARTE B (3 DOMANDE APERTE IN 45 MINUTI)
LABORATORIO: [[Laboratorio]]
VOTO: $\frac{SCRITTO \cdot 6 + LABORATORIO \cdot 3}{9}$ 
Libro: Elaborazione delle Immagini Digitali Pearson
# INTRODUZIONE AL CORSO
## IMMAGINI VETTORIALE e RASTER
>Immagine Vettoriale
>Più adatta per disegni e grafica, scalabile in grandezza con poca perdita di qualità nello zoom, ma poco adatta a immagini raffiguranti figure reali
>**Immagine Raster**
>Adatta per immagini raffiguranti figure reali, poco scalabile in grandezza e meno pesante a livello di spazio di memoria. (Tipologia trattata nel corso)

![[Screenshot 2026-10-01 at 12-42-09 Interazione & Multimedia - Lez 02 - I fondamenti 2025-2026.pdf.png|376]]
#### VETTORIZZAZIONE

![[Screenshot 2026-10-01 at 12-42-30 Interazione & Multimedia - Lez 02 - I fondamenti 2025-2026.pdf.png|immagine vettoriale con parametro Q=2]]
![[Screenshot 2026-10-01 at 12-42-51 Interazione & Multimedia - Lez 02 - I fondamenti 2025-2026.pdf.png|l'immagine vettoriale in questo caso per avere la precisione di una raster ha bisogno di 53 bit per Pixel (spropositato).]]

## RAPPRESENTAZIONE DI UN IMMAGINE 
$$f(x,y)=i(x,y)\cdot r(x,y)$$
$i =$ luce incidente all'oggetto (quanta luce c'è)
$r =$ luce riflessa
$$0<i(x,y)<\infty$$
$$0<r(x,y)<1$$
> Il nero assoluto fisicamente non esiste quindi non potremo mai avere il valore $0$

# OPERAZIONI SULLE IMMAGINI 
Le immagini sono Matrici ma le operazioni che eseguiamo non sono le medesime, infatti utilizzeremo le *operazioni affini* (Scaling, Rotazione, Traslazione, Shear).
### Neighborhood $N_p$
I vicini $N_{4}$ di un punto casuale sono 
![[Schermata_20261027_111246.png]]

I vicini $N_{8}$ di un punto casuale sono 
![[Schermata_20261027_111342.png]]
## Operazioni Affini

> [!warning] I PIXEL NON VENGONO MODIFICATI MA SPOSTATI

![[Schermata_20261027_110633.png|476]]

---
>[!info]
> $.X$ è il prodotto puntuale, ovvero un prodotto punto per punto 
   $X$ è il prodotto matriciale Generico.

###### ESEMPIO SCALING
$$\begin{cases}
c_x & 0 & 0 \\
0 & c_y & 0 \\
0 & 0 & 1
\end{cases}$$

se $c > 1$ l'immagine viene ingrandita
se $c= 1$ l'immagine resta uguale
se $c<1$ l'immagine viene rimpicciolita

$$(x,y)\cdot\begin{bmatrix}
2 & 0 & 0 \\
0 & 2 & 0 \\
0 & 0 & 1
\end{bmatrix}\implies \text{non si può fare}$$  $$(x,y,1)\cdot\begin{bmatrix}
2 & 0 & 0 \\
0 & 2 & 0 \\
0 & 0 & 1
\end{bmatrix}=[2x,2y,1]$$
###### ESEMPIO ROTAZIONE 
$$(x,y,1)\cdot\begin{bmatrix}
\cos \theta & \sin\theta & 0 \\ -\sin\theta & \cos\theta & 0 \\ 0  & 0 & 1
\end{bmatrix}=[x\cdot\cos\theta-y\cdot\sin\theta,x\cdot\sin\theta+y\cdot\cos\theta,1]$$
###### ESEMPIO TRASLAZIONE 
$$(x,y,1)\cdot\begin{bmatrix}
1 & 0 & 0 \\ 0 & 1 & 0 \\ t_{x} & t_{y} & 1
\end{bmatrix}=[x+t_{x}, y+t_{y},1]$$
##### ESEMPIO SHEAR 
$$(x,y,1)\cdot\begin{bmatrix}
1 & s_{h} & 0 \\ s_{v} & 1 & 0 \\ 0 & 0 & 1
\end{bmatrix}$$
