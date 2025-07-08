# Feature: HU005 - Reportar incidente
Feature: Reportar incidente
    Como ciudadano
    Quiero poder reportar un incidente que presencie en mi ciudad (robo, asalto, etc.)
    Para alertar a otros usuarios y a las autoridades

    Scenario: Reporte básico de incidente
        Given que el usuario presencia un incidente
        When el usuario accede a la opción "Reportar Incidente"
        And selecciona el tipo de incidente y proporciona una descripción
        Then el sistema debe registrar el reporte con ubicación y hora automática
        And enviar el reporte a las autoridades correspondientes

        Examples:
            | Tipo_Incidente  | Ubicacion_GPS      | Descripcion_Reporte               | Hora_Automatica | Autoridad_Contactada | ID_Reporte | Estado_Inicial |
            | Robo a peatón   | -12.0464, -77.0428 | "Robo de celular a una señora"    | 14:35:22        | PNP Comisaría 1      | RPT001     | Enviado        |
            | Asalto con arma | -12.0431, -77.0282 | "Asalto con cuchillo en paradero" | 20:15:45        | PNP Central          | RPT002     | Urgente        |
            | Vandalismo      | -12.0512, -77.0353 | "Grafitis en pared de colegio"    | 11:42:18        | Serenazgo Municipal  | RPT003     | Registrado     |
            | Robo vehicular  | -12.0389, -77.0298 | "Robo de autopartes en semáforo"  | 18:22:33        | PNP Tránsito         | RPT004     | Prioridad      |
            | Pelea callejera | -12.0445, -77.0311 | "Pelea entre 4 personas"          | 22:18:55        | Serenazgo Nocturno   | RPT005     | Activo         |

    Scenario: Adjuntar evidencia multimedia
        Given que el usuario está reportando un incidente
        When el usuario selecciona "Adjuntar evidencia"
        And toma fotos o videos del incidente
        Then el sistema debe permitir adjuntar hasta 5 archivos multimedia
        And comprimir automáticamente los archivos para optimizar el envío

        Examples:
            | Archivo_Tipo | Tamaño_Original | Tamaño_Comprimido | Calidad_Final | Tiempo_Subida | Estado_Compresion | Formato_Final  |
            | Foto JPG     | 4.2 MB          | 1.8 MB            | Alta          | 3 seg         | Exitosa           | JPG optimizado |
            | Video MP4    | 15.6 MB         | 6.2 MB            | Media         | 12 seg        | Exitosa           | MP4 comprimido |
            | Foto PNG     | 8.1 MB          | 2.9 MB            | Alta          | 5 seg         | Exitosa           | JPG convertido |
            | Audio WAV    | 3.8 MB          | 1.1 MB            | Media         | 4 seg         | Exitosa           | MP3 comprimido |
            | Foto HEIC    | 2.1 MB          | 1.2 MB            | Alta          | 2 seg         | Exitosa           | JPG convertido |

    Scenario: Confirmación y seguimiento del reporte
        Given que el usuario ha enviado un reporte de incidente
        When el sistema procesa la información
        Then debe mostrar un número de confirmación del reporte
        And permitir al usuario hacer seguimiento del estado del reporte
        And notificar cuando las autoridades respondan

        Examples:
            | ID_Confirmacion | Estado_Reporte | Tiempo_Respuesta | Autoridad_Asignada | Accion_Tomada              | Notificacion_Usuario   |
            | CONF-2024-001   | Recibido       | 5 min            | Patrulla 205       | En camino al lugar         | "Reporte recibido"     |
            | CONF-2024-002   | En proceso     | 15 min           | Serenazgo Turno A  | Llegada al lugar           | "Autoridades en sitio" |
            | CONF-2024-003   | Resuelto       | 45 min           | PNP Investigación  | Detenidos identificados    | "Caso resuelto"        |
            | CONF-2024-004   | Pendiente      | 2 horas          | Fiscalía           | Investigación iniciada     | "En investigación"     |
            | CONF-2024-005   | Archivado      | 24 horas         | Comisaría Central  | Falta evidencia suficiente | "Caso archivado"       |