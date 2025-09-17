% De los musicales conocemos que canciones las conforman
% De los thrillers conocemos los asesinatos que ocurren (el asesino y la victima)
% De las peliculas de ciencia ficcion concemos el año en el que se situan
% De los dramas se sabe los segmentos "dramaticos" que la componen. Puede ser "peleas", "casorios", "asesinatos", "engaños", "funerales" o "medio hermanos"
% De las peliculas de comedia y drama no importa nada mas

% pelicula(Titulo, Genero).
% trabajaEn(Titulo, Actor).
% premio(Premio, Actor).
% cancion(Pelicula, Cancion).
% asesinato(Pelicula, Asesino, Victima).
% anio(Pelicula, año).
% segmento(Pelicula, Segmento).

pelicula(lalaland, musical).
cancion(laland, cityOfStars).

pelicula(viernes13, thriller).
asesinato(viernes13, jason, fede).
asesinato(viernes13, gripe, lucas).
asesinato(viernes13, jason, rana).

pelicula(avatar, cienciaFiccion).
anio(avatar, 2154).

pelicula(orgulloYPrejuicio, drama).
segmento(orgulloYPrejuicio, casorio).


% 1 - Saber si una peli de drama es un culebrón mexicano. Esto sucede cuando tiene una pelea, un casorio, un engaño y medio hermanos.
% 2 - Saber si una peli de ciencia ficción es futurista, o sea que la peli ocurre en el año 3000 o más.
% 3 - Saber si un thriller es de puro suspenso, o sea que no muere nadie.
% 4 - Saber si un thriller es de un asesino serial. Esto se cumple si solo hay un asesino.
% 5 - Saber si un thriller es un slasher. Esto se cumple si hay 5 o más asesinatos en la pelicula.


culebron(Pelicula):-
    pelicula(Pelicula, drama),
    segmento(Pelicula, pelea),
    segmento(Pelicula, casorio),
    segmento(Pelicula, engaño),
    segmento(Pelicula, medioHermanos).

futurista(Pelicula):-
    pelicula(Pelicula, cienciaFiccion),
    anio(Pelicula, Anio),
    Anio >= 3000.

puroSuspenso(Pelicula):-
    pelicula(Pelicula, thriller),
    not(asesinato(Pelicula, _, _)).

asesinoSerial(Pelicula):-
    pelicula(Pelicula, thriller),
    asesinato(Pelicula, Asesino, _),
    forall(asesinato(Pelicula, OtroAsesino, _), Asesino = OtroAsesino). %Asesino = OtroAsesino se puede delegar a otro predicado: esElMismo(Asesino, Asesino).

slasher(Pelicula):-
    pelicula(Pelicula, thriller),
    cantidadAsesinatos(Pelicula, Cantidad),
    Cantidad >= 5.

cantidadAsesinatos(Pelicula, Cantidad):-
    findall(Victima, asesinato(Pelicula, _, Victima), Victimas),
    length(Victimas, Cantidad).