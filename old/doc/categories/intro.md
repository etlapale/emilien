---
title: Introduction à la théorie des catégories
author: Émilien Tlapale
mathjax: on
---

# Catégories

Une catégorie est définie par la donnée d’une collection d’objets et d’une
collection de morphismes entre des paires d’objets. Un morphisme $f$ de
domaine $a$ et codomaine $b$ sera noté :

$$ f : a \to b    \qquad\mathrm{ou}\qquad     a \xrightarrow{f} b. $$

Si le codomaine d’un morphisme $f$ correspond au domaine d’un morphisme $g$,
alors leur composé $g \circ f$ existe dans la catégorie. De plus la
composition est associative, si le domaine d’un morphisme $h$ correspond au
codomaine de $g$, on a $h \circ (g \circ f) = (h \circ g) \circ f$.

À chaque objet $b$ est associé un morphisme identité $1_b : b \to b$ tel que,
si $f : a \to b$ et $g : b \to c$, alors

$$ 1_b \circ f = f      \qquad\mathrm{et}\qquad         g \circ 1_b = g$$

# Diagrammes

Un *diagramme fini* possède un nombre fini d’objets et un nombre fini de
morphismes entre ces objets.

Les propriétés algébriques de l’identité peuvent s’exprimer par le diagramme
commutatif

$$
\begin{xy}
\xymatrix {
a \ar[r]^f \ar[rd]_f & b \ar[d]^{1_b} \ar[rd]^g \\
                     & b \ar[r]_g         & c
}
\end{xy}
$$

# Limites et colimites

Sur un diagramme $D$, on définit un *cône* comme un objet $c$ accompagné de
morphismes $f_i : c \to d_i$, tel que, pour chaque morphisme $g$ de $D$, on
ait commutativité dans le diagramme 

$$
\begin{xy}
\xymatrix {
d_i \ar[rr]^g & & d_j \\
& c \ar[ul]^{f_i} \ar[ur]_{f_j} &
}
\end{xy}
$$

Une *limite* est un cône ${f_i : c \to d_i}$ tel que, pour tout autre cône
${f'_i : c' \to d_i}$, il existe un unique morphisme $g : c \to c'$ pour
lequel le diagramme

$$
\begin{xy}
\xymatrix {
& d_i & \\
c \ar[ur]^{f_i} \ar[rr]_g && c' \ar[ul]_{f'_i}
}
\end{xy}
$$

soit commutatif.

# Complétude

Une catégorie est *complète* si chaque diagramme qu’elle contient possède une
limite. Elle est *cocomplète* si chaque diagramme possède une colimite, et
*bicomplète* si elle est à la fois complète et cocomplète.  Une catégorie est
*finiment complète* si elle possède une limite pour chaque diagramme fini.

# Foncteurs

On note $F : \mathcal{C} \to \mathcal{D}$ le foncteur entre les catégories
$\mathcal{C}$ et $\mathcal{D}$ qui associe à chaque $\mathcal{C}$-objet $c$, un
$\mathcal{D}$-objet $Fc$, et à chaque $\mathcal{C}$-morphisme $f : a \to b$, un
$\mathcal{D}$-morphisme $Ff : Fa \to Fb$. Pour tout $\mathcal{C}$-objet $a$, et
tous $\mathcal{C}$-morphismes $f$ et $g$ tel que $f \circ g$ existe dans
$\mathcal{C}$, le foncteur $F$ doit vérifier :

$$
F 1_a = 1_{Fa}   \qquad\mathrm{et}\qquad F(f \circ g) = Ff \circ Fg
$$
