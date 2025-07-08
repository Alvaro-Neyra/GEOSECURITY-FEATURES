# Feature: HU024 - Advertencia de zonas desconocidas
Feature: Advertencia de zonas desconocidas
    Como usuario
    Quiero que la app se active cuando transite por zonas que no he transitado antes
    Para estar alerta sobre posibles riesgos

    Scenario: Detección automática de zonas nuevas
        Given que el usuario está transitando por una zona
        When el sistema detecta que es la primera vez que visita esa área
        Then debe activar automáticamente una advertencia
        And solicitar mayor atención a la seguridad del entorno

        Examples:
            | Zona_Nueva        | Historial_Usuario | Nivel_Peligro | Tipo_Alerta | Recomendaciones_Especificas        | Tiempo_Permanencia_Min |
            | Barrios Altos     | Primera visita    | Alto          | Crítica     | Evitar horario nocturno            | 5 min                  |
            | Villa El Salvador | Primera visita    | Medio         | Moderada    | Mantenerse en avenidas principales | 3 min                  |
            | Pueblo Libre      | Primera visita    | Bajo          | Informativa | Zona segura, precauciones normales | 2 min                  |
            | Comas Norte       | Primera visita    | Alto          | Crítica     | No transitar solo, evitar noche    | 5 min                  |
            | Magdalena del Mar | Primera visita    | Bajo          | Informativa | Zona residencial segura            | 2 min                  |

    Scenario: Configuración de intensidad de avisos
        Given que el usuario recibe advertencias de zonas desconocidas
        When el usuario accede a la configuración de alertas
        Then debe poder regular la intensidad del aviso (alto, medio, bajo)
        And personalizar el tipo de notificación preferida

        Examples:
            | Intensidad_Configurada | Tipo_Notificacion | Frecuencia_Avisos | Duración_Pantalla | Sonido_Alerta | Vibración | Persistencia_Config |
            | Alta                   | Push + Sonido     | Inmediata         | 10 seg            | Urgente       | Intensa   | Permanente          |
            | Media                  | Solo Push         | Tras 2 min        | 5 seg             | Suave         | Ligera    | Permanente          |
            | Baja                   | Visual sutil      | Tras 5 min        | 3 seg             | Ninguno       | Ninguna   | Permanente          |
            | Personalizada          | Push + Vibración  | Configurable      | Variable          | Medio         | Media     | Permanente          |
            | Desactivada            | Ninguna           | No aplica         | No aplica         | No aplica     | No aplica | Temporal            |

    Scenario: Información adicional sobre la zona nueva
        Given que el usuario está en una zona desconocida
        When el usuario recibe la advertencia
        Then el sistema debe proporcionar información básica de seguridad de la zona
        And estadísticas de criminalidad para mayor contexto

        Examples:
            | Zona_Desconocida | Info_Seguridad_Basica              | Estadisticas_Criminalidad | Horarios_Criticos | Lugares_Seguros_Cercanos | Contactos_Emergencia_Zona |
            | Barrios Altos    | Zona de alto riesgo, mucha cautela | 45 incidentes/mes         | 20:00-06:00       | Comisaría a 800m         | PNP: 315-1818             |
            | Villa Salvador   | Precaución moderada, evitar calles | 18 incidentes/mes         | 22:00-05:00       | Serenazgo a 1.2km        | Serenazgo: 287-0000       |
            | Pueblo Libre     | Zona segura, precauciones normales | 5 incidentes/mes          | 02:00-05:00       | Hospital a 600m          | PNP: 461-3838             |
            | Comas Norte      | Alto riesgo, evitar transitar solo | 38 incidentes/mes         | 19:00-07:00       | Comisaría a 1.5km        | PNP: 558-2222             |
            | Magdalena        | Zona residencial muy segura        | 2 incidentes/mes          | 03:00-05:00       | Clínica a 400m           | Serenazgo: 461-7777       |