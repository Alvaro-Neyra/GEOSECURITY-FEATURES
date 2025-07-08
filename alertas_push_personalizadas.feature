# Feature: HU002 - Recibir alertas push personalizadas
Feature: Recibir alertas push personalizadas
    Como usuario
    Quiero recibir alertas push en mi teléfono cuando entre o me acerque a una zona de alta peligrosidad
    Para poder reaccionar a tiempo

    Scenario: Configuración de alertas personalizadas
        Given que el usuario se encuentra en la sección de configuración
        And el usuario accede a "Alertas Push"
        When el usuario selecciona los tipos de delitos de su interés
        Then el sistema debe guardar las preferencias del usuario
        And activar las alertas para los tipos de delitos seleccionados

        Examples:
            | Tipo_Delito        | Seleccionado | Radio_Alerta | Prioridad | Horario_Activo | Sonido_Alerta |
            | Robos              | Sí           | 500m         | Alta      | 06:00-22:00    | Urgente       |
            | Asaltos            | Sí           | 300m         | Alta      | 24 horas       | Urgente       |
            | Vandalismo         | No           | 0m           | Baja      | Desactivado    | Ninguno       |
            | Robos Vehiculares  | Sí           | 800m         | Media     | 18:00-06:00    | Moderado      |
            | Violencia Familiar | No           | 0m           | Baja      | Desactivado    | Ninguno       |

    Scenario: Recepción de alerta al acercarse a zona peligrosa
        Given que el usuario tiene activadas las alertas push
        And el usuario se encuentra a menos de 500 metros de una zona de alta peligrosidad
        When el sistema detecta la proximidad a la zona peligrosa
        Then debe enviar una alerta push inmediata al dispositivo del usuario
        And la alerta debe especificar el tipo de peligro y la distancia

        Examples:
            | Ubicacion_Usuario | Zona_Peligrosa | Distancia | Tipo_Peligro | Mensaje_Alerta                       | Tiempo_Envio |
            | Av. Brasil 1200   | Gamarra        | 400m      | Robos        | "Zona de robos frecuentes a 400m" | Inmediato    |
            | Jr. Lampa 500     | Barrios Altos  | 250m      | Asaltos      | "Precaución: asaltos a 250m"      | Inmediato    |
            | Plaza San Martín  | Centro         | 150m      | Vandalismo   | "Actividad delictiva a 150m"       | Inmediato    |
            | Av. Arequipa 2000 | Lince          | 480m      | Robos        | "Zona de riesgo a 480m"           | Inmediato    |

    Scenario: Personalización según perfil de usuario
        Given que el usuario ha configurado su perfil como "peatón" o "conductor"
        And el usuario se acerca a una zona peligrosa
        When el sistema genera la alerta
        Then debe personalizar el mensaje según el tipo de usuario
        And sugerir acciones específicas para cada perfil

        Examples:
            | Perfil_Usuario | Zona_Peligro | Mensaje_Personalizado                               | Accion_Sugerida                   | Tiempo_Reaccion |
            | Peatón         | Gamarra      | " Peatón: Evita caminar solo por esta zona"    | Buscar rutas alternativas         | 30 segundos     |
            | Conductor      | La Victoria  | " Conductor: Asegura puertas y ventanas cerradas" | Acelerar paso, no detenerse       | 15 segundos     |
            | Repartidor     | Callao       | " Repartidor: Zona de robos a motorizados"        | Evitar entregas nocturnas         | 20 segundos     |
            | Turista        | Centro       | " Turista: Mantén objetos de valor ocultos"      | Dirigirse a zona turística segura | 25 segundos     |