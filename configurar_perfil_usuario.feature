# Feature: HU004 - Configurar perfil de usuario
Feature: Configurar perfil de usuario
    Como usuario
    Quiero poder configurar mi perfil con mis preferencias (tipo de usuario, zonas que frecuento, delitos que me preocupan)
    Para que la aplicación me brinde información más relevante

    Scenario: Configuración de tipo de usuario
        Given que el usuario accede por primera vez a la configuración de perfil
        When el usuario selecciona su tipo de usuario y completa la información básica requerida
        Then el sistema debe guardar la configuración
        And personalizar la interfaz según el tipo de usuario seleccionado

        Examples:
            | Tipo_Usuario | Edad | Genero | Zona_Residencia  | Actividad_Principal | Interfaz_Personalizada | Alertas_Relevantes    |
            | Peatón       | 28   | M      | Miraflores       | Estudiante          | Iconos peatonales      | Robos a transeúntes   |
            | Conductor    | 35   | F      | San Isidro       | Ejecutiva           | Panel vehicular        | Robos vehiculares     |
            | Repartidor   | 24   | M      | La Victoria      | Delivery            | Modo trabajo           | Asaltos a motorizados |
            | Turista      | 45   | F      | Centro Histórico | Visitante           | Modo turístico         | Estafas y robos       |
            | Ciclista     | 30   | M      | Barranco         | Deportista          | Rutas ciclovías        | Robos de bicicletas   |

    Scenario: Definición de zonas frecuentes
        Given que el usuario está en la sección de configuración de perfil
        When el usuario selecciona "Zonas que frecuento"
        And agrega ubicaciones como trabajo, casa, estudios mediante el mapa
        Then el sistema debe guardar estas ubicaciones de referencia
        And utilizarlas para personalizar alertas y recomendaciones

        Examples:
            | Usuario_ID | Ubicacion_Tipo | Direccion_Exacta       | Horario_Frecuencia | Radio_Monitoreo | Alertas_Especificas   | Prioridad |
            | USR001     | Casa           | Av. Larco 1200         | 20:00-08:00        | 300m            | Robos nocturnos       | Alta      |
            | USR001     | Trabajo        | Jr. Lampa 850          | 08:00-18:00        | 500m            | Robos diurnos         | Alta      |
            | USR002     | Universidad    | Av. Universitaria 1801 | 07:00-22:00        | 400m            | Asaltos estudiantes   | Media     |
            | USR003     | Gimnasio       | Av. Brasil 2500        | 18:00-21:00        | 200m            | Robos en parqueaderos | Media     |
            | USR003     | Centro Com.    | Jockey Plaza           | Fines de semana    | 600m            | Robos en centros com. | Baja      |

    Scenario: Selección de tipos de delitos de interés
        Given que el usuario está configurando sus preferencias
        When el usuario selecciona los tipos de delitos que le preocupan
        Then el sistema debe priorizar alertas relacionadas con estos delitos
        And filtrar la información mostrada según estas preferencias

        Examples:
            | Delito_Seleccionado | Prioridad_Usuario | Frecuencia_Alertas | Radio_Notificacion | Horario_Activo | Tipo_Notificacion |
            | Robos a personas    | Alta              | Inmediata          | 400m               | 24 horas       | Push + Sonido     |
            | Asaltos con armas   | Alta              | Inmediata          | 600m               | 24 horas       | Push + Vibración  |
            | Robos vehiculares   | Media             | Cada 15 min        | 800m               | 18:00-06:00    | Solo Push         |
            | Vandalismo          | Baja              | Cada hora          | 200m               | 08:00-20:00    | Solo visual       |
            | Violencia familiar  | Media             | Cada 30 min        | 500m               | 24 horas       | Push silenciosa   |