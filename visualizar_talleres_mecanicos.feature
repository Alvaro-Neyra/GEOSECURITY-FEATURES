# Feature: HU017 - Visualizar talleres mecánicos
Feature: Visualizar talleres mecánicos
    Como taxista
    Quiero encontrar una manera rápida y eficaz para localizar talleres mecánicos más cercanos a mi ubicación
    Para resolver problemas mecánicos durante mi jornada

    Scenario: Búsqueda de talleres por ubicación
        Given que el taxista se encuentra en el formulario "Buscar Talleres"
        And el taxista selecciona la opción "Por Ubicación"
        When el sistema carga el componente de mapa
        And el taxista selecciona una ubicación en el mapa (o por defecto su ubicación actual)
        Then el sistema muestra la ubicación y distancia de los talleres, resaltando los más cercanos

        Examples:
            | Ubicacion_Taxista   | Taller_Mas_Cercano  | Distancia | Servicios_Disponibles        | Horario_Atencion | Calificacion | Tiempo_Estimado |
            | Av. Brasil 1200     | Taller Don Pedro    | 800m      | Mecánica, Llantas, Batería   | 24 horas         | 4.5/5        | 5 min llegada   |
            | Plaza San Martín    | AutoService Lima    | 1.2 km    | Mecánica, Pintura, Planchado | 8:00 - 18:00     | 4.2/5        | 8 min llegada   |
            | Av. Arequipa 2000   | Multiservicios Ruiz | 950m      | Mecánica, Electricidad       | 7:00 - 19:00     | 4.0/5        | 6 min llegada   |
            | Callao Av. Faucett  | Taller El Rápido    | 1.5 km    | Mecánica, Transmisión        | 6:00 - 20:00     | 3.8/5        | 12 min llegada  |
            | La Victoria Gamarra | Servitec Motors     | 650m      | Mecánica, Llantas, GNV       | 24 horas         | 4.7/5        | 4 min llegada   |

    Scenario: Información detallada del taller en tiempo real
        Given que el taxista ha encontrado talleres cercanos
        When el taxista selecciona un taller específico del listado
        Then el sistema debe mostrar nombre, número de teléfono, servicios disponibles
        And verificar que la información esté actualizada en tiempo real

        Examples:
            | Nombre_Taller       | Telefono    | Servicios_Detallados                    | Estado_Actual | Disponibilidad | Precio_Promedio | Tiempo_Servicio |
            | Taller Don Pedro    | 987-654-321 | Mecánica general, Cambio aceite, Frenos | Abierto       | Inmediata      | S/ 150          | 45 min          |
            | AutoService Lima    | 456-789-123 | Planchado, Pintura, Mecánica básica     | Abierto       | 30 min espera  | S/ 200          | 2 horas         |
            | Multiservicios Ruiz | 789-123-456 | Electricidad automotriz, Scanner        | Abierto       | Inmediata      | S/ 120          | 30 min          |
            | Taller El Rápido    | 321-654-987 | Transmisión, Embrague, Motor            | Cerrado       | Abre 6:00 AM   | S/ 300          | 3 horas         |
            | Servitec Motors     | 654-987-321 | Conversión GNV, Mecánica, Llantas       | Abierto       | Inmediata      | S/ 180          | 1 hora          |

    Scenario: Navegación directa al taller seleccionado
        Given que el taxista ha seleccionado un taller específico
        When el taxista presiona "Ir al Taller"
        Then el sistema debe abrir la navegación GPS hacia el taller
        And proporcionar la ruta más rápida considerando el tráfico actual

        Examples:
            | Taller_Destino      | Ruta_Sugerida           | Tiempo_Viaje | Tráfico_Estado | Combustible_Necesario | Peajes | Alternativas |
            | Taller Don Pedro    | Via Av. Brasil directo  | 8 min        | Fluido         | S/ 5                  | 0      | 2            |
            | AutoService Lima    | Via Av. Abancay-Wilson  | 12 min       | Moderado       | S/ 8                  | 0      | 3            |
            | Multiservicios Ruiz | Via Av. Arequipa-Tacna  | 10 min       | Fluido         | S/ 6                  | 0      | 2            |
            | Taller El Rápido    | Via Av. Faucett directo | 18 min       | Congestionado  | S/ 12                 | 0      | 4            |
            | Servitec Motors     | Via Jr. Parinacochas    | 6 min        | Fluido         | S/ 4                  | 0      | 1            |