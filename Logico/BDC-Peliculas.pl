% pelicula(Titulo, Genero).
% trabajaEn(Titulo, Actor).
% premio(Premio, Actor).
% critica(Pelicula, Estrellas)

pelicula(starWars3, accion).
pelicula(terminator, accion).
pelicula(lalaland, musical).
pelicula(volverAlFuturo, cienciaFiccion).
pelicula(orgulloYPrejuicio, drama).
pelicula(dune, cienciaFiccion).
pelicula(viernes13, thriller).
trabajaEn(starWars3, nataliePortman).
trabajaEn(starWars3, evanMcGregor).
trabajaEn(terminator, schwarzenegger).
trabajaEn(lalaland, emmaStone).
trabajaEn(lalaland, ryanGosling).
trabajaEn(orgulloYPrejuicio, keiraKnightley).
trabajaEn(volverAlFuturo, michaelFox).
trabajaEn(volverAlFuturo, christopherLoyd).
trabajaEn(dune, timothyChalamet).
trabajaEn(viernes13, kevinBacon).
premio(mejorActriz, nataliePortman).
premio(mejorActriz, emmaStone).
critica(terminator, 5).
critica(terminator, 3).
critica(terminator, 2).

%imperdible - No hay actor que no haya ganado un premio
imperdible(Titulo):-
    pelicula(Titulo, _), %limitamos nuestro universo a peliculas
    not((trabajaEn(Titulo, Actor), not(premio(_, Actor)))).

imperdible2(Titulo):-
    pelicula(Titulo, _),
    not(actorSinPremio(Titulo, _)). %pongo un _ porque no me interesa ningun actor en particular y no quiero ligarlo.

actorSinPremio(Titulo, Actor):-
    trabajaEn(Titulo, Actor),
    not(premio(_, Actor)).

%Hay otra forma de hacer el predicado, vamos a utilizar forall
%imperdible3 - Todos los actores ganaron un premio
imperdible3(Titulo):-
    pelicula(Titulo, _), %esta clausula hace que la consulta sea valida con valores variables
    forall(trabajaEn(Titulo, Actor), premio(_, Actor)). %actor es la variable libre

%actorDramatico - Si un actor trabaja en todas peliculas dramaticas
actorDramatico(Actor):-
    trabajaEn(_, Actor), %al igual que antes, esta clausula hace que la consulta sea valida con valores variables
    forall(trabajaEn(Titulo, Actor), pelicula(Titulo, drama)). %pelicula es la variable libre

%unanime - Cuando todas las criticas fueron las mismas
unanime(Titulo):-
    pelicula(Titulo, _),
    critica(Titulo, CriticaBase),
    forall(critica(Titulo, CriticaSiguiente), sonLaMisma(CriticaBase, CriticaSiguiente)).

sonLaMisma(Critica, Critica).

%criticaMasAlta - Me dice si la critica de una pelicula es la mayor
criticaMasAlta(Titulo, CriticaMayor):-
    critica(Titulo, CriticaMayor),
    forall(critica(Titulo, CriticaMenor), CriticaMayor >= CriticaMenor).