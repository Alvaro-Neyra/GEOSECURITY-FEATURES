# Feature: HU016 - Conectar con bomberos en caso de desastre
Feature: Conectar con bomberos en caso de desastre
    Como usuario
    Quiero tener a la mano la línea directa de los bomberos
    Para casos de desastres naturales

    Scenario: Acceso inmediato a bomberos
        Given que el usuario enfrenta una situación de desastre natural
        When el usuario presiona el botón de "Emergencia de Desastre"
        Then el sistema debe mostrar inmediatamente el número de bomberos más cercano
        And permitir llamada directa con un solo toque

        Examples:
            | Tipo_Desastre | Ubicacion_Usuario   | Compañia_Bomberos | Distancia | Numero_Directo | Tiempo_Respuesta | Personal_Disponible |
            | Incendio      | Miraflores Centro   | CB Roma 1         | 1.5 km    | 116-ext001     | 8 min            | 12 bomberos         |
            | Sismo severo  | La Victoria         | CB Victoria 5     | 2.1 km    | 116-ext005     | 12 min           | 15 bomberos         |
            | Inundación    | Callao Puerto       | CB Callao 3       | 0.9 km    | 116-ext003     | 6 min            | 18 bomberos         |
            | Derrumbe      | Centro Histórico    | CB Central 2      | 1.8 km    | 116-ext002     | 10 min           | 20 bomberos         |
            | Explosión     | San Juan Lurigancho | CB SJL 8          | 3.2 km    | 116-ext008     | 15 min           | 10 bomberos         |

    Scenario: Información contextual del desastre
        Given que el usuario está contactando a bomberos por desastre
        When se establece la comunicación
        Then el sistema debe proporcionar información sobre el tipo de desastre reportado
        And enviar automáticamente la ubicación exacta y número de personas en riesgo

        Examples:
            | Tipo_Desastre | Info_Automatica_Enviada                | Coordenadas_GPS    | Personas_Riesgo | Edificios_Afectados | Nivel_Urgencia |
            | Incendio      | "Incendio estructural reportado"       | -12.0464, -77.0428 | 15              | 2                   | Crítico        |
            | Sismo         | "Daños por sismo, derrumbes parciales" | -12.0431, -77.0282 | 50              | 5                   | Alto           |
            | Inundación    | "Inundación por desborde de río"       | -12.0512, -77.0353 | 25              | 8                   | Alto           |
            | Derrumbe      | "Colapso de estructura antigua"        | -12.0389, -77.0298 | 8               | 1                   | Crítico        |
            | Explosión     | "Explosión con humo y escombros"       | -12.0445, -77.0311 | 30              | 3                   | Crítico        |

    Scenario: Coordinación con otros servicios de emergencia
        Given que se ha reportado un desastre natural
        When se contacta a los bomberos
        Then el sistema debe alertar automáticamente a otros servicios (ambulancia, policía)
        And crear un canal de coordinación entre todos los servicios de emergencia

        Examples:
            | Desastre_Reportado | Bomberos_Alertados | Ambulancias_Enviadas | Policia_Desplegada | Defensa_Civil | Canal_Coordinacion | ETA_Conjunto |
            | Incendio edificio  | CB Roma 1          | 3 unidades SAMU      | 2 patrullas PNP    | Activada      | Canal Alpha        | 8 min        |
            | Sismo con heridos  | CB Central 2       | 5 unidades médicas   | 4 patrullas PNP    | Activada      | Canal Bravo        | 12 min       |
            | Inundación masiva  | CB Callao 3        | 2 ambulancias        | 6 unidades PNP     | Activada      | Canal Charlie      | 15 min       |
            | Derrumbe fatal     | CB Victoria 5      | 4 unidades trauma    | 3 patrullas PNP    | Activada      | Canal Delta        | 10 min       |
            | Explosión química  | CB Especializada   | Unidad HAZMAT        | Brigada especial   | Coordinando   | Canal Echo         | 18 min       |