# Feature: HU010 - Cambiar ubicación GPS
Feature: Cambiar ubicación GPS
    Como ciudadano/taxista
    Quiero tener la capacidad de cambiar la ubicación a través del GPS del celular
    Para así tener los crímenes cercanos y rutas más seguras

    Scenario: Actualización automática de ubicación por GPS
        Given que el usuario tiene activado el GPS en su dispositivo
        When el usuario se desplaza a una nueva ubicación
        Then el sistema debe actualizar automáticamente su posición con una precisión del 95%
        And mostrar los crímenes e incidentes cercanos a la nueva ubicación

        Examples:
            | Ubicacion_Anterior | Ubicacion_Nueva     | Precision_GPS | Incidentes_Cercanos | Radio_Busqueda | Tiempo_Actualizacion | Delitos_Detectados |
            | Av. Arequipa 1500  | Av. Brasil 800      | 97%           | 3                   | 1km            | 2 seg                | Robos, Vandalismo  |
            | Plaza de Armas     | Gamarra             | 95%           | 8                   | 1km            | 3 seg                | Robos, Asaltos     |
            | Miraflores Centro  | La Victoria         | 98%           | 12                  | 1km            | 1.5 seg              | Múltiples tipos    |
            | Callao Puerto      | San Juan Lurigancho | 96%           | 15                  | 1km            | 2.5 seg              | Robos, Peleas      |
            | San Isidro         | Centro Histórico    | 99%           | 6                   | 1km            | 1 seg                | Robos turistas     |

    Scenario: Cambio manual de ubicación
        Given que el usuario quiere consultar información de una zona específica
        When el usuario selecciona "Cambiar Ubicación" manualmente en el mapa
        Then el sistema debe permitir seleccionar cualquier punto del mapa
        And actualizar la información de seguridad para la ubicación seleccionada

        Examples:
            | Ubicacion_Actual | Ubicacion_Consultada | Metodo_Seleccion | Info_Seguridad_Nueva               | Alertas_Zona      | Tiempo_Carga |
            | Miraflores       | La Victoria          | Toque en mapa    | 8 incidentes en últimas 24h        | Robos frecuentes  | 1.2 seg      |
            | San Isidro       | Callao               | Búsqueda texto   | 15 incidentes, zona alto riesgo    | Múltiples delitos | 1.8 seg      |
            | Centro           | Comas                | Coordenadas GPS  | 6 incidentes, precaución nocturna  | Asaltos nocturnos | 1.5 seg      |
            | Barranco         | San Juan Lurig.      | Dirección        | 12 incidentes, evitar calles solas | Robos peatones    | 2.1 seg      |

    Scenario: Verificación de precisión de ubicación
        Given que el sistema ha detectado la ubicación del usuario
        When se compara con referencias geográficas conocidas
        Then la precisión debe ser de al menos 95% dentro de un radio de 10 metros
        And el sistema debe alertar si la precisión es menor al umbral establecido

        Examples:
            | Coordenadas_Detectadas | Referencia_Real    | Diferencia_Metros | Precision_Calculada | Estado_Precision | Alerta_Mostrada             |
            | -12.0464, -77.0428     | -12.0465, -77.0429 | 8m                | 98%                 | Excelente        | Ninguna                     |
            | -12.0431, -77.0282     | -12.0438, -77.0290 | 15m               | 89%                 | Insuficiente     | "GPS impreciso, reubicando" |
            | -12.0512, -77.0353     | -12.0512, -77.0354 | 3m                | 99.5%               | Óptima           | Ninguna                     |
            | -12.0389, -77.0298     | -12.0395, -77.0305 | 22m               | 82%                 | Muy baja         | "Verificar señal GPS"       |
            | -12.0445, -77.0311     | -12.0446, -77.0312 | 5m                | 97%                 | Excelente        | Ninguna                     |