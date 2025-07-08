# Feature: HU030 - Distinguir reporte verídico de falso
Feature: Distinguir reporte verídico de falso
    Como usuario
    Quiero identificar reportes falsos de los verdaderos
    Para evitar alarmas innecesarias

    Scenario: Sistema de verificación de reportes
        Given que hay múltiples reportes sobre un incidente
        When el sistema analiza la consistencia de la información
        Then debe asignar un nivel de confiabilidad a cada reporte
        And mostrar un icono que indique el nivel de verificación

        Examples:
            | Reporte_ID | Usuarios_Confirmaron | Tiempo_Verificacion | Nivel_Confianza | Icono_Estado | Accion_Sistema           | Factores_Verificacion        |
            | RPT101     | 5                    | 10 min              | Alto (95%)      | Verde ✓      | Publicar inmediatamente  | GPS, múltiples fuentes       |
            | RPT102     | 1                    | 45 min              | Bajo (30%)      | Amarillo ⚠   | Marcar para revisión     | Fuente única, sin confirmar  |
            | RPT103     | 0                    | 60 min              | Muy Bajo (10%)  | Rojo ✗       | Ocultar del feed         | Sin confirmación, sospechoso |
            | RPT104     | 3                    | 20 min              | Medio (70%)     | Azul ℹ       | Mostrar con advertencia  | Confirmación parcial         |
            | RPT105     | 8                    | 5 min               | Muy Alto (98%)  | Verde ✓✓     | Destacar como verificado | Múltiples fuentes confiables |

    Scenario: Iconografía clara para tipos de reporte
        Given que el usuario visualiza la lista de reportes
        When el usuario observa los diferentes reportes disponibles
        Then debe ver iconos distintivos que diferencien reportes verificados, no verificados y dudosos
        And entender fácilmente el significado de cada icono

        Examples:
            | Tipo_Reporte    | Icono_Principal | Color_Fondo | Descripcion_Tooltip         | Nivel_Confianza | Tiempo_Verificacion | Acciones_Disponibles     |
            | Verificado      | ✓✓              | Verde       | "Confirmado por múltiples"  | 90-100%         | < 15 min            | Ver detalles, compartir  |
            | Confirmado      | ✓               | Verde claro | "Verificado por comunidad"  | 75-89%          | < 30 min            | Ver detalles, reportar   |
            | En verificación | ⏳               | Amarillo    | "Esperando confirmación"    | 50-74%          | < 60 min            | Confirmar, dudar         |
            | Dudoso          | ⚠               | Naranja     | "Información inconsistente" | 25-49%          | > 60 min            | Reportar como falso      |
            | No confiable    | ✗               | Rojo        | "Posiblemente falso"        | 0-24%           | > 120 min           | Solo ver, no interactuar |

    Scenario: Retroalimentación comunitaria para verificación
        Given que un reporte ha sido publicado
        When otros usuarios en la zona pueden confirmar o desmentir la información
        Then el sistema debe permitir validación comunitaria
        And actualizar el estado de verificación según el consenso

        Examples:
            | Reporte_Original | Confirmaciones_A_Favor | Confirmaciones_En_Contra | Usuarios_Neutrales | Consenso_Final | Estado_Actualizado | Tiempo_Consenso |
            | Robo en Gamarra  | 8                      | 1                        | 2                  | Confirmado     | Verificado         | 15 min          |
            | Asalto en Centro | 2                      | 6                        | 1                  | Negado         | Falso              | 25 min          |
            | Accidente Callao | 5                      | 5                        | 3                  | Incierto       | En revisión        | 45 min          |
            | Pelea en Plaza   | 7                      | 0                        | 1                  | Confirmado     | Verificado         | 8 min           |
            | Robo inexistente | 0                      | 9                        | 0                  | Falso          | Eliminado          | 12 min          |