# Feature: HU026 - Botón de emergencia
Feature: Botón de emergencia
    Como usuario
    Quiero tener un botón a la vista en caso de emergencia real
    Para poder solicitar ayuda de forma rápida y eficiente

    Scenario: Activación del botón de emergencia
        Given que el usuario se encuentra en una situación de peligro real
        When el usuario presiona el botón de seguridad visible en la pantalla principal
        Then el sistema debe activarse inmediatamente
        And comenzar el protocolo de emergencia establecido

        Examples:
            | Tipo_Emergencia | Ubicacion_GPS      | Tiempo_Activacion | Protocolo_Iniciado       | Servicios_Alertados    | Contactos_Notificados | Tiempo_Respuesta |
            | Asalto en curso | -12.0464, -77.0428 | Inmediato         | Emergencia Nivel 1       | PNP, Serenazgo         | 3 familiares          | 8 min            |
            | Accidente grave | -12.0431, -77.0282 | Inmediato         | Emergencia Médica        | SAMU, Bomberos         | 2 contactos           | 12 min           |
            | Secuestro       | -12.0512, -77.0353 | Inmediato         | Emergencia Nivel Crítico | PNP Especial, DIRINCRI | 5 contactos           | 15 min           |
            | Violencia       | -12.0389, -77.0298 | Inmediato         | Emergencia Doméstica     | PNP, CEM               | Contacto confianza    | 10 min           |
            | Persecución     | -12.0445, -77.0311 | Inmediato         | Emergencia Móvil         | PNP Patrullaje         | Familiar principal    | 6 min            |

    Scenario: Compartir ubicación con contactos predefinidos
        Given que se ha activado el botón de seguridad
        When el sistema procesa la emergencia
        Then debe enviar automáticamente la ubicación exacta a contactos de emergencia predefinidos
        And mantener el envío de ubicación en tiempo real hasta que se desactive manualmente

        Examples:
            | Contacto_Tipo | Nombre_Contacto | Ubicacion_Enviada   | Frecuencia_Update | Duracion_Seguimiento | Metodo_Envio   | Estado_Confirmacion |
            | Familiar      | María González  | Coordenadas + mapa  | Cada 30 seg       | Hasta desactivar     | WhatsApp + SMS | Confirmado          |
            | Pareja        | Carlos Mendoza  | Link tiempo real    | Cada 15 seg       | Hasta desactivar     | App + llamada  | Conectado           |
            | Amigo         | Ana López       | Coordenadas exactas | Cada 60 seg       | 2 horas máximo       | SMS            | Notificado          |
            | Trabajo       | Supervisor      | Ubicación general   | Cada 5 min        | 1 hora máximo        | Email + app    | Informado           |
            | Vecino        | Sr. Ramírez     | Zona aproximada     | Cada 2 min        | 30 min máximo        | Llamada        | En contacto         |

    Scenario: Alertas silenciosas a autoridades
        Given que el botón de emergencia está activado
        When se confirma la situación de peligro
        Then el sistema debe enviar una alerta discreta a las autoridades
        And proporcionar información contextual sobre el tipo de emergencia

        Examples:
            | Tipo_Autoridad | Información_Enviada                | Nivel_Prioridad | Tiempo_Respuesta | Personal_Asignado    | Protocolo_Seguido  | Estado_Seguimiento |
            | PNP Local      | Ubicación, tipo emergencia, perfil | Urgente         | 8 min            | Patrulla 205         | Código Rojo        | Activo             |
            | SAMU           | Coordenadas, posibles heridos      | Crítico         | 12 min           | Ambulancia A-15      | Protocolo Trauma   | En ruta            |
            | Bomberos       | Ubicación exacta, tipo de rescate  | Alto            | 15 min           | Unidad Rescate B-3   | Procedimiento Est. | Desplegado         |
            | Serenazgo      | Zona, descripción breve            | Medio           | 5 min            | Móvil S-12           | Apoyo PNP          | Coordinando        |
            | DIRINCRI       | Datos completos, perfil riesgo     | Máximo          | 20 min           | Unidad Especializada | Protocolo Especial | Activado           |
