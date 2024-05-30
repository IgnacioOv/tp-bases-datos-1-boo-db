
-- Table: Asustadores
CREATE TABLE Asustadores (
  IDA INT NOT NULL,
  Nombre VARCHAR(50) NOT NULL,
  Especie VARCHAR(30) NOT NULL,
  Color VARCHAR(30) NOT NULL,
  Habilidad VARCHAR(30),
  PRIMARY KEY (IDA),
  constraint habilidad check (Habilidad in ('Invsibilidad', 'Rugido', 'Camaleon', 'Espinas', 'Formas', 'Garras' ))
)

;

-- Table: Ayudantes
CREATE TABLE Ayudantes (
  IDB INT not null,
  Nombre VARCHAR (50) not null,
  NivelLaboral VARCHAR(30) not null,
  Especie VARCHAR(30),
  AsustadorFrecuente int,
  PRIMARY KEY (IDB),
  foreign key (AsustadorFrecuente) references Asustadores (IDA),
  constraint nivel check (nivelLaboral in ('Bajo', 'Medio', 'alto'))
 )

;

-- Table: Ninos
CREATE TABLE Ninos (
  IDN INT not null,
  Edad INT not null check (Edad>0 and Edad<12),
  Miedos VARCHAR(100),
  Personalidad VARCHAR(30),
  primary key (idn)
)

;

-- Table: Puertas
CREATE TABLE Puertas (
  IDP INT not null,
  Ciudad VARCHAR(30) not null,
  Pais VARCHAR(30) not null,
  Region VARCHAR(30) not null,
  Nino int not null,
  primary key (IDP),
  foreign key (nino) references Ninos (IDN)
)

;

-- Table: Encuentros
CREATE TABLE Encuentros (
  IDP INT not null,
  IDA INT not null,
  IDB INT not null,
  Fecha date not null,
  Energia int not null,

  primary key (IDP,IDA,IDB,Fecha),
  foreign key (IDP) references Puertas (IDP),
  foreign key (IDA) references Asustadores (IDA),
  foreign key (IDB) references Ayudantes (IDB)
  )

;



-- Insertar datos en la tabla Asustadores
INSERT INTO Asustadores (IDA, Nombre, Especie, Color, Habilidad)
VALUES
(1, 'Sulley', 'Monstruo Grande y Peludo', 'Azul','Invsibilidad'),
(2, 'Randall', 'Monstruo con Ojos Múltiples', 'Morado', 'Rugido'),
(3, 'Mike', 'Monstruo Ojo Único', 'Verde', 'Camaleon'),
(4, 'Cyclo', 'Monstruo Ojo Único', 'Azul', 'Espinas'),
(5, 'Tiny', 'Monstruo Pequeño', 'Naranja', 'Formas'),
(6, 'PeeWee', 'Monstruo Pequeño', 'Verde', 'Garras'),
(7, 'Goliath', 'Monstruo Grande', 'Gris','Invsibilidad'),
(8, 'Titan', 'Monstruo Grande', 'Rojo', 'Rugido'),
(9, 'Scratchy', 'Monstruo con Garras', 'Negro', 'Camaleon'),
(10, 'SeeMore', 'Monstruo de Ojos Múltiples', 'Morado', 'Espinas'),
(11, 'Buzz', 'Monstruo Insectoide', 'Verde', 'Formas'),
(12, 'Slim', 'Monstruo Delgado', 'Azul', 'Garras'),
(13, 'Fuzz', 'Monstruo Peludo', 'Marrón','Invsibilidad'),
(14, 'Gus', 'Monstruo con Ojos Grandes', 'Amarillo', 'Rugido'),
(15, 'Whisper', 'Monstruo Fantasma', 'Blanco', 'Camaleon'),
(16, 'Spike', 'Monstruo con Púas', 'Verde', 'Espinas'),
(17, 'Flash', 'Monstruo Veloz', 'Plateado', 'Formas'),
(18, 'Rex', 'Monstruo con Dientes Afilados', 'Blanco', 'Garras'),
(19, 'Snappy', 'Monstruo con Pinzas', 'Naranja','Invsibilidad'),
(20, 'Gizmo', 'Monstruo Peludo', 'Gris', 'Rugido')

;

INSERT INTO Ayudantes (IDB, NivelLaboral, Especie, AsustadorFrecuente, Nombre)
VALUES
(1, 'Alto', 'Monstruo ojo unico',20, 'Mike'),
(2, 'Medio', 'Monstruo ojo unico',19, 'Cyclo'),
(3, 'Bajo', 'Monstruo ojo unico',18, 'MonoEye'),
(4, 'Alto', 'Monstruo pequeño',17, 'Tiny'),
(5, 'Medio', 'Monstruo pequeño',16, 'PeeWee'),
(6, 'Bajo', 'Monstruo pequeño',15, 'Junior'),
(7, 'Alto', 'Monstruo grande',14, 'Goliath'),
(8, 'Medio', 'Monstruo grande',13, 'Titan'),
(9, 'Bajo', 'Monstruo grande',12, 'Behemoth'),
(10, 'Alto', 'Monstruo con garras',11, 'Scratchy'),
(11, 'Medio', 'Monstruo con garras',10, 'Grippy'),
(12, 'Bajo', 'Monstruo con garras',9, 'Clawful'),
(13, 'Alto', 'Monstruo de ojos múltiples',8, 'SeeMore'),
(14, 'Medio', 'Monstruo de ojos múltiples',7, 'Looky'),
(15, 'Bajo', 'Monstruo de ojos múltiples',6, 'Spyder'),
(16, 'Alto', 'Monstruo insectoide',5, 'Buzz'),
(17, 'Medio', 'Monstruo insectoide',4, 'Flappy'),
(18, 'Bajo', 'Monstruo insectoide',3, 'Hopper'),
(19, 'Alto', 'Monstruo delgado',2, 'Slim'),
(20, 'Medio', 'Monstruo delgado',1, 'Skinny')

;

-- Insertar datos en la tabla Ninos
INSERT INTO Ninos (IDN, Edad, Miedos, Personalidad)
VALUES
(1,5, 'Oscuridad', 'Tímido'),
(2,6, 'Alturas', 'Curioso'),
(3,7, 'Insectos', 'Extrovertido'),
(4,8, 'Ruidos fuertes', 'Inteligente'),
(5,9, 'Alturas', 'Sensible'),
(6,10, 'Espacios reducidos', 'Amigable'),
(7,5, 'Lagartijas', 'Divertido'),
(8,6, 'Alturas', 'Creativo'),
(9,7, 'Ruidos fuertes', 'Valiente'),
(10,8, 'Oscuridad', 'Bromista'),
(11,9, 'Payasos', 'Serio'),
(12,10, 'Espacios reducidos', 'Generoso'),
(13,5, 'Ruidos fuertes', 'Reservado'),
(14,6, 'Alturas', 'Energético'),
(15,7, 'Animales', 'Pensativo'),
(16,8, 'Oscuridad', 'Amoroso'),
(17,9, 'Alturas', 'Aventurero'),
(18,10, 'Ruidos fuertes', 'Independiente'),
(19,5, 'Payasos', 'Sociable'),
(20,6, 'Insectos', 'Respetuoso')

;

INSERT INTO Puertas (IDP, Ciudad, Pais, Nino,Region)
VALUES
(1, 'Nueva York', 'Estados Unidos',20, 'América del Norte'),
(6, 'París', 'Francia',19, 'Europa'),
(11, 'Sídney', 'Australia',18, 'Australia'),
(16, 'Río de Janeiro', 'Brasil',17, 'América del Sur'),
(2, 'Los Ángeles', 'Estados Unidos',16, 'América del Norte'),
(7, 'Berlín', 'Alemania',15, 'Europa'),
(12, 'Tokio', 'Japón',14, 'Asia'),
(17, 'Buenos Aires', 'Argentina',13, 'América del Sur'),
(3, 'Toronto', 'Canadá',12, 'América del Norte'),
(8, 'Madrid', 'España',11, 'Europa'),
(13, 'Seúl', 'Corea del Sur',10, 'Asia'),
(18, 'Lima', 'Perú',9, 'América del Sur'),
(4, 'Ciudad de México', 'México',8, 'América del Norte'),
(9, 'Roma', 'Italia',7, 'Europa'),
(14, 'Pekín', 'China',6, 'Asia'),
(19, 'Santiago', 'Chile',5, 'América del Sur'),
(5, 'Londres', 'Reino Unido',4, 'Europa'),
(10, 'Moscú', 'Rusia',3, 'Europa'),
(15, 'Nueva Delhi', 'India',2, 'Asia'),
(20, 'Bogotá', 'Colombia',1, 'América del Sur')

;

INSERT INTO Encuentros (IDP, IDA,IDB, Fecha,Energia)
VALUES
(18,3,13,'2023-04-01',1305),
(3,16,16,'2023-04-02',124),
(18,9,1,'2023-04-03',706),
(14,19,17,'2023-04-04',1406),
(3,14,6,'2023-04-05',887),
(9,19,15,'2023-04-06',1153),
(1,12,8,'2023-04-07',1344),
(14,3,5,'2023-04-08',1371),
(18,5,10,'2023-04-09',700),
(17,4,7,'2023-04-10',998),
(9,2,2,'2023-04-11',104),
(7,18,14,'2023-04-12',780),
(10,16,16,'2023-04-13',197),
(20,11,1,'2023-04-14',835),
(8,20,15,'2023-04-15',913),
(6,13,8,'2023-04-16',1054),
(6,1,20,'2023-04-17',595),
(11,1,8,'2023-04-18',315),
(13,4,7,'2023-04-19',530),
(18,6,10,'2023-04-20',1473),
(13,3,6,'2023-04-21',316),
(10,14,10,'2023-04-22',942),
(18,5,14,'2023-04-23',357),
(19,8,19,'2023-04-24',1277),
(6,16,20,'2023-04-25',635),
(3,12,17,'2023-04-26',1080),
(13,2,12,'2023-04-27',312),
(1,13,15,'2023-04-28',364),
(16,3,8,'2023-04-29',598)


--miedos mas frecuentes
SELECT Miedos, COUNT(Miedos) AS Frecuencia
FROM Ninos
GROUP BY Miedos
ORDER BY Frecuencia DESC;

--ranking por monstruos de energia generada
SELECT A.Nombre, SUM(E.Energia) AS EnergiaGenerada
FROM Asustadores A
JOIN Encuentros E ON A.IDA = E.IDA
GROUP BY A.Nombre
ORDER BY EnergiaGenerada DESC;

--ranking de habilidades segun cuanta energia producen
SELECT Habilidad, EnergiaGenerada
FROM (
  SELECT A.Habilidad, SUM(E.Energia) AS EnergiaGenerada,
         ROW_NUMBER() OVER (ORDER BY SUM(E.Energia) DESC) AS Ranking
  FROM Asustadores A
  JOIN Encuentros E ON A.IDA = E.IDA
  GROUP BY A.Habilidad
) AS Rankings
ORDER BY Ranking;

--energia generada por rango de edad

with tabla as (

    SELECT N.Edad,
    CASE
        WHEN N.Edad <= 5 THEN '0-5'
        WHEN N.Edad <= 8 THEN '6-8'
        WHEN N.Edad <= 10 THEN '9-10'
    END AS RangoEdad,
    E.Energia
    FROM Ninos N
    JOIN Puertas P ON N.IDN = P.Nino
    JOIN Encuentros E ON P.IDP = E.IDP) 
SELECT  RangoEdad, SUM(Energia) AS EnergiaGenerada
FROM tabla group by RangoEdad

--Monstruos que mas veces asustaron
SELECT A.Nombre, COUNT(*) AS CantidadEncuentros
FROM Asustadores A
JOIN Encuentros E ON A.IDA = E.IDA	
GROUP BY A.Nombre
ORDER BY CantidadEncuentros DESC;

--Eventos que generon energia por debajo del promedio

select * from encuentros where energia<(select (sum(energia)/count(energia)) as promedio from encuentros)
order by energia asc
;

--promedio de energia por puerta regionalizado

Select  sum(energia)/count (region) as promedio, region from encuentros left join puertas on puertas.idp=encuentros.idp group by region


