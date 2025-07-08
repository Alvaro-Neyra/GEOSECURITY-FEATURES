# Feature: HU011 - Visualizar el clima
Feature: Visualizar el clima
    Como taxista
    Quiero consultar el clima en base al distrito o zona donde me encuentro
    Para poder anticipar y advertir a mis clientes

    Scenario: Consulta de clima en tiempo real
        Given que el taxista se encuentra en un distrito específico
        When el taxista accede a la opción "Clima Actual"
        Then el sistema debe mostrar la información meteorológica actual de la zona
        And actualizar los datos cada 15 minutos automáticamente

        Examples:
            | Distrito    | Temperatura | Humedad | Condicion    | Viento  | Visibilidad | Actualizacion | Pronostico_2h |
            | Miraflores  | 22°C        | 75%     | Nublado      | 15 km/h | 8 km        | 14:30         | Llovizna      |
            | La Victoria | 24°C        | 80%     | Llovizna     | 10 km/h | 5 km        | 14:30         | Lluvia        |
            | San Isidro  | 21°C        | 70%     | Soleado      | 12 km/h | 10 km       | 14:30         | Despejado     |
            | Callao      | 20°C        | 85%     | Neblina      | 8 km/h  | 3 km        | 14:30         | Nublado       |
            | Centro      | 23°C        | 78%     | Parcialmente | 14 km/h | 7 km        | 14:30         | Nublado       |

    Scenario: Alertas climáticas para conductores
        Given que hay condiciones climáticas adversas en la zona
        When el sistema detecta lluvia intensa, neblina o vientos fuertes
        Then debe enviar una alerta automática al taxista
        And sugerir precauciones adicionales para la conducción

        Examples:
            | Condicion_Adversa | Intensidad | Zona_Afectada | Alerta_Enviada                     | Precaucion_Sugerida        | Duracion_Estimada |
            | Lluvia intensa    | Fuerte     | Callao        | "Lluvia intensa detectada"         | Reducir velocidad 30%      | 45 minutos        |
            | Neblina densa     | Severa     | Costa Verde   | "Visibilidad reducida a 2km"       | Usar luces antineblina     | 2 horas           |
            | Vientos fuertes   | 45 km/h    | Via Expresa   | "Vientos fuertes en autopistas"    | Evitar carriles exteriores | 1 hora            |
            | Granizo           | Moderado   | San Juan Lur. | "Granizo reportado en la zona"     | Buscar refugio techado     | 20 minutos        |
            | Tormenta          | Intensa    | Lima Norte    | "Tormenta eléctrica aproximándose" | Evitar zonas elevadas      | 90 minutos        |

    Scenario: Pronóstico para planificación de rutas
        Given que el taxista está planificando sus rutas del día
        When el taxista consulta el clima de diferentes distritos
        Then el sistema debe mostrar el pronóstico por horas para cada zona
        And destacar distritos con condiciones climáticas favorables

        Examples:
            | Distrito    | Hora_08 | Hora_12 | Hora_16 | Hora_20 | Condicion_Favorable | Recomendacion_Ruta   | Probabilidad_Lluvia |
            | Miraflores  | Soleado | Nublado | Lluvia  | Nublado | Mañana              | Rutas matutinas      | 60%                 |
            | La Victoria | Nublado | Lluvia  | Lluvia  | Nublado | Ninguna             | Evitar todo el día   | 80%                 |
            | San Isidro  | Soleado | Soleado | Nublado | Soleado | Todo el día         | Rutas preferenciales | 20%                 |
            | Callao      | Neblina | Nublado | Soleado | Nublado | Tarde               | Rutas vespertinas    | 40%                 |
            | Centro      | Nublado | Nublado | Nublado | Lluvia  | Mañana/Tarde        | Evitar noche         | 70%                 |