# Feature: HU027 - Calificar reportes
Feature: Calificar reportes
    Como usuario
    Quiero calificar reportes de ciudadanos
    Para ayudar a verificar la información y mejorar la calidad de los datos

    Scenario: Sistema de calificación anónima
        Given que el usuario visualiza reportes de otros ciudadanos
        When el usuario selecciona un reporte específico
        Then debe poder calificar la veracidad y utilidad del reporte de forma anónima
        And la calificación debe contribuir a la credibilidad del reporte

        Examples:
            | Reporte_ID | Tipo_Incidente | Calificacion_Usuario | Promedio_Actual | Confiabilidad | Estado_Reporte | Total_Calificaciones |
            | RPT001     | Robo           | 5 (Muy confiable)    | 4.2             | Alta          | Verificado     | 25                   |
            | RPT002     | Asalto         | 2 (Poco confiable)   | 2.8             | Baja          | Dudoso         | 18                   |
            | RPT003     | Vandalismo     | 4 (Confiable)        | 4.5             | Alta          | Confirmado     | 32                   |
            | RPT004     | Accidente      | 1 (No confiable)     | 3.1             | Media         | En revisión    | 12                   |
            | RPT005     | Disturbio      | 5 (Muy confiable)    | 4.8             | Muy Alta      | Verificado     | 45                   |

    Scenario: Protección de la identidad del evaluador
        Given que el usuario califica un reporte
        When se procesa la calificación
        Then el sistema debe mantener el anonimato completo del evaluador
        And generar confianza en los usuarios para participar honestamente

        Examples:
            | ID_Calificacion | Datos_Guardados     | Datos_Anonimizados     | Nivel_Privacidad | Trazabilidad | Tiempo_Retención | Método_Protección |
            | CAL001          | Timestamp, rating   | IP, device ID, user    | Máximo           | Ninguna      | 30 días          | Hash algoritmo    |
            | CAL002          | Zona, puntuación    | Identificadores únicos | Máximo           | Ninguna      | 30 días          | Encriptación AES  |
            | CAL003          | Hora, valoración    | Datos personales       | Máximo           | Ninguna      | 30 días          | Tokens temporales |
            | CAL004          | Tipo reporte, score | Historial usuario      | Máximo           | Ninguna      | 30 días          | Randomización     |
            | CAL005          | Coordenadas, rating | Perfil completo        | Máximo           | Ninguna      | 30 días          | Ofuscación datos  |

    Scenario: Promedio de calificaciones del reporte
        Given que un reporte ha recibido múltiples calificaciones
        When otros usuarios lo consultan
        Then debe mostrar un promedio de confiabilidad
        And filtrar reportes con calificaciones muy bajas

        Examples:
            | Reporte_ID | Calificaciones_Recibidas | Promedio_Final | Umbral_Filtrado | Estado_Visibilidad | Accion_Sistema          | Usuarios_Que_Calificaron |
            | RPT001     | 5,4,5,4,5,3,4,5          | 4.4            | 3.0             | Visible            | Destacar como confiable | 8                        |
            | RPT002     | 2,1,2,3,1,2,2,1          | 1.8            | 3.0             | Oculto             | Filtrar automáticamente | 8                        |
            | RPT003     | 5,5,4,5,5,4,5,5          | 4.8            | 3.0             | Muy Visible        | Marcar como verificado  | 8                        |
            | RPT004     | 3,3,2,4,3,3,3,2          | 2.9            | 3.0             | Parcial            | Mostrar con advertencia | 8                        |
            | RPT005     | 4,5,4,4,5,4,5,4          | 4.4            | 3.0             | Visible            | Promover en feed        | 8                        |