# Feature: HU029 - Personalización de alertas
Feature: Personalización de alertas
    Como usuario
    Quiero personalizar el tipo de alertas que recibiré en la app
    Para recibir información relevante para mí

    Scenario: Configuración de tipos de delitos
        Given que el usuario accede a "Configuración de Alertas"
        When el usuario selecciona los tipos de delitos de su interés
        Then debe poder elegir específicamente robos, asaltos, accidentes, etc.
        And recibir solo alertas de los tipos seleccionados

        Examples:
            | Tipo_Delito        | Seleccionado | Prioridad_Asignada | Radio_Notificacion | Horario_Activo | Sonido_Personalizado | Vibración_Patrón |
            | Robos a personas   | Sí           | Muy Alta           | 400m               | 24 horas       | Urgente              | Intensa          |
            | Asaltos con armas  | Sí           | Máxima             | 600m               | 24 horas       | Crítico              | Doble pulso      |
            | Robos vehiculares  | Sí           | Alta               | 800m               | 18:00-06:00    | Moderado             | Pulso largo      |
            | Vandalismo         | No           | Ninguna            | 0m                 | Desactivado    | Ninguno              | Ninguna          |
            | Violencia familiar | Sí           | Media              | 500m               | 24 horas       | Suave                | Pulso corto      |
            | Accidentes tráfico | Sí           | Media              | 1000m              | 06:00-22:00    | Informativo          | Vibración suave  |

    Scenario: Configuración de radio de alertas
        Given que el usuario está personalizando sus alertas
        When el usuario configura el área de cobertura
        Then debe poder establecer el radio de distancia (500m, 1km, 2km)
        And recibir alertas solo dentro del área especificada

        Examples:
            | Zona_Frecuentada     | Radio_Configurado | Delitos_Incluidos | Alertas_Por_Día | Precision_GPS_Req | Tiempo_Permanencia | Ajuste_Automático |
            | Casa (Miraflores)    | 300m              | Todos             | 2-3             | Alta (95%)        | Inmediato          | Sí                |
            | Trabajo (San Isidro) | 500m              | Robos, asaltos    | 1-2             | Media (90%)       | 5 min              | Sí                |
            | Universidad (Centro) | 800m              | Robos, accidentes | 4-5             | Alta (95%)        | 10 min             | No                |
            | Compras (Centros)    | 1000m             | Robos, vandalismo | 3-4             | Media (85%)       | 15 min             | Sí                |
            | Recreación (Parques) | 600m              | Asaltos, drogas   | 1-2             | Alta (98%)        | Inmediato          | Sí                |

    Scenario: Horarios de alertas personalizados
        Given que el usuario quiere controlar cuándo recibir alertas
        When el usuario configura horarios específicos
        Then debe poder establecer períodos activos e inactivos para las notificaciones
        And el sistema debe respetar estos horarios automáticamente

        Examples:
            | Perfil_Horario | Horario_Activo | Horario_Silencioso | Excepciones_Críticas | Días_Aplicables | Ajuste_Automático_DST | Notificaciones_Diferidas |
            | Trabajador     | 06:00-22:00    | 22:00-06:00        | Emergencias nivel 1  | Lun-Vie         | Sí                    | Resumen matutino         |
            | Estudiante     | 07:00-23:00    | 23:00-07:00        | Zona universidad     | Lun-Sab         | Sí                    | Ninguna                  |
            | Nocturno       | 14:00-02:00    | 02:00-14:00        | Todas críticas       | Todos           | Sí                    | Resumen vespertino       |
            | Fin de semana  | 09:00-24:00    | 00:00-09:00        | Solo emergencias     | Sab-Dom         | Sí                    | Resumen domingo          |
            | Personalizado  | Variable       | Variable           | Configurables        | Seleccionables  | Opcional              | Configurable             |