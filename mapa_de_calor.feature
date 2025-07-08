# Feature: HU001 - Consultar mapa de calor de criminalidad
Feature: Consultar mapa de calor de criminalidad
    Como ciudadano
    Quiero poder ver un mapa de calor actualizado con las zonas más peligrosas de mi ciudad
    Para poder planificar mis rutas con anticipación

    Scenario: Visualización del mapa de calor
        Given que el usuario se encuentra en la pantalla principal de la aplicación
        And el usuario selecciona la opción "Mapa de Calor"
        When el sistema carga el mapa de la ciudad
        Then el sistema debe mostrar un mapa de calor con diferentes colores indicando la densidad de delitos por zona
        And los datos deben estar actualizados con información de las últimas 24 horas

        Examples:
            | Zona                | Color   | Nivel_Peligro | Delitos_24h | Densidad_Criminal | Actualizacion |
            | San Juan Lurigancho | Rojo    | Alto          | 15          | 8.5/km²           | 14:30         |
            | Miraflores          | Verde   | Bajo          | 2           | 1.2/km²           | 14:30         |
            | La Victoria         | Naranja | Medio         | 8           | 5.3/km²           | 14:30         |
            | Callao              | Rojo    | Alto          | 12          | 7.8/km²           | 14:30         |
            | San Isidro          | Verde   | Bajo          | 1           | 0.8/km²           | 14:30         |

    Scenario: Identificación de zonas peligrosas
        Given que el usuario está visualizando el mapa de calor
        When el usuario observa las diferentes zonas coloreadas
        Then debe ser fácil distinguir las zonas más peligrosas (color rojo) de las más seguras (color verde)
        And debe poder identificar zonas intermedias con colores amarillo/naranja

        Examples:
            | Color_Zona | Interpretacion | Nivel_Seguridad | Recomendacion        | Horario_Sugerido |
            | Rojo       | Muy Peligroso  | 1/10            | Evitar completamente | Ninguno          |
            | Naranja    | Peligroso      | 4/10            | Extrema precaución   | Solo día         |
            | Amarillo   | Precaución     | 6/10            | Mantenerse alerta    | Día preferible   |
            | Verde      | Seguro         | 9/10            | Transitable          | Cualquier hora   |
            | Azul       | Muy Seguro     | 10/10           | Zona recomendada     | 24 horas         |

    Scenario: Actualización de datos en tiempo real
        Given que el usuario tiene el mapa de calor abierto
        When transcurren 30 minutos desde la última actualización
        Then el sistema debe actualizar automáticamente los datos del mapa
        And mostrar una notificación de "Datos actualizados"

        Examples:
            | Tiempo_Transcurrido | Actualizacion_Automatica | Notificacion_Mostrada | Cambios_Detectados | Zonas_Afectadas  |
            | 30 min              | Sí                       | "Datos actualizados"  | 3 nuevos reportes  | La Victoria      |
            | 15 min              | No                       | Ninguna               | Sin cambios        | Ninguna          |
            | 45 min              | Sí                       | "Datos actualizados"  | 1 nuevo reporte    | Callao           |
            | 60 min              | Sí                       | "Datos actualizados"  | 5 nuevos reportes  | SJL, La Victoria |
