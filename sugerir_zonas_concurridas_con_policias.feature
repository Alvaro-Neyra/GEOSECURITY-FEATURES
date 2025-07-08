# Feature: HU035 - Sugerir zonas concurridas con policías
Feature: Sugerir zonas concurridas con policías
    Como usuario
    Quiero que la app me indique qué tan seguro es el lugar con datos de policías cercanos
    Para conocer la seguridad que me brinda el distrito

    Scenario: Visualización de presencia policial
        Given que el usuario consulta la seguridad de una zona específica
        When el sistema analiza la presencia policial en el área
        Then debe mostrar la ubicación de policías cercanos en un radio caminable
        And indicar la distancia exacta a cada puesto policial

        Examples:
            | Zona_Consultada   | Puestos_Cercanos | Distancia_Promedio | Cobertura_Policial | Índice_Seguridad | Patrullaje_Activo | Tiempo_Respuesta_Est |
            | Centro Financiero | 4                | 200m               | Excelente          | 9/10             | 24 horas          | 3 min                |
            | Zona Residencial  | 2                | 500m               | Buena              | 7/10             | 18 horas          | 8 min                |
            | Periferia Urbana  | 1                | 1.2km              | Regular            | 5/10             | 12 horas          | 15 min               |
            | Zona Comercial    | 3                | 300m               | Muy buena          | 8/10             | 20 horas          | 5 min                |
            | Área Industrial   | 1                | 800m               | Regular            | 4/10             | 8 horas           | 20 min               |

    Scenario: Actualización constante de datos policiales
        Given que el usuario está consultando información de seguridad
        When el sistema verifica la presencia policial
        Then los datos de ubicación de policías deben actualizarse constantemente
        And reflejar la disponibilidad real de efectivos en la zona

        Examples:
            | Horario     | Efectivos_Disponibles | Patrullas_Activas | Puestos_Operativos | Actualización_Frecuencia | Precisión_Datos | Fuente_Información  |
            | 08:00-16:00 | 85%                   | 12                | 15                 | Cada 15 min              | 95%             | PNP Central         |
            | 16:00-24:00 | 90%                   | 18                | 15                 | Cada 10 min              | 97%             | Sistema integrado   |
            | 00:00-08:00 | 70%                   | 8                 | 12                 | Cada 20 min              | 92%             | Turnos nocturnos    |
            | Emergencia  | 100%                  | 25                | 18                 | Tiempo real              | 99%             | Central operaciones |
            | Fines sem.  | 75%                   | 10                | 13                 | Cada 30 min              | 90%             | Guardia reducida    |

    Scenario: Recomendaciones basadas en presencia policial
        Given que el usuario planifica una ruta o actividad
        When el sistema evalúa la seguridad considerando presencia policial
        Then debe sugerir zonas con mayor concentración de efectivos policiales
        And proporcionar indicadores de seguridad basados en esta información

        Examples:
            | Actividad_Planeada | Zona_Recomendada   | Presencia_Policial | Horario_Óptimo | Nivel_Seguridad | Alternativas_Disponibles | Factores_Adicionales |
            | Compras nocturnas  | Centro Comercial   | 3 puestos          | 18:00-21:00    | Alto            | 2                        | Iluminación, cámaras |
            | Caminata matutina  | Malecón Miraflores | 2 puestos          | 06:00-09:00    | Muy alto        | 1                        | Pistas, multitud     |
            | Reunión trabajo    | San Isidro Financ. | 4 puestos          | 09:00-18:00    | Máximo          | 3                        | Seguridad privada    |
            | Cita médica        | Hospital Nacional  | 2 puestos          | 10:00-16:00    | Alto            | 1                        | Personal médico      |
            | Evento nocturno    | Barranco Cultural  | 1 puesto           | 20:00-24:00    | Medio           | 2                        | Serenazgo activo     |