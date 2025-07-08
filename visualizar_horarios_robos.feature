# Feature: HU021 - Visualizar horario de robos
Feature: Visualizar horario de robos
    Como usuario
    Quiero saber en qué horarios ocurren más robos
    Para poder planificar mis desplazamientos con mayor precaución

    Scenario: Gráfico de horarios conflictivos
        Given que el usuario accede a "Estadísticas de Horarios"
        When el usuario selecciona "Horarios de Robos"
        Then el sistema debe mostrar un gráfico con las horas del día con mayor incidencia
        And actualizar la información en tiempo real cada hora

        Examples:
            | Hora_Dia | Incidentes_Promedio | Nivel_Riesgo | Zona_Mas_Afectada   | Tipo_Robo_Frecuente | Recomendacion         | Porcentaje_Total |
            | 06:00    | 2                   | Bajo         | Centros comerciales | Robo al paso        | Precaución normal     | 5%               |
            | 12:00    | 8                   | Medio        | Zona financiera     | Robo de celulares   | Mantenerse alerta     | 15%              |
            | 18:00    | 15                  | Alto         | Transporte público  | Robo en combis      | Evitar aglomeraciones | 30%              |
            | 22:00    | 12                  | Alto         | Zona de bares       | Robo con violencia  | No transitar solo     | 25%              |
            | 02:00    | 6                   | Medio        | Zonas residenciales | Robo a transeúntes  | Evitar calles solas   | 12%              |

    Scenario: Comparación entre días de la semana
        Given que el usuario está consultando horarios de robos
        When el usuario selecciona diferentes días de la semana
        Then debe poder comparar los patrones de horarios entre días laborables y fines de semana
        And identificar las variaciones en los horarios peligrosos

        Examples:
            | Dia_Semana | Hora_Pico_1 | Incidentes_1 | Hora_Pico_2 | Incidentes_2 | Hora_Segura | Patron_Identificado  | Diferencia_Fin_Semana |
            | Lunes      | 18:00       | 12           | 08:00       | 8            | 04:00       | Horarios laborales   | 20% menos incidentes  |
            | Miércoles  | 19:00       | 14           | 12:00       | 10           | 05:00       | Picos comerciales    | 15% menos incidentes  |
            | Viernes    | 20:00       | 18           | 14:00       | 12           | 06:00       | Pre-fin de semana    | 5% menos incidentes   |
            | Sábado     | 22:00       | 22           | 16:00       | 15           | 08:00       | Vida nocturna        | Pico máximo           |
            | Domingo    | 14:00       | 16           | 20:00       | 14           | 10:00       | Reuniones familiares | 10% más incidentes    |

    Scenario: Alertas preventivas por horario
        Given que el usuario transita en horarios de alta incidencia de robos
        When se acerca un horario estadísticamente peligroso
        Then el sistema debe enviar una alerta preventiva
        And sugerir precauciones adicionales para ese período

        Examples:
            | Horario_Actual | Horario_Peligroso | Tiempo_Anticipacion | Alerta_Enviada                     | Precaucion_Sugerida        | Nivel_Urgencia |
            | 17:45          | 18:00             | 15 min              | "Se acerca horario de alto riesgo" | Evitar transporte público  | Media          |
            | 21:30          | 22:00             | 30 min              | "Horario peligroso en 30 minutos"  | Planificar ruta segura     | Alta           |
            | 11:45          | 12:00             | 15 min              | "Precaución en zona financiera"    | Guardar objetos de valor   | Baja           |
            | 01:30          | 02:00             | 30 min              | "Evitar salir en próximos 30 min"  | Permanecer en lugar seguro | Alta           |
            | 07:30          | 08:00             | 30 min              | "Horario de robos matutinos"       | Usar transporte seguro     | Media          |