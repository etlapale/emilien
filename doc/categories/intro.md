---
title: Introduction à la théorie des catégories
author: Émilien Tlapale
mathjax: on
---

# Définition

Une catégorie est définie par la donnée d’une collection d’objets et d’une
collection de morphismes entre des paires d’objets. Un morphisme $f$ de
domaine $a$ et codomaine $b$ sera noté :

$$f : a \to b    \qquad\mathrm{ou}\qquad     a \xrightarrow{f} b.$$

Si le codomaine d’un morphisme $f$ correspond au domaine d’un morphisme $g$,
alors leur composé $g \circ f$ existe dans la catégorie. De plus la
composition est associative, si le domaine d’un morphisme $f$ correspond au
codomaine de $g$, on a $h \circ (g \circ f) = (h \circ g) \circ f$.

À chaque objet $b$ est associé un morphisme identité $1_b : b \to b$ tel que,
si $f : a \to b$ et $g : b \to c$, alors :

$$ 1_b \circ f = f      \qquad\mathrm{et}\qquad         g \circ 1_b = g.$$
