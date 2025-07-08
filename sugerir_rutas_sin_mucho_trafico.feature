# Feature: HU023 - Sugerir rutas sin mucho tráfico
Feature: Sugerir rutas sin mucho tráfico
    Como usuario
    Quiero que la app me sugiera las mejores rutas sin mucho tráfico
    Para agilizar mis tiempos en las entregas y transporte personal

    Scenario: Análisis de tráfico en tiempo real
        Given que el usuario solicita una ruta
        When el sistema calcula las opciones disponibles
        Then debe analizar el tráfico actual en tiempo real
        And priorizar rutas con fluidez vehicular normal

        Examples:
            | Ruta_Origen        | Ruta_Destino      | Trafico_Nivel | Tiempo_Normal | Tiempo_Con_Trafico | Velocidad_Promedio | Recomendacion |
            | Av. Arequipa       | Av. Brasil        | Bajo          | 20 min        | 22 min             | 35 km/h            | Recomendada   |
            | Via Expresa        | Carretera Central | Alto          | 30 min        | 55 min             | 18 km/h            | Evitar        |
            | Av. Universitaria  | Av. Venezuela     | Medio         | 35 min        | 42 min             | 28 km/h            | Aceptable     |
            | Circuito Playas    | Centro Histórico  | Muy Bajo      | 25 min        | 26 min             | 45 km/h            | Óptima        |
            | Panamericana Norte | Callao            | Muy Alto      | 40 min        | 85 min             | 12 km/h            | No usar       |

    Scenario: Estimación precisa de tiempos de viaje
        Given que se han calculado rutas alternativas
        When el sistema presenta las opciones
        Then debe mostrar tiempo estimado considerando el tráfico actual
        And actualizar los tiempos dinámicamente durante el viaje

        Examples:
            | Ruta_ID | Tiempo_Inicial | Actualizaciones_Ruta | Tiempo_Final | Precision_Estimacion | Factores_Considerados      | Desviacion_Real |
            | RUT001  | 25 min         | 3                    | 27 min       | 95%                  | Tráfico, clima, accidentes | +2 min          |
            | RUT002  | 40 min         | 5                    | 38 min       | 92%                  | Tráfico, obras, horario    | -2 min          |
            | RUT003  | 15 min         | 1                    | 16 min       | 98%                  | Tráfico normal             | +1 min          |
            | RUT004  | 60 min         | 8                    | 75 min       | 88%                  | Accidente, desvío, lluvia  | +15 min         |
            | RUT005  | 35 min         | 2                    | 33 min       | 96%                  | Tráfico mejorado           | -2 min          |

    Scenario: Redireccionamiento automático por congestión
        Given que el usuario está siguiendo una ruta sugerida
        When se detecta congestión imprevista en el camino
        Then el sistema debe proponer automáticamente rutas alternativas
        And recalcular el tiempo de llegada estimado

        Examples:
            | Punto_Congestion   | Causa_Congestion | Ruta_Alternativa_1   | Tiempo_Extra_1 | Ruta_Alternativa_2 | Tiempo_Extra_2 | Recomendacion_Final |
            | Av. Brasil cdra 15 | Accidente        | Via Tacna-Wilson     | +8 min         | Via Colonial       | +12 min        | Opción 1            |
            | Via Expresa km 12  | Obras viales     | Av. Javier Prado     | +15 min        | Av. Angamos        | +18 min        | Opción 1            |
            | Puente Villena     | Manifestación    | Puente Santa Rosa    | +6 min         | Puente Balta       | +10 min        | Opción 1            |
            | Ovalo Gutierrez    | Hora punta       | Via Arequipa directa | +5 min         | Via Salaverry      | +8 min         | Opción 1            |
            | Carretera Central  | Neblina densa    | Via Evitamiento      | +20 min        | Autopista Ramiro   | +25 min        | Esperar despeje     |