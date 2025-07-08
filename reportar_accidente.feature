# Feature: HU012 - Reportar accidente
Feature: Reportar accidente
    Como ciudadano
    Quiero poder reportar algún tipo de accidente de tránsito a la municipalidad de mi zona
    Para que puedan llegar cuanto antes

    Scenario: Reporte inmediato de accidente
        Given que el usuario ha sido involucrado en un accidente de tránsito
        When el usuario selecciona "Reportar Accidente"
        And proporciona los detalles básicos del incidente
        Then el sistema debe enviar el reporte a la municipalidad correspondiente
        And garantizar un tiempo de respuesta máximo de 30 minutos

        Examples:
            | Tipo_Accidente  | Ubicacion_Exacta       | Vehiculos_Involucrados | Heridos | Municipalidad_Contactada | Tiempo_Respuesta | ID_Reporte |
            | Choque menor    | Av. Arequipa cdra 15   | 2 autos                | 0       | Miraflores               | 15 min           | ACC001     |
            | Atropello       | Jr. Lampa esq. Ucayali | 1 auto, 1 peatón       | 1       | Lima Cercado             | 8 min            | ACC002     |
            | Volcadura       | Av. Brasil cdra 20     | 1 camión               | 2       | Breña                    | 12 min           | ACC003     |
            | Choque múltiple | Via Expresa km 8       | 4 vehículos            | 3       | San Isidro               | 20 min           | ACC004     |
            | Accidente moto  | Av. Venezuela cdra 35  | 1 moto, 1 auto         | 1       | Lima Cercado             | 10 min           | ACC005     |

    Scenario: Adjuntar evidencia del accidente
        Given que el usuario está reportando un accidente
        When el usuario selecciona "Adjuntar Evidencia"
        Then debe poder tomar fotos y videos del accidente
        And el sistema debe permitir adjuntar hasta 10 archivos multimedia

        Examples:
            | Tipo_Evidencia  | Cantidad_Archivos | Tamaño_Total | Compresion_Aplicada | Tiempo_Subida | Calidad_Final | Formato_Final  |
            | Fotos lugar     | 5                 | 12.5 MB      | 60%                 | 8 seg         | Alta          | JPG optimizado |
            | Video accidente | 2                 | 25.8 MB      | 70%                 | 15 seg        | Media         | MP4 comprimido |
            | Fotos vehículos | 6                 | 18.2 MB      | 55%                 | 10 seg        | Alta          | JPG optimizado |
            | Audio testigo   | 1                 | 4.1 MB       | 80%                 | 3 seg         | Media         | MP3 comprimido |
            | Documentos      | 3                 | 2.8 MB       | 40%                 | 2 seg         | Alta          | PDF optimizado |

    Scenario: Seguimiento del reporte de accidente
        Given que el usuario ha enviado un reporte de accidente
        When el reporte es procesado por las autoridades
        Then el sistema debe proporcionar un número de seguimiento
        And enviar notificaciones sobre el estado del reporte y la llegada de personal

        Examples:
            | Numero_Seguimiento | Estado_Inicial | Tiempo_Proceso | Personal_Asignado    | Estado_Actual | Notificacion_Enviada              | ETA_Llegada |
            | SEG-ACC-001        | Recibido       | 2 min          | Serenazgo Miraflores | En camino     | "Personal de emergencia en ruta"  | 15 min      |
            | SEG-ACC-002        | Procesando     | 5 min          | Ambulancia SAMU      | Arribando     | "Ambulancia llegando al lugar"    | 3 min       |
            | SEG-ACC-003        | Urgente        | 1 min          | Bomberos + PNP       | En sitio      | "Personal de emergencia en lugar" | Arribado    |
            | SEG-ACC-004        | Recibido       | 3 min          | Grúa municipal       | Despachado    | "Grúa en camino para despeje"     | 25 min      |
            | SEG-ACC-005        | Completado     | 45 min         | Reporte finalizado   | Cerrado       | "Caso resuelto y archivado"       | N/A         |