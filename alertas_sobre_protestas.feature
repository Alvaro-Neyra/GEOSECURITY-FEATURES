# Feature: HU025 - Alertas sobre protestas
Feature: Alertas sobre protestas
    Como ciudadano
    Quiero saber si hay alguna manifestación cerca
    Para evitar interrupciones en mis rutas y posibles riesgos

    Scenario: Detección de manifestaciones cercanas
        Given que hay una manifestación programada o en curso
        When el usuario se encuentra en un radio de 1 km del evento
        Then el sistema debe enviar una alerta informativa
        And proporcionar detalles sobre la naturaleza de la manifestación

        Examples:
            | Ubicacion_Protesta | Radio_Afectado | Tipo_Manifestacion     | Horario_Estimado | Nivel_Riesgo | Participantes_Estimados | Rutas_Alternativas |
            | Plaza San Martín   | 2 km           | Protesta laboral       | 14:00-18:00      | Medio        | 500                     | 3                  |
            | Congreso República | 3 km           | Marcha política        | 10:00-16:00      | Alto         | 2000                    | 5                  |
            | Plaza Dos de Mayo  | 1.5 km         | Protesta estudiantil   | 15:00-19:00      | Bajo         | 200                     | 2                  |
            | Palacio Gobierno   | 4 km           | Manifestación nacional | 09:00-20:00      | Muy Alto     | 5000                    | 8                  |
            | Plaza Bolognesi    | 1 km           | Protesta vecinal       | 16:00-18:00      | Bajo         | 100                     | 1                  |

    Scenario: Información detallada de la manifestación
        Given que el usuario recibe una alerta de manifestación
        When el usuario accede a los detalles del evento
        Then debe visualizar hora de inicio, lugar exacto y duración estimada
        And el posible impacto en el tráfico y transporte público

        Examples:
            | Manifestacion_ID | Hora_Inicio | Lugar_Exacto           | Duracion_Est | Impacto_Trafico | Transporte_Afectado    | Desvios_Recomendados |
            | MAN001           | 14:00       | Plaza San Martín       | 4 horas      | Alto            | Metropolitano L1       | Via Tacna-Abancay    |
            | MAN002           | 10:00       | Jr. Junín cdra 4       | 6 horas      | Muy Alto        | Buses, Metropolitano   | Via Arequipa-Brasil  |
            | MAN003           | 15:00       | Universidad San Marcos | 4 horas      | Medio           | Buses universitarios   | Via Venezuela        |
            | MAN004           | 09:00       | Plaza de Armas         | 11 horas     | Crítico         | Todo transporte centro | Evitar centro 24h    |
            | MAN005           | 16:00       | Av. Brasil cdra 8      | 2 horas      | Bajo            | Buses locales          | Via Colonial         |

    Scenario: Rutas alternativas durante manifestaciones
        Given que hay una manifestación que afecta el tránsito
        When el usuario planifica una ruta que pasa por la zona
        Then el sistema debe sugerir automáticamente rutas alternativas
        And estimar el tiempo adicional necesario para evitar la zona

        Examples:
            | Ruta_Original     | Zona_Manifestacion | Ruta_Alternativa_1   | Tiempo_Extra_1 | Ruta_Alternativa_2  | Tiempo_Extra_2 | Eficiencia_Alternativa |
            | Centro-Miraflores | Plaza San Martín   | Via Arequipa-Pardo   | +15 min        | Via Brasil-Angamos  | +20 min        | 85%                    |
            | Callao-San Isidro | Congreso           | Via Faucett-Morales  | +25 min        | Via Colonial-Javier | +30 min        | 75%                    |
            | SJL-Centro        | Plaza Dos Mayo     | Via Próceres-Wilson  | +10 min        | Via Central-Abancay | +12 min        | 90%                    |
            | Norte-Centro      | Palacio Gobierno   | Evitamiento completo | +45 min        | Via periférica      | +60 min        | 50%                    |
            | La Victoria-Breña | Av. Brasil         | Via Venezuela-Tacna  | +8 min         | Via Alfonso Ugarte  | +10 min        | 92%                    |