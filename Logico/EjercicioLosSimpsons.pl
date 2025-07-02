padreDe(abe, abbie).
padreDe(abe, homero).
padreDe(abe, herbert).
padreDe(clancy, marge).
padreDe(clancy, patty).
padreDe(clancy, selma).
padreDe(homero, bart).
padreDe(homero, hugo).
padreDe(homero, lisa).
padreDe(homero, maggie).

madreDe(edwina, abbie).
madreDe(mona, homero).
madreDe(gaby, herbert).
madreDe(jacqueline, marge).
madreDe(jacqueline, patty).
madreDe(jacqueline, selma).
madreDe(marge, bart).
madreDe(marge, hugo).
madreDe(marge, lisa).
madreDe(marge, maggie).
madreDe(selma, ling).


tieneHijo(Padre) :-
    padreDe(Padre, _).

tieneHijo(Madre) :-
    madreDe(Madre, _).


compartenPadre(Hijo1, Hijo2) :-
    padreDe(Padre, Hijo1),
    padreDe(Padre, Hijo2),
    Hijo1 \= Hijo2.

compartenMadre(Hijo1, Hijo2) :-
    madreDe(Madre, Hijo1),
    madreDe(Madre, Hijo2),
    Hijo1 \= Hijo2.

hermanos(Hijo1, Hijo2) :-
    compartenMadre(Hijo1, Hijo2),
    compartenPadre(Hijo1, Hijo2).

medioHermanos(Hijo1, Hijo2) :-
    compartenPadre(Hijo1, Hijo2).

medioHermanos(Hijo1, Hijo2) :-
    compartenMadre(Hijo1, Hijo2).


tioDe(Tio, Sobrino) :-
    padreDe(Padre, Sobrino),
    hermanos(Padre, Tio).

abueloDe(Abuelo, Nieto) :-
    padreDe(Abuelo, Hijo),
    (padreDe(Hijo, Nieto);madreDe(Hijo, Nieto)).

abueloMultiple(Abuelo) :-
    abueloDe(Abuelo, Nieto1),
    abueloDe(Abuelo, Nieto2),
    Nieto1 \= Nieto2.

descendiente(Ancestro, Descendiente) :- %caso base
    padreDe(Ancestro, Descendiente).

descendiente(Ancestro, Descendiente) :-
    padreDe(Ancestro, Alguien),
    descendiente(Alguien, Descendiente).