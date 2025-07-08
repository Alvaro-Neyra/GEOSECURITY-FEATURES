# Feature: HU037 - Seguridad de datos personales
Feature: Seguridad de datos personales
    Como usuario
    Quiero que mis datos personales y de ubicación estén protegidos
    Para mantener mi privacidad y seguridad

    Scenario: Encriptación de datos sensibles
        Given que el usuario proporciona información personal, datos de ubicación o configura preferencias de seguridad
        When los datos se procesan y almacenan en los servidores del sistema
        Then toda la información sensible debe estar encriptada automáticamente con estándares AES-256 o superiores
        And no ser accesible sin autenticación adecuada mediante credenciales verificadas

        Examples:
            | Tipo_Dato        | Algoritmo_Encriptación | Longitud_Clave | Tiempo_Encriptación | Nivel_Protección | Acceso_Requerido   | Auditoría_Seguridad |
            | Ubicación GPS    | AES-256                | 256 bits       | 50 ms               | Máximo           | Token + 2FA        | Diaria              |
            | Datos personales | ChaCha20-Poly1305      | 256 bits       | 30 ms               | Máximo           | Biométrico + PIN   | Semanal             |
            | Reportes usuario | AES-256-GCM            | 256 bits       | 40 ms               | Alto             | Token válido       | Mensual             |
            | Historial rutas  | Salsa20                | 256 bits       | 35 ms               | Alto             | Sesión autenticada | Quincenal           |
            | Preferencias     | AES-128                | 128 bits       | 20 ms               | Medio            | Login básico       | Mensual             |

    Scenario: Protección contra accesos no autorizados
        Given que existe un intento de acceso no autorizado a los datos del usuario
        When el sistema de seguridad detecta patrones de actividad anómalos o intentos de intrusión
        Then debe bloquear el acceso inmediatamente y activar protocolos de seguridad adicionales
        And notificar al usuario a través de múltiples canales sobre el intento de intrusión detectado

        Examples:
            | Tipo_Amenaza       | Tiempo_Detección | Acción_Inmediata | Notificación_Usuario | Protocolo_Activado | Bloqueo_Duración | Investigación_Iniciada |
            | Login sospechoso   | 2 seg            | Bloqueo temporal | SMS + Email          | Nivel 1            | 15 min           | Automática             |
            | Múltiples intentos | 5 seg            | Bloqueo cuenta   | Llamada + App        | Nivel 2            | 2 horas          | Manual                 |
            | IP extranjera      | 1 seg            | Verificación 2FA | SMS inmediato        | Nivel 1            | Hasta verificar  | Automática             |
            | Patrón bot         | 3 seg            | Captcha avanzado | Email detallado      | Nivel 3            | 24 horas         | Especializada          |
            | Ataque coordinado  | 10 seg           | Bloqueo masivo   | Todas las vías       | Nivel 4            | 72 horas         | Forense                |

    Scenario: Anonimización de reportes
        Given que el usuario envía reportes de incidentes, calificaciones de zonas o información comunitaria
        When la información se procesa y almacena en el sistema para uso público
        Then los datos personales identificables deben ser anonimizados automáticamente
        And no permitir bajo ninguna circunstancia la identificación del usuario que proporcionó la información

        Examples:
            | Tipo_Reporte       | Datos_Originales           | Datos_Anonimizados       | Técnica_Anonimización  | Nivel_Privacidad | Utilidad_Mantenida | Reversibilidad |
            | Reporte robo       | UserID, GPS, hora, desc    | Hash, zona aprox, franja | K-anonimato            | Máximo           | 95%                | Imposible      |
            | Calificación zona  | Perfil, ubicación exacta   | Grupo demográfico, área  | L-diversidad           | Alto             | 90%                | Imposible      |
            | Comentario público | Nombre, texto completo     | Código anónimo, texto    | Diferencial privacy    | Máximo           | 88%                | Imposible      |
            | Foto evidencia     | Metadatos, geolocalización | Imagen limpia, zona      | Scrubbing metadatos    | Alto             | 92%                | Imposible      |
            | Patrón movilidad   | Historial completo rutas   | Tendencias agregadas     | Agregación estadística | Máximo           | 85%                | Imposible      |