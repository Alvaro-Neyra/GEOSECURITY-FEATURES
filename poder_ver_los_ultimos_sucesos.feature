# Feature: HU018 - Poder ver los últimos sucesos
Feature: Poder ver los últimos sucesos
    Como usuario
    Quiero saber los últimos hechos de mi distrito
    Para tener una mayor confianza al salir

    Scenario: Feed de últimos sucesos del distrito
        Given que el usuario accede a "Últimos Sucesos"
        When el sistema carga la información del distrito actual
        Then debe mostrar una ventana con los eventos más recientes de las últimas 24 horas
        And actualizar la información cada 15 minutos automáticamente

        Examples:
            | Distrito    | Sucesos_24h | Ultimo_Incidente     | Tipo_Suceso | Hora_Reporte | Ubicacion_Especifica  | Nivel_Gravedad |
            | La Victoria | 12          | Robo en Gamarra      | Robo        | 13:45        | Jr. Antonio Bazo 1250 | Medio          |
            | Miraflores  | 3           | Vandalismo en parque | Vandalismo  | 11:20        | Parque Kennedy        | Bajo           |
            | San Isidro  | 2           | Accidente vial       | Accidente   | 09:15        | Av. El Bosque cdra 4  | Bajo           |
            | Callao      | 18          | Asalto en terminal   | Asalto      | 16:30        | Terminal Pesquero     | Alto           |
            | Centro Lima | 9           | Pelea en Plaza Armas | Disturbio   | 14:10        | Plaza de Armas        | Medio          |

    Scenario: Filtrado por tipo de suceso
        Given que el usuario está viendo los últimos sucesos
        When el usuario selecciona filtros por tipo (robos, accidentes, disturbios)
        Then el sistema debe mostrar solo los eventos del tipo seleccionado
        And mantener el orden cronológico de más reciente a más antiguo

        Examples:
            | Filtro_Aplicado | Eventos_Filtrados | Tiempo_Mas_Reciente | Tiempo_Mas_Antiguo | Total_Mostrado | Porcentaje_Total |
            | Solo robos      | 8                 | 13:45               | 08:20              | 8/25           | 32%              |
            | Solo accidentes | 5                 | 12:30               | 07:45              | 5/25           | 20%              |
            | Solo disturbios | 4                 | 14:10               | 09:50              | 4/25           | 16%              |
            | Solo asaltos    | 6                 | 16:30               | 06:15              | 6/25           | 24%              |
            | Solo vandalismo | 2                 | 11:20               | 10:30              | 2/25           | 8%               |

    Scenario: Detalles expandidos de cada suceso
        Given que el usuario ve la lista de sucesos
        When el usuario selecciona un evento específico
        Then debe poder ver detalles completos incluyendo ubicación exacta, hora y descripción
        And tener la opción de reportar información adicional si fue testigo

        Examples:
            | ID_Suceso | Descripcion_Completa                      | Coordenadas_GPS    | Testigos | Info_Adicional_Disponible | Opcion_Reporte_Testigo |
            | SUC001    | Robo de celular a señora en paradero      | -12.0464, -77.0428 | 3        | Video de cámara seguridad | Disponible             |
            | SUC002    | Accidente entre auto y motocicleta        | -12.0431, -77.0282 | 5        | Fotos del lugar           | Disponible             |
            | SUC003    | Vandalismo en ventanas de local comercial | -12.0512, -77.0353 | 2        | Grabación audio           | Disponible             |
            | SUC004    | Asalto con arma blanca a transeúnte       | -12.0389, -77.0298 | 1        | Descripción del agresor   | Disponible             |
            | SUC005    | Pelea entre vendedores ambulantes         | -12.0445, -77.0311 | 8        | Testimonio completo       | Disponible             |
