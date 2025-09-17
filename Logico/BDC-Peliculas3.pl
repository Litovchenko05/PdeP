% pelicula(Titulo, Genero).
% actor(Titulo, Actor).
% premio(Premio, Actor).

pelicula(starWars3, accion).
pelicula(terminator, accion).
pelicula(lalaland, musical).
pelicula(volverAlFuturo, cienciaFiccion).
pelicula(orgulloYPrejuicio, drama).
pelicula(dune, cienciaFiccion).
pelicula(viernes13, thriller).
trabajaEn(starWars3, nataliePortman, actor).
trabajaEn(starWars3, evanMcGregor, actor).
trabajaEn(terminator, schwarzenegger, actor).
trabajaEn(lalaland, emmaStone, actor).
trabajaEn(lalaland, ryanGosling, actor).
trabajaEn(orgulloYPrejuicio, keiraKnightley, actor).
trabajaEn(volverAlFuturo, michaelFox, actor).
trabajaEn(volverAlFuturo, christopherLoyd, actor).
trabajaEn(dune, timothyChalamet, actor).
trabajaEn(viernes13, kevinBacon, actor).
trabajaEn(starWars3, georgeLucas, director).
trabajaEn(starWars3, johnWilliams, compositor([marchaImperial], vsavc)).
%trabajaEn(starWars3, johnWilliams, Rol([marchaImperial])). <--- No se puede
%trabajaEn(starWars3, johnWilliams, Rol). <--- Se puede
%trabajaEn(starWars3, johnWilliams, compositor(Obras)). <--- Se puede
trabajaEn(starWars3, stevenSpielberg, productor(100000)).
trabajaEn(dune, feli, guionista(30000)).
premio(mejorActriz, nataliePortman).
premio(mejorActriz, emmaStone).




critica(Pelicula, Estrellas):-
    pelicula(Pelicula, _),
    findall(Puntaje, puntaje(Pelicula, Puntaje), Puntajes),
    sum_list(Puntajes, Estrellas).


puntaje(Pelicula, Puntaje):-
    trabajaEn(Pelicula, Trabajador, Rol),
    puntajeRol(Rol, Trabajador, Puntaje).


puntajeRol(productor(_), stevenSpielberg, 10).
puntajeRol(productor(Presupuesto), _, Puntaje):-
    Puntaje is Presupuesto - 0,01.

puntajeRol(director, Director, 2):-
    premio(mejorDirector, Director).

puntajeRol(compositor(Piezas, _), _, Puntaje):-
    length(Piezas, CantidadDePiezas),
    Puntaje is CantidadDePiezas * 0,25.

puntajeRol(guionista(Palabras), _, Puntaje):-
    Puntaje is Palabras / 1000.

puntajeRol(actor, ryanGosling, 5).
puntajeRol(actor, Actor, 5):-
    premio(mejorActriz, Actor).
puntajeRol(actor, Actor, 1):-
    not(premio(mejorActriz, Actor)),
    premio(_, Actor).

% Un predicado es polimorfico si tiene muchas formas