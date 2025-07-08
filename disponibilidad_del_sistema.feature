# Feature: HU038 - Disponibilidad del sistema
Feature: Disponibilidad del sistema
    Como usuario
    Quiero que la aplicación esté disponible cuando la necesite
    Para poder acceder a información de seguridad en cualquier momento

    Scenario: Disponibilidad continua del servicio
        Given que el usuario necesita acceder a funciones críticas de seguridad durante cualquier hora
        When intenta conectarse y usar el servicio en horarios regulares o durante emergencias
        Then el sistema debe estar operativo y completamente funcional el 99.9% del tiempo mensual
        And funcionar correctamente sin interrupciones no programadas que afecten las funciones esenciales

        Examples:
            | Mes     | Uptime_Objetivo | Uptime_Real | Downtime_Minutos | Incidentes_Críticos | SLA_Cumplido | Compensación_Aplicada |
            | Enero   | 99.9%           | 99.95%      | 22               | 1                   | Sí           | No requerida          |
            | Febrero | 99.9%           | 99.87%      | 53               | 2                   | No           | Créditos de servicio  |
            | Marzo   | 99.9%           | 99.99%      | 4                | 0                   | Sí           | Bonificación          |
            | Abril   | 99.9%           | 99.92%      | 35               | 1                   | Sí           | No requerida          |
            | Mayo    | 99.9%           | 99.85%      | 65               | 3                   | No           | Extensión gratuita    |

    Scenario: Funcionamiento en modo sin conexión
        Given que el usuario se encuentra en una zona con conectividad limitada o sin acceso a internet
        When intenta acceder a funciones básicas y críticas de seguridad personal
        Then debe poder consultar datos previamente sincronizados y descargados en el dispositivo
        And usar funciones esenciales como el botón de emergencia que funcione mediante SMS cuando se restablezca la conexión

        Examples:
            | Tipo_Conexión      | Funciones_Disponibles      | Datos_Offline_Accesibles | Botón_Emergencia  | Sincronización_Pendiente | Tiempo_Autonomía |
            | Sin conexión       | Mapa base, rutas guardadas | Últimas 24 horas         | SMS diferido      | Al reconectar            | 48 horas         |
            | Conexión muy lenta | Funciones básicas          | Cache completo           | Funcional         | En segundo plano         | Ilimitado        |
            | Conexión inestable | Funciones críticas         | Datos esenciales         | Totalmente activo | Automática               | 72 horas         |
            | Modo avión         | Solo datos locales         | Cache del dispositivo    | No funcional      | Al activar conexión      | 24 horas         |
            | Roaming limitado   | Funciones optimizadas      | Datos comprimidos        | Funcional         | Bajo consumo             | Variable         |

    Scenario: Recuperación automática ante fallos
        Given que ocurre una falla técnica imprevista en los servidores durante horarios de alta demanda
        When se detecta automáticamente la interrupción del servicio mediante sistemas de monitoreo continuo
        Then el sistema debe implementar protocolos de recuperación automática
        And restablecerse completamente en menos de 2 minutos notificando cuando esté restaurado

        Examples:
            | Tipo_Falla            | Tiempo_Detección | Protocolo_Recuperación | Tiempo_Restauración | Usuarios_Afectados | Notificación_Enviada | Causa_Identificada |
            | Sobrecarga servidor   | 15 seg           | Auto-scaling           | 45 seg              | 2,500              | Automática           | Tráfico pico       |
            | Falla base datos      | 8 seg            | Failover secundario    | 1.2 min             | 8,000              | Inmediata            | Hardware           |
            | Corte red             | 5 seg            | Ruta alternativa       | 30 seg              | 1,200              | SMS + Push           | ISP                |
            | Ataque DDoS           | 12 seg           | Mitigación automática  | 2.5 min             | 15,000             | Multi-canal          | Externo            |
            | Actualización fallida | 20 seg           | Rollback automático    | 1.8 min             | 500                | In-app               | Deploy error       |