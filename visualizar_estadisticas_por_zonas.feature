# Feature: HU007 - Visualizar estadísticas por zonas
Feature: Visualizar estadísticas por zonas
    Como ciudadano
    Quiero consultar de forma rápida las estadísticas de robos/asaltos más frecuentes
    Para tener una mejor idea de cómo desplazarme en ciertas zonas

    Scenario: Consulta de estadísticas por zona específica
        Given que el usuario se encuentra en el mapa de la ciudad
        When el usuario selecciona una zona específica del mapa
        And accede a "Ver Estadísticas"
        Then el sistema debe mostrar las estadísticas de delitos para esa zona
        And incluir tipos de delitos más frecuentes con porcentajes

        Examples:
            | Zona_Seleccionada   | Robos_Porcentaje | Asaltos_Porcentaje | Vandalismo_Porcentaje | Otros_Porcentaje | Total_Incidentes | Ranking_Peligro |
            | La Victoria         | 45%              | 30%                | 15%                   | 10%              | 120              | 8/10            |
            | Miraflores          | 60%              | 15%                | 20%                   | 5%               | 25               | 3/10            |
            | Callao              | 50%              | 35%                | 10%                   | 5%               | 200              | 9/10            |
            | San Isidro          | 70%              | 10%                | 15%                   | 5%               | 20               | 2/10            |
            | San Juan Lurigancho | 40%              | 40%                | 12%                   | 8%               | 180              | 9/10            |

    Scenario: Filtrado temporal de estadísticas
        Given que el usuario está visualizando estadísticas de una zona
        When el usuario selecciona el filtro temporal (últimos 3 o 6 meses)
        Then el sistema debe actualizar las estadísticas según el período seleccionado
        And mostrar tendencias o cambios en los patrones delictivos

        Examples:
            | Zona        | Periodo_Filtro | Incidentes_Periodo | Cambio_Porcentual | Tendencia   | Mes_Pico | Delito_Dominante | Hora_Frecuente |
            | La Victoria | 3 meses        | 85                 | +15%              | Ascendente  | Julio    | Robos            | 18:00-20:00    |
            | Miraflores  | 6 meses        | 45                 | -8%               | Descendente | Abril    | Robos            | 12:00-14:00    |
            | Callao      | 3 meses        | 125                | +22%              | Ascendente  | Junio    | Asaltos          | 20:00-22:00    |
            | San Isidro  | 6 meses        | 35                 | -12%              | Descendente | Marzo    | Vandalismo       | 02:00-05:00    |
            | Centro      | 3 meses        | 95                 | +5%               | Estable     | Mayo     | Robos            | 14:00-16:00    |

    Scenario: Comparación entre zonas
        Given que el usuario ha consultado estadísticas de una zona
        When el usuario selecciona "Comparar con otras zonas"
        And elige zonas adicionales para comparar
        Then el sistema debe mostrar una comparativa visual de las estadísticas
        And destacar las zonas más seguras y peligrosas de la comparación

        Examples:
            | Zona_Principal | Zona_Comparacion_1 | Zona_Comparacion_2 | Mas_Segura  | Mas_Peligrosa | Diferencia_Incidentes | Recomendacion_Viaje |
            | La Victoria    | Miraflores         | San Isidro         | San Isidro  | La Victoria   | 6x más incidentes     | Preferir San Isidro |
            | Callao         | Centro Histórico   | Barranco           | Barranco    | Callao        | 8x más incidentes     | Evitar Callao noche |
            | SJL            | Ate                | Comas              | Ate         | SJL           | 2x más incidentes     | Precaución en SJL   |
            | Centro         | Breña              | Jesús María        | Jesús María | Centro        | 3x más incidentes     | Evitar Centro tarde |