% Enunciado: https://docs.google.com/document/d/14dB2qtvwres6RSX4tvD1xIWCqAeva_iUOi9EH_k7t4s/edit?tab=t.0

% Para cada punto:
%   1. Analizar su lógica.
%   2. Dar la cantidad de cláusulas, predicados y su aridad.
%   3. Identificar los errores conceptuales, si los hubiera
%   4. Proponer una solución que aproveche los conceptos del paradigma.
%   5. Analizar si los predicados son totalmente inversibles e inversibilizarlos si no lo fueran.


% Punto 1
todosSiguenA(Rey) :-
    personaje(Rey),
    forall(personaje(Personaje), sigueA(Personaje, Rey)).

% esta mal porque cuando encuentre uno solo que lo siga, va a estar diciendo que "todosSiguenA(Rey)" es verdadero, cuando solo hay uno que lo sigue en principio.
sigueA(lyanna, jon).
sigueA(jorah, daenerys).
%% etc


% Punto 2 - Error de desaprobación CASI directa

ciudadInteresante(Ciudad) :-
    antigua(Ciudad),
    findall(Lugar, esCopado(Lugar, Ciudad), LugaresCopados),
    length(LugaresCopados, Cantidad),
    Cantidad > 10.

esCopado(Lugar, Ciudad):-
    puntoDeInteres(Lugar, Ciudad),
    puntoDeInteresCopado(Lugar).

puntoDeInteresCopado(bar(CantidadDeCervezas)):-
    CantidadDeCervezas > 4.
puntoDeInteresCopado(museo(cienciasNaturales)).
puntoDeInteresCopado(estadio(Capacidad)):-
    Capacidad > 40000.


% Si necesito que no pase --> not
% Si necesito que pase al menos una vez (existe) --> un hecho
% Si necesito que pase 2 veces --> /=
% Si ya necesito que pase más de 2 veces --> findall

% Solo usamos findall para saber la cantidad de posibles respuestas, si solo queremos saber si existe uno, no hace falta

% Punto 3 - Error de desaprobación directa
inFraganti(Delito, Delincuente) :-
  cometio(Delito, Delincuente),
  testigo(Delito, _).

% Punto 4
viejoMaestro(Pensador) :-
    pensamiento(Pensador, _),
    forall(pensamiento(Pensador, Pensamiento), llegaANuestrosDias(Pensamiento)).


% Punto 5 - Error de desaprobación directa
numeroDeLaSuerte(Persona, Numero) :-
    Persona \= joaquin,
    diaDelNacimiento(Persona, Numero).

numeroDeLaSuerte(joaquin, 2).


% Punto 6
obraMaestra(Compositor, Obra) :-
    compositor(Compositor, Obra),
    movimiento(Obra,_),
    forall(movimiento(Obra, Movimiento), cumpleCondiciones(Movimiento)).


% Punto 7
puedeComer(analia, Comida) :-
    ingrediente(Comida, _),
    forall(ingrediente(Comida, Ingrediente), (not(contieneCarne(Ingrediente)), not(contieneHuevo(Ingrediente)), not(contieneLeche(Ingrediente)))).

puedeComer(evaristo, asado).
%% etc


% Punto 8 - Error de repetición de lógica - Puede llegar a ser de desaprobación
costoEnvio(Paquete, PrecioTotal) :-
    findall(PrecioItem, precioItemPaquete(Paquete, PrecioItem), Precios),
    sumlist(Precios, PrecioTotal).

precioItemPaquete(Paquete, Precio) :-
    itemPaquete(Paquete, libro(Precio)).

precioItemPaquete(Paquete, Precio) :-
    itemPaquete(Paquete, mp3(_, Duracion)),
    Precio is Duracion * 0.42.  

precioItemPaquete(Paquete, PrecioOferta) :-
    itemPaquete(Paquete, productoEnOferta(_, PrecioOferta)).
