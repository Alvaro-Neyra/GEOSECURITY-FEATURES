# Feature: HU009 - Contactar con ambulancia
Feature: Contactar con ambulancia
    Como ciudadano
    Quiero contar con la opción de comunicarme al instante con una ambulancia
    Para poder solicitar ayuda médica rápidamente

    Scenario: Contacto inmediato con ambulancia
        Given que el usuario se encuentra en una situación de emergencia médica
        When el usuario presiona el botón "Emergencia Médica"
        Then el sistema debe mostrar inmediatamente el número de la ambulancia más cercana
        And proporcionar la opción de llamar directamente desde la aplicación

        Examples:
            | Ubicacion_Usuario   | Ambulancia_Cercana   | Distancia | Tiempo_Llegada | Numero_Contacto | Estado_Disponible | Tipo_Servicio |
            | Miraflores Centro   | Hospital Nacional    | 2.5 km    | 8 min          | 116-001         | Disponible        | SAMU          |
            | La Victoria         | Clínica San Pablo    | 1.8 km    | 6 min          | 116-002         | En servicio       | Privada       |
            | Callao Puerto       | Hospital Sabogal     | 3.2 km    | 12 min         | 116-003         | Disponible        | EsSalud       |
            | San Juan Lurigancho | Hospital Hipólito    | 4.1 km    | 15 min         | 116-004         | Disponible        | MINSA         |
            | Centro Histórico    | Hospital Dos de Mayo | 1.2 km    | 5 min          | 116-005         | En camino         | MINSA         |

    Scenario: Ubicación automática para servicios de emergencia
        Given que el usuario ha solicitado contacto con ambulancia
        When se establece la comunicación
        Then el sistema debe enviar automáticamente la ubicación exacta del usuario
        And mantener la línea abierta hasta que llegue la asistencia

        Examples:
            | Coordenadas_GPS    | Direccion_Referencial   | Precision_GPS | Info_Adicional      | Estado_Comunicacion | Tiempo_Respuesta |
            | -12.0464, -77.0428 | Av. Larco cdra 12       | 98%           | Frente a farmacia   | Línea activa        | 3 min            |
            | -12.0431, -77.0282 | Jr. Lampa esq. Carabaya | 95%           | Cerca de iglesia    | Línea activa        | 5 min            |
            | -12.0512, -77.0353 | Av. Brasil cdra 8       | 97%           | Al lado de grifo    | Línea activa        | 4 min            |
            | -12.0389, -77.0298 | Plaza San Martín        | 99%           | Lado norte de plaza | Línea activa        | 2 min            |
            | -12.0445, -77.0311 | Av. Tacna cdra 15       | 96%           | Frente a banco      | Línea activa        | 6 min            |

    Scenario: Información de contacto de respaldo
        Given que la ambulancia más cercana no está disponible
        When el sistema detecta la falta de disponibilidad
        Then debe mostrar números alternativos de servicios médicos
        And proporcionar información sobre hospitales cercanos con sus distancias

        Examples:
            | Servicio_Primario | Estado_Primario   | Servicio_Respaldo_1  | Distancia_1 | Servicio_Respaldo_2  | Distancia_2 | Hospital_Cercano    | Distancia_Hosp |
            | SAMU Miraflores   | No disponible     | Clínica San Felipe   | 3.5 km      | Bomberos Voluntarios | 2.8 km      | Clínica Angloamer.  | 4.2 km         |
            | Hospital Sabogal  | Ocupado           | Cruz Roja Callao     | 2.1 km      | SAMU Central         | 5.5 km      | Hospital Naval      | 3.8 km         |
            | Clínica San Pablo | En reparación     | Hospital Nacional    | 4.8 km      | Ambulancia Privada   | 2.2 km      | Hospital Rebagliati | 6.1 km         |
            | SAMU Central      | Fuera de servicio | Hospital Dos de Mayo | 3.3 km      | Bomberos Lima        | 1.9 km      | Hospital Arzobispo  | 4.7 km         |