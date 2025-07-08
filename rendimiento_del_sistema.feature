# Feature: HU036 - Rendimiento del sistema
Feature: Rendimiento del sistema
    Como usuario
    Quiero que la aplicación responda rápidamente a mis acciones
    Para poder acceder a información de seguridad sin demoras

    Scenario: Tiempo de carga de la aplicación
        Given que el usuario abre la aplicación por primera vez en el día
        And el dispositivo tiene conexión a internet estable
        When el sistema inicia la carga de datos principales de seguridad y configuración del usuario
        Then la pantalla principal debe cargar completamente en menos de 3 segundos
        And mostrar información básica de seguridad de la zona actual inmediatamente

        Examples:
            | Dispositivo    | Conexión | Tiempo_Carga | Datos_Mostrados       | Performance_Score | Memoria_Utilizada | CPU_Utilizado |
            | iPhone 12      | 4G       | 2.1 seg      | Mapa + 5 alertas      | Excelente         | 45 MB             | 15%           |
            | Samsung S21    | WiFi     | 1.8 seg      | Mapa + 8 alertas      | Excelente         | 52 MB             | 12%           |
            | Xiaomi Mi 11   | 5G       | 1.5 seg      | Mapa + 10 alertas     | Excepcional       | 48 MB             | 10%           |
            | iPhone SE      | 3G       | 2.9 seg      | Mapa + 3 alertas      | Bueno             | 38 MB             | 22%           |
            | Android básico | WiFi     | 2.7 seg      | Mapa básico + 2 alert | Aceptable         | 35 MB             | 28%           |

    Scenario: Respuesta a interacciones del usuario
        Given que el usuario interactúa con cualquier elemento de la interfaz
        When el usuario presiona botones o selecciona opciones
        Then el sistema debe responder en menos de 1 segundo
        And proporcionar retroalimentación visual inmediata

        Examples:
            | Acción_Usuario      | Tiempo_Respuesta | Feedback_Visual      | Animación_Duración | Recursos_Consumidos | Fluidez_Percibida |
            | Tocar botón reporte | 0.2 seg          | Destacado inmediato  | 0.3 seg            | Mínimos             | Perfecta          |
            | Cambiar vista mapa  | 0.5 seg          | Transición suave     | 0.8 seg            | Moderados           | Excelente         |
            | Abrir configuración | 0.3 seg          | Deslizamiento fluido | 0.5 seg            | Bajos               | Muy buena         |
            | Buscar ubicación    | 0.8 seg          | Spinner + resultados | 1.2 seg            | Moderados           | Buena             |
            | Enviar reporte      | 0.6 seg          | Confirmación visual  | 1.0 seg            | Altos               | Buena             |

    Scenario: Carga de mapas y datos pesados
        Given que el usuario solicita información que requiere procesamiento intensivo
        When el usuario accede a mapas de calor o estadísticas complejas
        Then los datos deben cargarse progresivamente en menos de 5 segundos
        And mostrar indicadores de progreso durante la carga

        Examples:
            | Tipo_Datos           | Tamaño_Datos | Tiempo_Carga | Progreso_Mostrado | Carga_Progresiva | Calidad_Final | Optimización_Aplicada |
            | Mapa calor completo  | 2.8 MB       | 3.2 seg      | Barra progreso    | Sí               | Alta          | Compresión + cache    |
            | Estadísticas anuales | 1.5 MB       | 2.1 seg      | Spinner animado   | Sí               | Completa      | Paginación + lazy     |
            | Rutas complejas      | 800 KB       | 1.8 seg      | Puntos carga      | Sí               | Óptima        | Algoritmos eficientes |
            | Reportes detallados  | 3.5 MB       | 4.5 seg      | Porcentaje        | Sí               | Completa      | Streaming de datos    |
            | Mapas satelitales    | 5.2 MB       | 4.8 seg      | Tiles graduales   | Sí               | HD            | CDN + compresión      |