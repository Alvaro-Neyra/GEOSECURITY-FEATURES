# Feature: HU019 - Calificar zonas
Feature: Calificar zonas
    Como usuario
    Quiero tener la capacidad de calificar de manera anónima las zonas que considere peligrosas o seguras
    Para contribuir a la seguridad de la comunidad

    Scenario: Sistema de calificación por estrellas
        Given que el usuario se encuentra en una zona específica
        When el usuario selecciona "Calificar Zona"
        Then debe poder asignar una calificación de 1 a 5 estrellas (1 muy peligrosa, 5 muy segura)
        And el sistema debe mantener la calificación completamente anónima

        Examples:
            | Zona_Calificada      | Calificacion_Usuario | Promedio_Antes | Promedio_Despues | Total_Calificaciones | Tendencia_Semanal | Anonimato_Garantizado |
            | Miraflores Centro    | 5 estrellas          | 4.2            | 4.3              | 150                  | Estable           | Sí                    |
            | La Victoria Gamarra  | 2 estrellas          | 2.8            | 2.7              | 200                  | Descendente       | Sí                    |
            | San Isidro Financial | 5 estrellas          | 4.5            | 4.5              | 100                  | Ascendente        | Sí                    |
            | Centro Histórico     | 3 estrellas          | 3.1            | 3.1              | 180                  | Estable           | Sí                    |
            | Callao Puerto        | 1 estrella           | 2.2            | 2.1              | 85                   | Descendente       | Sí                    |

    Scenario: Actualización en tiempo real del puntaje promedio
        Given que un usuario ha calificado una zona
        When se registra la nueva calificación
        Then el sistema debe actualizar inmediatamente el puntaje promedio de la zona
        And reflejar el cambio en el mapa de calor

        Examples:
            | Zona_Actualizada | Calificaciones_Nuevas | Promedio_Anterior | Promedio_Nuevo | Cambio_Mapa_Calor | Tiempo_Actualizacion | Usuarios_Notificados |
            | Miraflores       | 15 en última hora     | 4.2               | 4.4            | Más verde         | Inmediato            | 45                   |
            | La Victoria      | 22 en última hora     | 2.7               | 2.5            | Más rojo          | Inmediato            | 78                   |
            | San Isidro       | 8 en última hora      | 4.5               | 4.6            | Más verde         | Inmediato            | 23                   |
            | Callao           | 12 en última hora     | 2.1               | 2.0            | Más rojo          | Inmediato            | 56                   |
            | Centro           | 18 en última hora     | 3.1               | 3.2            | Ligeramente mejor | Inmediato            | 34                   |

    Scenario: Protección del anonimato del usuario
        Given que el usuario califica una zona
        When se procesa la calificación
        Then el sistema no debe almacenar información que permita identificar al usuario
        And debe implementar medidas para prevenir calificaciones fraudulentas

        Examples:
            | ID_Calificacion | Datos_Almacenados       | Datos_NO_Almacenados    | Medidas_Anti_Fraude          | Nivel_Anonimato | Verificacion_Aplicada |
            | CAL001          | Timestamp, Zona, Rating | Nombre, Email, Teléfono | Límite 1 por zona por día    | Máximo          | Captcha               |
            | CAL002          | Coordenadas, Puntaje    | Dirección IP, Device ID | Verificación GPS activa      | Máximo          | Ubicación real        |
            | CAL003          | Fecha, Hora, Estrellas  | Usuario ID, Perfil      | Algoritmo detección patrones | Máximo          | ML Anti-spam          |
            | CAL004          | Zona geográfica, Valor  | Historial navegación    | Tiempo mínimo en zona        | Máximo          | Permanencia 5 min     |
            | CAL005          | Rating, Zona distrito   | Información personal    | Cross-validation con otros   | Máximo          | Consenso comunidad    |