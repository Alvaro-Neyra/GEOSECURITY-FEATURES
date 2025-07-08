# Feature: HU031 - Compartir información sobre rutas
Feature: Compartir información sobre rutas
    Como usuario
    Quiero compartir información sobre la ruta al contactar un taxi
    Para que el conductor y mis contactos sepan mi ubicación en tiempo real

    Scenario: Generación automática de link de ruta
        Given que el usuario ha planificado una ruta segura
        When el usuario decide compartir la información con un taxista
        Then el sistema debe generar automáticamente un link con los detalles de la ruta
        And incluir información sobre zonas de seguridad y peligros

        Examples:
            | Origen              | Destino              | Link_Generado   | Zonas_Peligro | Tiempo_Estimado | Codigo_Compartir | Validez_Link | Información_Incluida       |
            | Miraflores Centro   | Aeropuerto Jorge Ch  | gs.pe/rt/abc123 | 2             | 45 min          | ABC123           | 24 horas     | Ruta, alertas, contactos   |
            | Centro Histórico    | San Isidro Financial | gs.pe/rt/def456 | 1             | 30 min          | DEF456           | 12 horas     | Waypoints, nivel seguridad |
            | La Victoria Gamarra | Callao Puerto        | gs.pe/rt/ghi789 | 4             | 55 min          | GHI789           | 6 horas      | Desvíos, zonas críticas    |
            | San Juan Lurigancho | Miraflores           | gs.pe/rt/jkl012 | 3             | 65 min          | JKL012           | 8 horas      | Ruta completa, tiempos     |
            | Barranco            | Comas Norte          | gs.pe/rt/mno345 | 5             | 85 min          | MNO345           | 4 horas      | Alternativas, precauciones |

    Scenario: Envío automático de información de ruta
        Given que se ha generado el link de la ruta
        When el usuario contacta al servicio de taxi
        Then el sistema debe enviar automáticamente el link
        And proporcionar instrucciones claras al conductor

        Examples:
            | Servicio_Taxi | Método_Envío       | Información_Enviada                 | Tiempo_Envío | Confirmación_Lectura | Instrucciones_Adicionales             |
            | Uber          | App + SMS          | Link ruta + código + contacto       | Inmediato    | Sí                   | Evitar Jr. Lampa, usar Via Arequipa   |
            | Taxi Beat     | SMS + WhatsApp     | Coordenadas + ruta segura + tiempo  | 5 seg        | Pendiente            | Precaución en Av. Brasil cdra 15      |
            | InDriver      | Chat interno       | Link interactivo + mapa + alertas   | Inmediato    | Sí                   | Ruta verificada por seguridad         |
            | Taxi clásico  | SMS                | Dirección + referencias + teléfono  | 10 seg       | No                   | Llamar al llegar, tener precaución    |
            | Remisse       | WhatsApp + Llamada | Link completo + backup por teléfono | 15 seg       | Sí                   | Confirmar ruta antes de iniciar viaje |

    Scenario: Actualizaciones en tiempo real de la ruta compartida
        Given que la ruta ha sido compartida con el taxista
        When las condiciones de seguridad cambian durante el viaje
        Then el sistema debe actualizar automáticamente la información del link
        And notificar al conductor sobre cualquier cambio relevante

        Examples:
            | Cambio_Detectado     | Tipo_Actualización | Notificación_Conductor             | Tiempo_Actualización | Acción_Sugerida         | Ruta_Alternativa |
            | Nuevo incidente      | Crítica            | "Evitar Av. Brasil - robo activo"  | Inmediato            | Desvío inmediato        | Via Tacna        |
            | Manifestación        | Moderada           | "Congestión en Plaza San Martín"   | 2 min                | Ruta alternativa        | Via Wilson       |
            | Accidente de tráfico | Informativa        | "Tráfico lento en Via Expresa"     | 5 min                | Considerar alternativa  | Av. Javier Prado |
            | Lluvia intensa       | Precautoria        | "Conducir con precaución - lluvia" | 1 min                | Reducir velocidad       | Misma ruta       |
            | Operativo policial   | Informativa        | "Control policial en Av. Grau"     | 3 min                | Tener documentos listos | Continuar ruta   |