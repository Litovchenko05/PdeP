% predicado/aridad

% materia/2
% materia(Nombre, Año).
materia(pardigmas, 2).
materia(sintaxis, 2).
materia(analisis1, 2).
materia(analisis2, 2).
materia(desarrolloSW, 3).

% materia es un predicado de aridad 2, que tiene 5 clausulas 

% profesor/3
% profesor(Profesor, Materia, Curso).
profesor(fede, paradigmas, k2103).
profesor(fede, desarrolloSW, k3053).

% Estas 6 clausulas anteriores son HECHOS

% esFacil/1
% una materia es fácil si está después de tercer año, si la da el profesor lautaro, o si es ingeniería y sociedad.
esFacil(NombreMateria):-
    materia(NombreMateria, Anio),
    Anio > 3.

% el :- indica que viene una regla

% Principio de Universo Cerrado: Lo que esta en la base de conocimiento es verdadero, y lo que no está es falso

esFacil(NombreMateria):-
    profesor(lautaro, NombreMateria, _).

% Cuando no nos interesa algo, usamos como en funcional un guion bajo (_)

esFacil(ingenieriaYSociedad).


% profeDe/2
% relaciona a un profesor con los años en los que da clase.
profeDe(NombreDeProfesor, Anio):-
    profesor(NombreDeProfesor, Materia, _),
    materia(Materia, Anio).


% Algunos ejemplos hechos en clase:
% Predicado que me diga las correlativas
correlativa(paradigmas, discreta).
correlativa(paradigmas, algoritmos).
correlativa(analisis2, analisis1).
correlativa(desarrolloSW, paradigmas).


% sonCorrelativas/2
% se cumple si dos materias son correlativas directa o indirectamente.
sonCorrelativas(MateriaMadre, Materia):-
    correlativa(MateriaMadre, Materia).

sonCorrelativas(MateriaMadre, Materia):-
    correlativa(MateriaMadre, MateriaEnElMedio),
    sonCorrelativas(MateriaEnElMedio, Materia).


% expertoEnElTema/1
% se cumple para un profesor que da dos materias correlativas.
expertoEnElTema(NombreDeProfesor):-
    profesor(NombreDeProfesor, MateriaMadre, _),
    profesor(NombreDeProfesor, Materia, _),
    sonCorrelativas(MateriaMadre, Materia).


% masDeUnCursoDe/2
% relaciona a un profesor y una materia si da más de un curso de esa materia
masDeUnCursoDe(NombreDeProfesor, Materia):-
    profesor(NombreDeProfesor, Materia, Curso),
    profesor(NombreDeProfesor, Materia, OtroCurso),
    Curso \= OtroCurso. % Importante que esta linea esté al final

%legajo/2
%legajo(nombre, nro legajo)
legajo(fede, 1231662).
legajo(ale, 1595465).
legajo(joaco, 2026399).
legajo(mili, 2140998).
legajo(francisco, 22233260).

cursada(fede, k2026, 6, 6).
cursada(ale, k2003, 6, 6).
cursada(joaco, k2003, 10, 6).
cursada(fede, k2026, 2, 4).
cursada(fede, k2026, 8, 8).

curso(k2026, sintaxis, 2007).
curso(k2026, sintaxis, 2010).
curso(k2026, paradigmas, 2010).
curso(k2003, sintaxis, 2017).
curso(k2003, sintaxis, 2022).

%existe alguna cursada donde promedia 6 o más
aprueba(Alumno, Materia) :-
    promediaMasDe(Alumno, Materia, 6).

promociona(Alumno, Materia) :-
    promediaMasDe(Alumno, Materia, 8).
    
promedio(Alumno, Materia, Promedio) :-
    cursada(Alumno, Curso, Nota1, Nota2),
    curso(Curso, Materia, _),
    Promedio is (Nota1 + Nota2) / 2.

promediaMasDe(Alumno, Materia, NotaMinima) :-
    promedio(Alumno, Materia, Promedio),
    Promedio >= NotaMinima.

recursa(Alumno, Materia) :-
    haCursado(Alumno, Materia),
    not(aprueba(Alumno, Materia)). %aca es importante ligar Alumno y Materia, ya que sino tenemos problema de inversibilidad

haCursado(Alumno, Materia) :-
    curso(Codigo, Materia, _),
    cursada(Alumno, Codigo, _ , _).

ingresante(Alumno) :-
    legajo(Alumno, _),
    not(haCursado(Alumno, _)).