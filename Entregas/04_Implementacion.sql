--Trabajo realizado por Jacobo Arévalo Zea, id: 000516215

---------------------------------------------------------------------------------------------------------------------------
-- Crear usuario
CREATE USER jacoboaz IDENTIFIED BY ClaveSegura123;

-- Permitir conexión
GRANT CREATE SESSION TO jacoboaz;

-- Otorgar privilegios específicos
GRANT CREATE TABLE TO jacoboaz;
GRANT CREATE VIEW TO jacoboaz;
GRANT CREATE SEQUENCE TO jacoboaz;
GRANT CREATE PROCEDURE TO jacoboaz;
GRANT CREATE TRIGGER TO jacoboaz;
GRANT CREATE TYPE TO jacoboaz;

-- Asignar cuota de espacio
ALTER USER jacoboaz QUOTA UNLIMITED ON USERS;

-- Establecer esquema actual
ALTER SESSION SET CURRENT_SCHEMA = jacoboaz;

---------------------------------------------------------------------------------------------------------------------------

-- Creación de las tablas necesarias para el sistema de transporte (Estas instrucciones son las que directammente obtuve desde dbdiagram.io)
--En mi caso el orden de creación no importa porque las conexiones se hacen una vez ya están todas las tablas creadas

CREATE TABLE "Terminales" (
  "id_terminal" int GENERATED AS IDENTITY PRIMARY KEY,
  "nombre_terminal" varchar(50) UNIQUE
);

CREATE TABLE "Empresas" (
  "id_empresa" int GENERATED AS IDENTITY PRIMARY KEY,
  "nombre_empresa" varchar(50) UNIQUE
);

CREATE TABLE "Ciudades" (
  "id_ciudad" int GENERATED AS IDENTITY PRIMARY KEY,
  "nombre_ciudad" varchar(50) UNIQUE,
  "id_subregion" int
);

CREATE TABLE "Subregiones" (
  "id_subregion" int GENERATED AS IDENTITY PRIMARY KEY,
  "nombre_subregion" varchar(15) UNIQUE
);

CREATE TABLE "Tipo_Vehiculos" (
  "id_tipo_vehiculo" int GENERATED AS IDENTITY PRIMARY KEY,
  "nombre_tipo_vehiculo" varchar(20) UNIQUE
);

CREATE TABLE "Viajes" (
  "id_viaje" int GENERATED AS IDENTITY PRIMARY KEY,
  "id_terminal" int,
  "id_empresa" int,
  "id_ciudad_origen" int,
  "id_tipo_vehiculo" int,
  "fecha_salida" timestamp,
  "fecha_llegada" timestamp,
  "pasajeros" int
);

-- Creación de las relaciones entre las tablas
ALTER TABLE "Ciudades" ADD FOREIGN KEY ("id_subregion") REFERENCES "Subregiones" ("id_subregion");

ALTER TABLE "Viajes" ADD FOREIGN KEY ("id_terminal") REFERENCES "Terminales" ("id_terminal");

ALTER TABLE "Viajes" ADD FOREIGN KEY ("id_empresa") REFERENCES "Empresas" ("id_empresa");

ALTER TABLE "Viajes" ADD FOREIGN KEY ("id_ciudad_origen") REFERENCES "Ciudades" ("id_ciudad");

ALTER TABLE "Viajes" ADD FOREIGN KEY ("id_tipo_vehiculo") REFERENCES "Tipo_Vehiculos" ("id_tipo_vehiculo");

---------------------------------------------------------------------------------------------------------------------------
--CARGA DE LOS DATOS

--Lo primero que voy a hacer es cargar los datos de las subregiones, ciudades, empresas y terminales, esto lo hice 
--con un ciclo que me devulve cada dato que aparece en la columna sin repetirlo

-- Subregiones
INSERT INTO "Subregiones" ("nombre_subregion") VALUES ('CENTRO');
INSERT INTO "Subregiones" ("nombre_subregion") VALUES ('NORTE');
INSERT INTO "Subregiones" ("nombre_subregion") VALUES ('OCCIDENTE');
INSERT INTO "Subregiones" ("nombre_subregion") VALUES ('ORIENTE');
INSERT INTO "Subregiones" ("nombre_subregion") VALUES ('SUR');

-- Terminales
INSERT INTO "Terminales" ("nombre_terminal") VALUES ('TERMINAL DEL NORTE');
INSERT INTO "Terminales" ("nombre_terminal") VALUES ('TERMINAL DEL SUR');

-- Tipo_Vehiculos
INSERT INTO "Tipo_Vehiculos" ("nombre_tipo_vehiculo") VALUES ('AUTOMOVIL');
INSERT INTO "Tipo_Vehiculos" ("nombre_tipo_vehiculo") VALUES ('BUS');
INSERT INTO "Tipo_Vehiculos" ("nombre_tipo_vehiculo") VALUES ('CAMIONETA');
INSERT INTO "Tipo_Vehiculos" ("nombre_tipo_vehiculo") VALUES ('DUO BUS');
INSERT INTO "Tipo_Vehiculos" ("nombre_tipo_vehiculo") VALUES ('MICROBUS');

--Empresas
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('AUTOLEGAL S.A.');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('COOMOTOR');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('COOMUTRAN');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('COONCOR');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('COONORTE');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('COOPETRANSA');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('COOPTRATAM');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('COOTRABE');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('COOTRAMARINI');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('COOTRANAR');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('COOTRANGEL');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('COOTRANSANDINA');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('COOTRANSBET');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('COOTRANSDA');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('COOTRANSUROCCIDENTE');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('COOTRASAL');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('COOTRASANA');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('COOTRAUR');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('COOTRAYAL');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('COPETRAN');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('COTAXI');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('COTRACIBOL');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('EMPRESA ARAUCA S.A.');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('EXPRE - BELMIRA S.A.');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('EXPRESO BOLIVARIANO S.A.');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('EXPRESO BRASILIA S.A.');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('EXPRESO PALMIRA S.A.');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('EXPRESO SIDERAL S.A.');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('EXPRESO VALPARAISO CARAMANTA');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('FLOTA CORDOVA RIONEGRO S.A.');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('FLOTA EL CARMEN');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('FLOTA FREDONIA S.A.S');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('FLOTA GRANADA S.A.S');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('FLOTA MAGDALENA S.A.');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('FLOTA NORDESTE');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('FLOTA OCCIDENTAL S.A.');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('FLOTA OSPINA');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('FLOTA RIONEGRO S.A.');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('JUAN B VASQUEZ');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('LIPSA');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('MONTEBELLO');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('OMEGA LTDA');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('RAPIDO MEDELLIN RIONEGRO S.A.');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('RAPIDO OCHOA');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('RAPIDO TOLIMA S.A.');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('S.E A M TUR S A S');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('S.E CAVITRANS LTDA.');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('S.E COLTURTRANS S A S');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('S.E CONEXION SPECIAL');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('S.E COOMOEPAL LTDA');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('S.E COOMOTOR');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('S.E COONORTE');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('S.E COOPTRATAM');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('S.E COOTRANSPAL LTDA');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('S.E COOTRANSUROCCIDENTE');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('S.E COOTRAUR');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('S.E DOLPHIN EXPRESS S.A.');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('S.E ESPECIALES VALLE EXP');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('S.E EXPRE - BELMIRA S.A.');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('S.E FENIX S.A.S');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('S.E FLOTA EL CARMEN');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('S.E FUTUTRANSPORTE S.A.S');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('S.E GONZALEZ GAMBOA');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('S.E GRAN FARALLONES SAS');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('S.E O LOGISTICA INTEGRAL');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('S.E PRECOLTUR');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('S.E PROINTURES S.A.S');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('S.E RAMOS TOURS SAS');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('S.E RUTAS Y TRANSPORTE');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('S.E SAMATUR SAS');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('S.E SOTRARETIRO');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('S.E SOTRASANVICENTE & GUATAPE LA PIEDRA S.C.A.');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('S.E SOTRAUR S.A.');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('S.E TRANS CONCORD');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('S.E TRANS ESPECIALES DE OCCIDENTE');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('S.E TRANS IRRA S.A.');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('S.E TRANS LOGISTICA SERVICES');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('S.E TRANS Y TURISMO 1A S.A.S');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('S.E TRANSGLOBO');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('S.E TRANSLAVAL');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('S.E TRANSNARVAEZ S.A.S.');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('S.E TRANSPORTES LUZ S.A.S.');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('S.E YAMEYA');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('SERVICIOS ESPECIALES');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('SOC TRANS EJEC DEL OCCI Y SUR DE COL');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('SONAR');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('SOTRAGUR S.A');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('SOTRAMAR');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('SOTRANSODA S.A.S.');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('SOTRAPEÑOL');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('SOTRARETIRO');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('SOTRASABAR S.A');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('SOTRASANVICENTE & GUATAPE LA PIEDRA S.C.A.');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('SOTRAUR S.A.');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('SOTRAURABA');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('SOTRAYAR S.A');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('SURANDINA');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('TAX LA FERIA');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('TRANS CHACHAFRUTO');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('TRANS CISNEROS-ENTRERRIOS');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('TRANS GOMEZ HERNANDEZ');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('TRANS LOS FARALLONES');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('TRANS SUROESTE ANTIOQUEÑO');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('TRANSORIENTE');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('TRANSPORTES JERICO');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('TRANSPORTES LUZ S.A.S.');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('TRANSPORTES SALGAR S.A.');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('TRANSPORTES SEGOVIA');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('TRANSPORTES TAMESIS');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('TRANSUNIDOS');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('TRANSURAN S.A.');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('TRATAM S.A.S.');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('VELORIENTE S.C.A.');
INSERT INTO "Empresas" ("nombre_empresa") VALUES ('YAMEYA');

-- Ciudades (para este caso si es un poco mas complicado, ya que hay que tener en cuenta las subregiones, para esto hice un replace en excel y luego orgzanice los datos para hacer la inserción)
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('SAN JOSE DE LA MONTAÑA', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('ITUANGO', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('MONTERIA', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('SANTA FE DE ANTIOQUIA', 3);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('GUATAPE', 4);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('SAN PEDRO DE LOS MILAGROS', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('RIONEGRO', 4);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('ENTRERRIOS', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('YARUMAL', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('EL CARMEN DE VIBORAL', 4);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('SANTA ROSA DE OSOS', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('URRAO', 5);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('EL SANTUARIO', 4);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('PEREIRA', 1);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('SAN RAFAEL', 4);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('ANGOSTURA', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('EL PEÑOL', 4);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('AMALFI', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('DABEIBA', 3);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('ANDES', 5);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('MANIZALES', 1);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('ARGELIA', 4);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('DON MATIAS', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('FRONTINO', 3);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('PUERTO BERRIO', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('NECHI', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('CAROLINA', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('SOPETRAN', 3);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('NARIÑO', 4);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('CAMPAMENTO', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('VENECIA', 5);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('VEGACHI', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('JARDIN', 5);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('ALTAMIRA', 1);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('LA CEJA', 4);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('SAN JERONIMO', 3);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('EL RETIRO', 4);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('SAN VICENTE', 4);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('MARINILLA', 4);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('ARMENIA(QUINDIO)', 5);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('JERICO', 5);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('AMAGA', 1);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('ABEJORRAL', 1);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('PUERTO BOYACA', 1);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('SAN ROQUE', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('BETANIA', 5);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('COCORNA', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('LIBORINA', 3);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('TITIRIBI', 5);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('ABRIAQUI', 1);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('BUCARAMANGA', 4);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('LA UNION', 4);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('SAN PABLO(PORCE)', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('LA PINTADA', 5);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('CONCORDIA', 5);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('SALGAR', 5);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('BARRANCABERMEJA', 4);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('CRISTALES', 1);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('SANTA BARBARA', 5);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('SANTO DOMINGO', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('ANGELOPOLIS', 5);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('FREDONIA', 5);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('GUADALUPE', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('CAÑASGORDAS', 3);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('PUEBLO RICO', 5);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('MONTEBELLO', 5);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('CARMEN DEL ATRATO', 5);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('CARACOLI', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('BELMIRA', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('SONSON', 4);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('SAN CARLOS', 4);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('BOLIVAR', 5);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('BURITICA', 3);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('CARAMANTA', 5);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('SALAMINA', 5);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('SEGOVIA', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('SAN LUIS', 4);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('PUERTO SERVIEZ', 1);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('PUERTO TRIUNFO', 1);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('ARANZAZU', 5);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('YOLOMBO', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('ESTACION COCORNA', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('SAN PABLO(TAMESIS)', 5);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('SAN MIGUEL', 4);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('MACEO', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('GUINTAR', 3);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('YALI', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('BOGOTA', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('PITALITO', 5);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('IBAGUE', 1);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('TULUA', 5);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('ALEJANDRIA', 1);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('AGUADAS', 1);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('CAUCASIA', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('FILADELFIA(CALDAS)', 5);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('NEIVA', 5);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('CIMITARRA', 4);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('GOMEZ PLATA', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('TARAZA', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('PACORA', 1);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('CESTILLAL', 3);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('CALI', 5);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('MARMATO', 1);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('SAN JOSE DEL NUS', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('ANORI', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('TURBO', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('CONCEPCION', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('HELICONIA', 3);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('TAMESIS', 5);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('ARBOLEDA(CALDAS)', 5);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('NECOCLI', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('ANZA', 3);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('CISNEROS', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('SEVILLA(ANTIOQUIA)', 3);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('CUCUTA', 4);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('SABANALARGA', 3);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('LA DORADA(CALDAS)', 1);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('IPIALES', 5);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('APARTADO', 3);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('SAN ANDRES DE CUERQUIA', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('VALPARAISO', 5);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('MOCOA', 4);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('MONTELIBANO', 1);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('TOLEDO', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('CARTAGENA', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('GUARNE', 4);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('EL BAGRE', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('GRANADA', 4);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('TOLU', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('SALENTO', 5);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('QUIBDO', 3);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('AYAPEL', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('ZARAGOZA', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('SAN FRANCISCO', 4);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('CONDOTO', 5);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('PUERTO LIBERTADOR', 1);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('SINCELEJO', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('ARBOLETES', 3);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('ITSMINA', 3);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('PEQUE', 3);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('MAICAO', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('EBEJICO', 5);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('VALENCIA', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('GIRALDO', 3);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('BAJIRA', 3);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('BARRANQUILLA', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('PLANETA RICA', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('LA SIERRA', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('NUTIBARA', 3);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('CACERES', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('SANTA MARTA', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('ARMENIA(MANTEQUILLA)', 3);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('CHIGORODO', 3);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('PASTO', 5);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('ANSERMA(CALDAS)', 5);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('FLORENCIA(CAQUETA)', 4);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('QUINCHIA', 1);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('HORIZONTES', 3);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('RIOSUCIO', 5);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('LLANADAS', 3);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('VALLEDUPAR', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('CAICEDO', 5);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('MOMPOX - MEDELLIN', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('BUGA', 5);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('MAGANGUE', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('SAN MARCOS', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('POPAYAN', 5);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('OCAÑA', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('SEVILLA(VALLE)', 5);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('BUENAVENTURA', 5);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('SAN PEDRO DE URABA', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('DORADAL', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('FLORENCIA(CALDAS)', 5);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('PUERTO NARE', 1);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('PALMIRA', 5);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('EL BANCO', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('AGUACHICA', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('PLAYON', 3);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('TIERRA ALTA', 2);
INSERT INTO "Ciudades" ("nombre_ciudad", "id_subregion") VALUES ('PUERTO VENUS', 4);

--Commit para guardar los cambios
COMMIT;

--Para viajes lo que hice fue generar con ChatGPT un archivo excel listo para cargar, ya que es un poco mas complicado, este archivo esta en archivos complementarios 
--Lo que le pedi fue que me cambiara el archivo por los ids correspondientes y quitara subregiones, una vez realizado esto genere un script en python que lo que hace es
--leer el archivo y generar un insert por cada fila, este script tambien está en archivos complementarios, 
--una vez generado el archivo de inserción lo que hice fue cargarlo

