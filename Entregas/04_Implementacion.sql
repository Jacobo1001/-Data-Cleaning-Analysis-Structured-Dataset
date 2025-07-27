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

-- Creación de las tablas necesarias para el sistema de transporte
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

ALTER TABLE "Ciudades" ADD FOREIGN KEY ("id_subregion") REFERENCES "Subregiones" ("id_subregion");

ALTER TABLE "Viajes" ADD FOREIGN KEY ("id_terminal") REFERENCES "Terminales" ("id_terminal");

ALTER TABLE "Viajes" ADD FOREIGN KEY ("id_empresa") REFERENCES "Empresas" ("id_empresa");

ALTER TABLE "Viajes" ADD FOREIGN KEY ("id_ciudad_origen") REFERENCES "Ciudades" ("id_ciudad");

ALTER TABLE "Viajes" ADD FOREIGN KEY ("id_tipo_vehiculo") REFERENCES "Tipo_Vehiculos" ("id_tipo_vehiculo");
