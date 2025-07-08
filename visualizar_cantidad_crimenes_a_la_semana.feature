# Feature: HU008 - Visualizar cantidad de crímenes en la semana
Feature: Visualizar cantidad de crímenes en la semana
    Como ciudadano
    Quiero conocer los hechos recientes en mi distrito
    Para tener mayor confianza al salir

    Scenario: Estadísticas semanales por distrito
        Given que el usuario selecciona un distrito específico
        When el usuario accede a "Estadísticas Semanales"
        Then el sistema debe mostrar un gráfico con la cantidad de crímenes por día de la semana
        And destacar los días con mayor incidencia delictiva

        Examples:
            | Distrito    | Lunes | Martes | Miércoles | Jueves | Viernes | Sábado | Domingo | Dia_Pico | Dia_Seguro | Promedio_Diario |
            | La Victoria | 8     | 6      | 7         | 9      | 12      | 15     | 10      | Sábado   | Martes     | 9.6             |
            | Miraflores  | 2     | 1      | 3         | 2      | 4       | 6      | 3       | Sábado   | Martes     | 3.0             |
            | Callao      | 12    | 10     | 11        | 13     | 18      | 22     | 16      | Sábado   | Martes     | 14.6            |
            | San Isidro  | 1     | 0      | 2         | 1      | 3       | 4      | 2       | Sábado   | Martes     | 1.9             |
            | Centro      | 6     | 5      | 8         | 7      | 10      | 14     | 9       | Sábado   | Martes     | 8.4             |

    Scenario: Identificación de horas punta de criminalidad
        Given que el usuario está consultando estadísticas semanales
        When el sistema analiza los datos del distrito
        Then debe mostrar las horas del día con mayor incidencia de crímenes
        And proporcionar recomendaciones de horarios más seguros para transitar

        Examples:
            | Distrito    | Hora_Mas_Peligrosa | Incidentes_Hora | Hora_Mas_Segura | Incidentes_Minimos | Recomendacion_Horario            | Nivel_Riesgo |
            | La Victoria | 20:00-22:00        | 25              | 06:00-08:00     | 2                  | Evitar después de 19:00          | Alto         |
            | Miraflores  | 14:00-16:00        | 8               | 04:00-06:00     | 0                  | Seguro la mayor parte del día    | Bajo         |
            | Callao      | 18:00-20:00        | 35              | 05:00-07:00     | 1                  | Evitar horario de salida laboral | Crítico      |
            | San Isidro  | 12:00-14:00        | 4               | 02:00-06:00     | 0                  | Prácticamente seguro todo el día | Muy Bajo     |
            | Centro      | 16:00-18:00        | 18              | 06:00-08:00     | 1                  | Precaución en horario comercial  | Medio        |

    Scenario: Filtrado por calles específicas del distrito
        Given que el usuario está en las estadísticas del distrito
        When el usuario selecciona "Filtrar por calles"
        And elige calles específicas del distrito
        Then el sistema debe mostrar estadísticas detalladas por calle seleccionada
        And permitir comparar la seguridad entre diferentes calles

        Examples:
            | Distrito    | Calle_Principal | Incidentes_Calle | Calle_Secundaria   | Incidentes_Sec | Calle_Mas_Segura | Diferencia_Seguridad |
            | La Victoria | Av. Grau        | 35               | Jr. Paruro         | 22             | Jr. Huanta       | 15x más segura       |
            | Miraflores  | Av. Larco       | 8                | Av. Pardo          | 5              | Calle Schell     | 4x más segura        |
            | Callao      | Av. Sáenz Peña  | 45               | Jr. Constitución   | 28             | Av. Bolognesi    | 8x más segura        |
            | San Isidro  | Av. El Bosque   | 3                | Av. Conquistadores | 2              | Calle Las Flores | 2x más segura        |
            | Centro      | Jr. de la Unión | 25               | Jr. Cusco          | 18             | Jr. Quilca       | 5x más segura        |