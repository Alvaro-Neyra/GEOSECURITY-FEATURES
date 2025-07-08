# Feature: HU032 - Interfaz en modo oscuro
Feature: Interfaz en modo oscuro
    Como usuario
    Quiero tener una interfaz en modo oscuro
    Para reducir el consumo de batería y facilitar la visualización en entornos con poca luz

    Scenario: Activación del modo oscuro
        Given que el usuario está en la configuración de la aplicación
        When el usuario selecciona "Modo Oscuro"
        Then la interfaz debe cambiar inmediatamente a colores oscuros
        And todos los elementos deben ser claramente visibles

        Examples:
            | Dispositivo | Ahorro_Batería | Contraste_Logrado | Legibilidad_Nocturna | Tiempo_Cambio | Elementos_Adaptados | Accesibilidad_Mejorada |
            | iPhone 12   | 15%            | 7:1               | Excelente            | Inmediato     | 100%                | Sí                     |
            | Samsung S21 | 20%            | 8:1               | Excelente            | Inmediato     | 100%                | Sí                     |
            | Xiaomi Mi11 | 18%            | 6.5:1             | Muy buena            | Inmediato     | 100%                | Sí                     |
            | Huawei P40  | 17%            | 7.2:1             | Excelente            | Inmediato     | 98%                 | Sí                     |
            | OnePlus 9   | 19%            | 7.8:1             | Excelente            | Inmediato     | 100%                | Sí                     |

    Scenario: Activación automática según horario
        Given que el usuario ha configurado modo automático
        When el sistema detecta condiciones de poca luz o llega el horario programado
        Then debe cambiar automáticamente al modo oscuro
        And notificar discretamente el cambio

        Examples:
            | Horario_Programado | Sensor_Luz_Ambiente | Activación_Automática | Notificación_Mostrada  | Tiempo_Transición | Reversión_Automática |
            | 20:00-07:00        | < 50 lux            | Sí                    | "Modo nocturno activo" | 0.5 seg           | 07:00                |
            | 21:00-06:00        | < 30 lux            | Sí                    | Ninguna                | 0.3 seg           | 06:00                |
            | Sunset-Sunrise     | Variable            | Sí                    | "Adaptado al horario"  | 1 seg             | Sunrise              |
            | Manual únicamente  | No considerado      | No                    | No aplica              | Inmediato         | Manual únicamente    |
            | Según ubicación    | GPS + hora          | Sí                    | "Modo adaptativo"      | 0.8 seg           | Según ubicación      |

    Scenario: Conservación de legibilidad en modo oscuro
        Given que el usuario ha activado el modo oscuro
        When el usuario navega por diferentes secciones de la app
        Then todos los textos, mapas y elementos gráficos deben mantener su legibilidad
        And el contraste debe ser adecuado para uso nocturno

        Examples:
            | Sección_App    | Contraste_Texto | Legibilidad_Mapas | Visibilidad_Iconos | Fatiga_Visual | Precisión_Colores | Accesibilidad_WCAG |
            | Mapa de calor  | 8.5:1           | Excelente         | 100%               | Mínima        | Mantenida         | AAA                |
            | Lista reportes | 7.8:1           | Muy buena         | 98%                | Baja          | Adaptada          | AA                 |
            | Configuración  | 9.2:1           | Excelente         | 100%               | Mínima        | Mantenida         | AAA                |
            | Navegación GPS | 8.1:1           | Excelente         | 100%               | Muy baja      | Optimizada        | AAA                |
            | Perfil usuario | 7.5:1           | Buena             | 95%                | Baja          | Suficiente        | AA                 |