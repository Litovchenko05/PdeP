linea(a,[plazaMayo,peru,lima,congreso,miserere,rioJaneiro,primeraJunta,nazca]).
linea(b,[alem,pellegrini,callao,pueyrredonB,gardel,medrano,malabia,lacroze,losIncas,urquiza]).
linea(c,[retiro,diagNorte,avMayo,independenciaC,plazaC]).
linea(d,[catedral,nueveJulio,medicina,pueyrredonD,plazaItalia,carranza,congresoTucuman]).
linea(e,[bolivar,independenciaE,pichincha,jujuy,boedo,varela,virreyes]).
linea(h,[lasHeras,santaFe,corrientes,once,venezuela,humberto1ro,inclan,caseros]).
combinacion([lima, avMayo]).
combinacion([once, miserere]).
combinacion([pellegrini, diagNorte, nueveJulio]).
combinacion([independenciaC, independenciaE]).
combinacion([jujuy, humberto1ro]).
combinacion([santaFe, pueyrredonD]).
combinacion([corrientes, pueyrredonB]).
% No hay dos estaciones con el mismo nombre.

% 1. estaEn/2: en qué línea está una estación.
% 2. distancia/3: dadas dos estaciones de la misma línea, cuántas estaciones hay entre ellas: por ejemplo, entre Perú y Primera Junta hay 5 estaciones.
% 3. mismaAltura/2: dadas dos estaciones de distintas líneas, si están a la misma altura (o sea, las dos terceras, las dos quintas, etc.), por ejemplo: Pellegrini y Santa Fe están ambas segundas.
% 4. granCombinacion/1: se cumple para una combinación de más de dos estaciones.
% 5. cuantasCombinan/2: dada una línea, relaciona esa línea con la cantidad de estaciones de esa línea que tienen alguna combinación. Por ejemplo, la línea C tiene 3 estaciones que combinan (avMayo, diagNorte e independenciaC).
% 6. lineaMasLarga/1: es verdadero para la línea con más estaciones.
% 7. viajeFacil/2: dadas dos estaciones, si puedo llegar fácil de una a la otra; esto es, si están en la misma línea, o bien puedo llegar con una sola combinación.


% 1.
estaEn(Estacion, Linea):-
    linea(Linea, Estaciones),
    member(Estacion, Estaciones).


% 2.
distancia(Estacion1, Estacion2, Distancia):-
    estaEn(Estacion1, Linea),
    estaEn(Estacion2, Linea),
    linea(Linea, Estaciones),
    nth1(Posicion1, Estaciones, Estacion1),
    nth1(Posicion2, Estaciones, Estacion2),
    Distancia is abs(Posicion1 - Posicion2).


% 3.
mismaAltura(Estacion1, Estacion2):-
    estaEn(Estacion1, Linea1),
    estaEn(Estacion2, Linea2),
    not(sonIguales(Linea1, Linea2)),
    linea(Linea1, Estaciones1),
    linea(Linea2, Estaciones2),
    nth1(Posicion1, Estaciones1, Estacion1),
    nth1(Posicion2, Estaciones2, Estacion2),
    sonIguales(Posicion1, Posicion2).

sonIguales(Valor, Valor).


% 4.
granCombinacion(Combinacion):-
    combinacion(Combinacion),
    length(Combinacion, Cantidad),
    Cantidad > 2.


% 5.
cuantasCombinan(Linea, Cantidad):-
    findall(Estacion, (combinacion(Combinaciones), member(Estacion, Combinaciones), estaEn(Estacion, Linea)), EstacionesQueCombinan),
    length(EstacionesQueCombinan, Cantidad).


% 6.
lineaMasLarga(Linea):-
    linea(Linea, Estaciones),
    forall((linea(OtraLinea, OtrasEstaciones), not(sonIguales(OtraLinea, Linea))), esMasLarga(Estaciones, OtrasEstaciones)).

esMasLarga(Estaciones1, Estaciones2):-
    length(Estaciones1, Largo1),
    length(Estaciones2, Largo2),
    Largo1 > Largo2.


% 7.
viajeFacil(Estacion1, Estacion2):-
    combinacion(Combinacion),
    member(Estacion1, Combinacion),
    member(Estacion2, Combinacion).
    % no me parece necesario añadir una verificacion de que no sean iguales.

viajeFacil(Estacion1, Estacion2):-
    estaEn(Estacion1, Linea1),
    estaEn(Estacion2, Linea2),
    sonIguales(Linea1, Linea2).