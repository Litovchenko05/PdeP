paisContinente(americaDelSur, argentina).
paisContinente(americaDelSur, bolivia).
paisContinente(americaDelSur, brasil).
paisContinente(americaDelSur, chile).
paisContinente(americaDelSur, ecuador).
paisContinente(europa, alemania).
paisContinente(europa, espania).
paisContinente(europa, francia).
paisContinente(europa, inglaterra).
paisContinente(asia, aral).
paisContinente(asia, china).
paisContinente(asia, india).
paisContinente(asia, afganistan).
paisContinente(asia, nepal).

paisImportante(argentina).
paisImportante(alemania).

limitrofes(argentina, brasil).
limitrofes(bolivia, brasil).
limitrofes(bolivia, argentina).
limitrofes(argentina, chile).
limitrofes(espania, francia).
limitrofes(alemania, francia).
limitrofes(nepal, india).
limitrofes(china, india).
limitrofes(nepal, china).
limitrofes(afganistan, china).

ocupa(argentina, azul).
ocupa(bolivia, rojo).
ocupa(brasil, verde).
ocupa(chile, negro).
ocupa(ecuador, rojo).
ocupa(alemania, azul).
ocupa(espania, azul).
ocupa(francia, azul).
ocupa(inglaterra, azul).
ocupa(aral, verde).
ocupa(china, negro).
ocupa(india, verde).
ocupa(afganistan, verde).

continente(americaDelSur).
continente(europa).
continente(asia).

jugador(Jugador):-
    ocupa(_, Jugador).

pais(Pais):-
    paisContinente(_, Pais).

noOcupaPaisenContinente(Jugador, Pais, Continente):-
    paisContinente(Continente, Pais),
    not(ocupa(Pais, Jugador)).

% 1. estaEnContinente/2: relaciona un jugador y un continente si el jugador ocupa al menos un país en el continente.
estaEnContinente(Jugador, Continente):-
    continente(Continente), %podria no ir
    paisContinente(Continente, Pais),
    ocupa(Pais, Jugador).

% 2. ocupaContinente/2: relaciona un jugador y un continente si el jugador ocupa totalmente el continente
ocupaContinente(Jugador, Continente):-
    continente(Continente),
    jugador(Jugador),
    forall(paisContinente(Continente, Pais), ocupa(Pais, Jugador)).

% 3. cubaLibre/1: es verdadero para un país si nadie lo ocupa.
cubaLibre(Pais):-
    noOcupaPaisenContinente(_, Pais, _).

% 4. leFaltaMucho/2: relaciona a un jugador si está en un continente pero le falta ocupar otros 2 países o más.
leFaltaMucho(Jugador, Continente):-
    estaEnContinente(Jugador, Continente),
    noOcupaPaisenContinente(Jugador, Pais1, Continente),
    noOcupaPaisenContinente(Jugador, Pais2, Continente),
    Pais1 \= Pais2.

% 5. sonLimitrofes/2: relaciona dos países si son limítrofes considerando que si A es limítrofe de B, entonces B también es limítrofe de A.
sonLimitrofes(Pais1, Pais2):-
    limitrofes(Pais1, Pais2).

sonLimitrofes(Pais1, Pais2):-
    limitrofes(Pais2, Pais1).

% 6. tipoImportante/1: un jugador es importante si ocupa todos los países importantes.
tipoImportante(Jugador):-
    jugador(Jugador),
    forall(paisImportante(Pais), ocupa(Pais, Jugador)).

% 7. estaEnElHorno/1: un país está en el horno si todos sus países limítrofes están ocupados por el mismo jugador que no es el mismo que ocupa ese país.
estaEnElHorno(Pais):-
    pais(Pais),
    ocupa(Jugador, Pais),
    forall(sonLimitrofes(Pais, PaisLimitrofe), ocupa(PaisLimitrofe, JugadorOcupante)),
    Jugador \= JugadorOcupante.

%8. esCompartido/1: un continente es compartido si hay dos o más jugadores en él.
esCompartido(Continente):-
    continente(Continente),
    estaEnContinente(Jugador1, Continente),
    estaEnContinente(Jugador2, Continente),
    Jugador1 \= Jugador2.