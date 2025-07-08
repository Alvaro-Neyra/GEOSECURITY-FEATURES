# Feature: HU006 - Acceder a historial de seguridad
Feature: Acceder a historial de seguridad
    Como usuario
    Quiero poder ver un historial de las alertas que he recibido y las rutas que he planificado
    Para poder analizar mi exposición al riesgo y tomar mejores decisiones en el futuro

    Scenario: Visualización del historial completo
        Given que el usuario accede a la sección "Historial de Seguridad"
        When el sistema carga la información del usuario
        Then debe mostrar un listado cronológico de todas las alertas recibidas y rutas planificadas
        And incluir fecha, hora, ubicación y tipo de evento para cada entrada

        Examples:
            | Fecha      | Hora  | Tipo_Evento      | Ubicacion              | Descripcion_Detalle          | Nivel_Riesgo | Accion_Tomada    |
            | 2024-07-05 | 14:30 | Alerta Robo      | Av. Brasil esq. Wilson | Zona de robos frecuentes     | Alto         | Ruta alternativa |
            | 2024-07-05 | 09:15 | Ruta Segura      | Casa → Trabajo         | Vía Arequipa-Tacna           | Bajo         | Ruta completada  |
            | 2024-07-04 | 18:45 | Alerta Asalto    | Jr. Lampa 800          | Asaltos a peatones           | Medio        | Evitó la zona    |
            | 2024-07-04 | 12:20 | Ruta Planificada | Miraflores → Centro    | Ruta turística segura        | Bajo         | Sin incidentes   |
            | 2024-07-03 | 20:10 | Alerta Urgente   | Plaza San Martín       | Actividad delictiva en curso | Crítico      | Salió del área   |

    Scenario: Filtrado del historial por criterios
        Given que el usuario está en el historial de seguridad
        When el usuario selecciona filtros por tipo de alerta o zona geográfica
        And aplica los filtros seleccionados
        Then el sistema debe mostrar solo los eventos que coincidan con los criterios
        And mantener la información ordenada cronológicamente

        Examples:
            | Filtro_Aplicado | Criterio_Seleccionado | Eventos_Encontrados | Fecha_Inicial | Fecha_Final | Total_Mostrado | Porcentaje_Total |
            | Tipo de evento  | Solo alertas de robo  | 8                   | 2024-07-01    | 2024-07-07  | 8/25           | 32%              |
            | Zona geográfica | Solo La Victoria      | 12                  | 2024-07-01    | 2024-07-07  | 12/25          | 48%              |
            | Nivel de riesgo | Alto y Crítico        | 5                   | 2024-07-01    | 2024-07-07  | 5/25           | 20%              |
            | Horario         | 18:00 - 06:00         | 15                  | 2024-07-01    | 2024-07-07  | 15/25          | 60%              |
            | Acción tomada   | Rutas alternativas    | 10                  | 2024-07-01    | 2024-07-07  | 10/25          | 40%              |

    Scenario: Análisis estadístico de exposición al riesgo
        Given que el usuario tiene historial de actividad registrado
        When el usuario accede a la sección "Estadísticas de Riesgo"
        Then el sistema debe mostrar gráficos y métricas sobre su exposición al riesgo
        And proporcionar recomendaciones para reducir la exposición basadas en patrones identificados

        Examples:
            | Metrica_Analizada      | Valor_Actual | Promedio_Ciudad | Clasificacion | Tendencia_Semanal | Recomendacion_Principal             |
            | Exposición total       | 6.8/10       | 7.2/10          | Mejor         | Descendente       | Mantener rutas actuales             |
            | Alertas por semana     | 12           | 15              | Mejor         | Estable           | Continuar con precauciones          |
            | Zonas riesgo visitadas | 3            | 5               | Mejor         | Descendente       | Excelente selección de rutas        |
            | Horarios peligrosos    | 25%          | 35%             | Mejor         | Descendente       | Evitar horarios 20:00-02:00         |
            | Tiempo en zona segura  | 78%          | 65%             | Excelente     | Ascendente        | Modelo a seguir para otros usuarios |