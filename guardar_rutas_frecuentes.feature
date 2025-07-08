# Feature: HU022 - Guardar rutas frecuentes
Feature: Guardar rutas frecuentes
    Como usuario
    Quiero guardar rutas para agilizar mis búsquedas
    Para ahorrar tiempo y facilitar la planificación de mis viajes

    Scenario: Guardado de rutas favoritas
        Given que el usuario ha planificado una ruta
        When el usuario selecciona "Guardar Ruta" y asigna un nombre descriptivo
        Then el sistema debe almacenar la ruta en "Rutas Favoritas"
        And permitir acceso rápido desde el menú principal

        Examples:
            | Nombre_Ruta     | Origen              | Destino            | Distancia | Tiempo_Promedio | Nivel_Seguridad | Frecuencia_Uso | Tags_Asignados     |
            | Casa-Trabajo    | Miraflores Centro   | San Isidro Financ. | 5.2 km    | 25 min          | Alto            | Diario         | trabajo, segura    |
            | Universidad     | La Victoria         | Centro Histórico   | 8.1 km    | 35 min          | Medio           | 5 días/semana  | estudio, económica |
            | Compras-Mercado | San Juan Lurigancho | Mercado Central    | 12.5 km   | 45 min          | Bajo            | Fines semana   | compras, rápida    |
            | Citas-Hospital  | Callao              | Hospital Nacional  | 15.8 km   | 55 min          | Alto            | Mensual        | salud, confiable   |
            | Visita-Familia  | Centro Lima         | Comas              | 18.2 km   | 65 min          | Medio           | Fines semana   | familia, conocida  |

    Scenario: Búsqueda eficiente de rutas guardadas
        Given que el usuario tiene rutas guardadas
        When el usuario accede a "Rutas Favoritas"
        Then debe tener una opción de búsqueda rápida por nombre o destino
        And poder ordenar las rutas por frecuencia de uso o fecha

        Examples:
            | Termino_Busqueda | Resultados_Encontrados | Criterio_Orden  | Rutas_Ordenadas                         | Tiempo_Busqueda | Filtros_Aplicados |
            | "trabajo"        | 3                      | Frecuencia uso  | Casa-Trabajo, Oficina-Centro, Trabajo-2 | 0.2 seg         | Uso diario        |
            | "hospital"       | 2                      | Fecha creación  | Citas-Hospital, Emergencia-Clinic       | 0.1 seg         | Médico            |
            | "universidad"    | 4                      | Distancia       | Uni-Cercana, Universidad, Uni-Noche     | 0.3 seg         | Educativo         |
            | "mercado"        | 5                      | Nivel seguridad | Mercado-Seguro, Compras-Mercado         | 0.2 seg         | Compras           |
            | "familia"        | 3                      | Frecuencia uso  | Visita-Familia, Casa-Padres, Hermanos   | 0.1 seg         | Personal          |

    Scenario: Actualización automática de seguridad en rutas guardadas
        Given que el usuario tiene rutas favoritas guardadas
        When las condiciones de seguridad de una ruta cambian significativamente
        Then el sistema debe notificar al usuario sobre los cambios
        And sugerir rutas alternativas si la ruta guardada se vuelve peligrosa

        Examples:
            | Ruta_Afectada   | Cambio_Seguridad | Notificacion_Enviada             | Ruta_Alternativa_Sugerida  | Tiempo_Deteccion | Accion_Usuario   |
            | Casa-Trabajo    | Alto a Medio     | "Ligero aumento de riesgo"       | Via Arequipa alternativa   | 2 horas          | Ruta actualizada |
            | Universidad     | Medio a Bajo     | "Mejora en seguridad detectada"  | Ninguna necesaria          | 1 hora           | Ruta mantenida   |
            | Compras-Mercado | Bajo a Alto      | "ALERTA: Ruta ahora peligrosa"   | Via Tacna más segura       | 30 min           | Cambio aceptado  |
            | Citas-Hospital  | Alto a Muy Alto  | "URGENTE: Evitar esta ruta"      | 2 alternativas disponibles | 15 min           | Rutas evaluadas  |
            | Visita-Familia  | Medio a Alto     | "Precaución adicional requerida" | Ruta nocturna más segura   | 45 min           | Horario ajustado |