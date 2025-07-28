import pandas as pd

datos = pd.read_csv("viajes_con_ids.csv")

#Abre el archivo SQL para escritura (w)
with open("insert_viajes.sql", "w", encoding="utf-8") as archivo_sql:
    for _, row in datos.iterrows():
        insert_stmt = f"""INSERT INTO "Viajes" (
    "id_terminal", "id_empresa", "fecha_salida", "fecha_llegada",
    "pasajeros", "id_ciudad_origen", "id_tipo_vehiculo"
) VALUES (
    {row['id_terminal']}, {row['id_empresa']},
    TO_TIMESTAMP('{row['fecha_salida']}', 'DD/MM/YYYY HH24:MI'),
    TO_TIMESTAMP('{row['fecha_llegada']}', 'DD/MM/YYYY HH24:MI'),
    {row['pasajeros']}, {row['id_ciudad_origen']}, {row['id_tipo_vehiculo']}
);\n"""
        archivo_sql.write(insert_stmt)

print("Funcionó!!!!!!!!!!!!!!!!!!!")
