# Feature: HU015 - Consultar números de emergencia
Feature: Consultar números de emergencia
    Como usuario
    Quiero consultar un apartado donde estén los números de emergencia de cada zona/distrito
    Para contactar al instante

    Scenario: Directorio de números por distrito
        Given que el usuario accede a "Números de Emergencia"
        When el usuario selecciona su distrito actual
        Then el sistema debe mostrar todos los números de emergencia de la zona
        And verificar que todos los datos sean 100% correctos y actualizados

        Examples:
            | Distrito    | Policia_Local | Serenazgo | Bomberos | Hospital_Cercano | Municipalidad | Actualizacion | Verificacion |
            | Miraflores  | 445-0067      | 617-7313  | 116      | 445-1000         | 617-7272      | 2024-07-01    | Verificado   |
            | La Victoria | 424-8888      | 472-0649  | 116      | 426-3000         | 472-7777      | 2024-07-01    | Verificado   |
            | San Isidro  | 441-0055      | 513-9200  | 116      | 441-1000         | 513-9000      | 2024-07-01    | Verificado   |
            | Callao      | 429-8989      | 613-8080  | 116      | 429-7000         | 613-8000      | 2024-07-01    | Verificado   |
            | Centro Lima | 427-6060      | 315-1818  | 116      | 427-3000         | 315-1800      | 2024-07-01    | Verificado   |

    Scenario: Llamada directa desde la aplicación
        Given que el usuario está consultando los números de emergencia
        When el usuario selecciona un número específico (policía, bomberos, serenazgo)
        Then debe poder realizar la llamada directamente desde la aplicación
        And marcar automáticamente sin necesidad de copiar el número

        Examples:
            | Servicio_Seleccionado | Numero_Marcado | Tiempo_Conexion | Estado_Llamada | Respuesta_Obtenida     | Ubicacion_Enviada | Protocolo_Seguido |
            | PNP Miraflores        | 445-0067       | 3 seg           | Conectado      | Central de emergencias | Automática        | Estándar          |
            | Serenazgo La Victoria | 472-0649       | 2 seg           | Conectado      | Operador disponible    | Automática        | Estándar          |
            | Bomberos              | 116            | 1 seg           | Conectado      | Central nacional       | Automática        | Prioritario       |
            | SAMU                  | 106            | 2 seg           | Conectado      | Emergencias médicas    | Automática        | Crítico           |
            | Defensa Civil         | 115            | 4 seg           | Conectado      | Centro coordinación    | Automática        | Especial          |

    Scenario: Números de emergencia por tipo de servicio
        Given que el usuario tiene una emergencia específica
        When el usuario busca el tipo de servicio requerido (médico, policial, bomberos)
        Then el sistema debe mostrar los números correspondientes ordenados por proximidad
        And incluir información adicional como dirección y disponibilidad

        Examples:
            | Tipo_Emergencia | Servicio_Primario | Distancia | Disponibilidad | Servicio_Respaldo  | Dist_Respaldo | Direccion_Referencia    |
            | Médica          | Hospital Nacional | 2.5 km    | 24 horas       | Clínica San Felipe | 3.8 km        | Av. Honorio Delgado 262 |
            | Policial        | Comisaría Centro  | 1.2 km    | 24 horas       | PNP Tránsito       | 2.1 km        | Jr. Camaná 118          |
            | Incendio        | Bomberos CB-1     | 0.8 km    | 24 horas       | Bomberos CB-5      | 2.3 km        | Av. 28 de Julio 755     |
            | Accidente       | SAMU              | Variable  | 24 horas       | Cruz Roja          | 1.9 km        | Jirón Miro Quesada 247  |
            | Desastre        | Defensa Civil     | 3.1 km    | 24 horas       | INDECI             | 4.5 km        | Av. del Ejército 182    |