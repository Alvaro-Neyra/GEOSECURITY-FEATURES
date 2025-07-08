# Feature: HU034 - Obtener ayuda
Feature: Obtener ayuda
    Como usuario
    Quiero tener asistencia de la app
    Para aprender a usar las funcionalidades y resolver dudas

    Scenario: Sección de preguntas frecuentes
        Given que el usuario necesita ayuda para usar la aplicación
        When el usuario accede a la sección "Ayuda"
        Then debe visualizar preguntas frecuentes categorizadas
        And encontrar respuestas claras sobre el uso de las funciones principales

        Examples:
            | Categoría    | Pregunta_Frecuente                     | Respuesta_Disponible | Valoración_Usuario | Tiempo_Lectura | Recursos_Adicionales |
            | Mapas        | ¿Cómo interpretar el mapa de calor?    | Sí                   | 5/5                | 2 min          | Video tutorial       |
            | Alertas      | ¿Cómo personalizar las notificaciones? | Sí                   | 4/5                | 3 min          | Guía paso a paso     |
            | Reportes     | ¿Cómo reportar un incidente?           | Sí                   | 5/5                | 1.5 min        | Demo interactiva     |
            | Emergencias  | ¿Cómo usar el botón de emergencia?     | Sí                   | 5/5                | 2.5 min        | Video + texto        |
            | Privacidad   | ¿Cómo protegen mis datos personales?   | Sí                   | 4/5                | 4 min          | Política detallada   |
            | Verificación | ¿Por qué debo verificar mi identidad?  | Sí                   | 4/5                | 3 min          | Infografía           |

    Scenario: Búsqueda inteligente en la ayuda
        Given que el usuario tiene una duda específica
        When el usuario utiliza la función de búsqueda en la sección de ayuda
        Then debe poder encontrar información relevante rápidamente
        And obtener resultados ordenados por relevancia con sugerencias relacionadas

        Examples:
            | Término_Búsqueda | Resultados_Encontrados | Tiempo_Búsqueda | Relevancia_Promedio | Sugerencias_Relacionadas | Auto_Completado |
            | "mapa de calor"  | 5                      | 0.2 seg         | 95%                 | interpretación, colores  | Sí              |
            | "alerta"         | 8                      | 0.15 seg        | 92%                 | notificaciones, sonidos  | Sí              |
            | "emergencia"     | 6                      | 0.18 seg        | 98%                 | botón pánico, contactos  | Sí              |
            | "batería"        | 3                      | 0.25 seg        | 87%                 | modo oscuro, ahorro      | Sí              |
            | "falso reporte"  | 4                      | 0.3 seg         | 90%                 | verificación, calificar  | Sí              |

    Scenario: Contacto con soporte técnico
        Given que el usuario no encuentra respuesta en las FAQ
        When el usuario necesita asistencia personalizada
        Then debe poder contactar al soporte técnico directamente desde la app
        And recibir respuesta en un tiempo razonable con seguimiento del ticket

        Examples:
            | Canal_Contacto | Horario_Disponible | Tiempo_Respuesta_Promedio | Idiomas_Disponibles | Nivel_Especialización | Satisfacción_Usuario | ID_Ticket    |
            | Chat en vivo   | 8:00-20:00         | 3 min                     | Español, Inglés     | Nivel 1               | 4.2/5                | CHT-2024-001 |
            | Email          | 24/7               | 2 horas                   | Español, Inglés     | Nivel 2               | 4.5/5                | EML-2024-158 |
            | WhatsApp       | 9:00-18:00         | 15 min                    | Español             | Nivel 1               | 4.1/5                | WPP-2024-089 |
            | Llamada        | 9:00-17:00         | 5 min                     | Español             | Nivel 3               | 4.7/5                | TEL-2024-045 |
            | Formulario     | 24/7               | 4 horas                   | Español, Inglés     | Nivel 2               | 4.3/5                | FRM-2024-267 |