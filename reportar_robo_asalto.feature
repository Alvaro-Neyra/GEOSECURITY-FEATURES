# Feature: HU013 - Reportar Robo/Asalto
Feature: Reportar Robo/Asalto
    Como ciudadano
    Quiero tener la capacidad de reportar robos o asaltos
    Para poder alertar a las autoridades/policías lo más pronto posible

    Scenario: Reporte urgente de robo/asalto
        Given que el usuario presencia o es víctima de un robo/asalto
        When el usuario presiona el botón de "Emergencia" y selecciona "Robo/Asalto"
        Then el sistema debe enviar inmediatamente la alerta a las autoridades
        And garantizar un tiempo de respuesta policial máximo de 20 minutos

        Examples:
            | Tipo_Delito     | Ubicacion_GPS      | Descripcion_Breve           | Arma_Involucrada | Numero_Delincuentes | Tiempo_Respuesta | Unidad_Asignada |
            | Robo con arma   | -12.0464, -77.0428 | Robo de celular con pistola | Pistola          | 1                   | 12 min           | Patrulla 205    |
            | Asalto grupal   | -12.0431, -77.0282 | Asalto por 3 sujetos        | Cuchillo         | 3                   | 8 min            | Eagle 15        |
            | Robo al paso    | -12.0512, -77.0353 | Arrebato de cartera         | Ninguna          | 2                   | 15 min           | Móvil 150       |
            | Asalto con arma | -12.0389, -77.0298 | Asalto con machete          | Machete          | 1                   | 10 min           | DOES Lima       |
            | Robo vehicular  | -12.0445, -77.0311 | Robo de auto en semáforo    | Pistola          | 2                   | 18 min           | Patrulla 308    |

    Scenario: Captura de evidencia en situación de riesgo
        Given que el usuario está reportando un robo/asalto
        When la situación permite tomar evidencia de forma segura
        Then debe poder adjuntar fotos o videos discretamente
        And el sistema debe permitir envío rápido sin confirmaciones adicionales

        Examples:
            | Tipo_Evidencia   | Metodo_Captura | Tamaño_Archivo | Envio_Automatico | Tiempo_Subida | Modo_Discreto | Estado_Seguridad |
            | Foto delincuente | Cámara trasera | 2.8 MB         | Sí               | 2 seg         | Activado      | Riesgo bajo      |
            | Video escape     | Grabación auto | 8.5 MB         | Sí               | 5 seg         | Activado      | Riesgo medio     |
            | Audio ambiente   | Micrófono      | 1.2 MB         | Sí               | 1 seg         | Activado      | Riesgo alto      |
            | Foto vehículo    | Zoom digital   | 3.1 MB         | Sí               | 3 seg         | Activado      | Riesgo bajo      |
            | Captura pantalla | Screenshot GPS | 0.8 MB         | Sí               | 1 seg         | Activado      | Seguro           |

    Scenario: Alerta silenciosa a contactos de emergencia
        Given que el usuario activa el reporte de robo/asalto
        When se envía la alerta a autoridades
        Then el sistema debe notificar automáticamente a contactos de emergencia predefinidos
        And compartir la ubicación en tiempo real hasta que se confirme la seguridad

        Examples:
            | Contacto_Tipo | Nombre_Contacto | Metodo_Notificacion | Ubicacion_Compartida | Duracion_Seguimiento | Estado_Contacto | Respuesta_Contacto |
            | Familiar      | María González  | WhatsApp + SMS      | Tiempo real          | 60 min               | Notificado      | "En camino"        |
            | Amigo cercano | Carlos Ruiz     | Llamada + App       | Tiempo real          | 60 min               | Conectado       | "Llamando policía" |
            | Pareja        | Ana López       | Todas las vías      | Tiempo real          | 60 min               | Alarmada        | "Saliendo ahora"   |
            | Trabajo       | Jefe Oficina    | Email + App         | Solo inicial         | 30 min               | Informado       | "Apoyo disponible" |
            | Vecino        | Sr. Ramírez     | SMS                 | Solo inicial         | 30 min               | Notificado      | "Revisando zona"   |