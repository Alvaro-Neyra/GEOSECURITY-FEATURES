# Feature: HU003 - Planificar rutas seguras
Feature: Planificar rutas seguras
    Como peatón
    Quiero que la aplicación me sugiera rutas alternativas para llegar a mi destino evitando zonas peligrosas
    Para poder desplazarme con mayor seguridad

    Scenario: Búsqueda de ruta segura
        Given que el usuario se encuentra en la pantalla de planificación de rutas
        And el usuario ingresa su punto de origen y destino
        When el usuario presiona "Buscar ruta segura"
        Then el sistema debe calcular múltiples rutas evitando zonas de alta peligrosidad
        And mostrar al menos 3 opciones de ruta alternativas

        Examples:
            | Origen              | Destino          | Ruta_1        | Tiempo_1 | Seguridad_1 | Ruta_2       | Tiempo_2 | Seguridad_2 | Ruta_3      | Tiempo_3 | Seguridad_3 |
            | Plaza San Martín    | Gamarra          | Via Tacna     | 25 min   | Alta        | Via Wilson   | 20 min   | Media       | Via Abancay | 15 min   | Baja        |
            | Miraflores Centro   | Centro Histórico | Via Arequipa  | 35 min   | Alta        | Via Brasil   | 30 min   | Alta        | Via Express | 25 min   | Media       |
            | San Juan Lurigancho | La Victoria      | Via Canto Rey | 45 min   | Media       | Via Próceres | 40 min   | Alta        | Via Central | 35 min   | Baja        |
            | Callao Puerto       | Miraflores       | Via Costanera | 55 min   | Alta        | Via Faucett  | 50 min   | Media       | Via Elmer   | 45 min   | Baja        |

    Scenario: Visualización de nivel de seguridad de rutas
        Given que el sistema ha calculado las rutas alternativas
        When el usuario visualiza las opciones
        Then cada ruta debe mostrar un indicador de nivel de seguridad (Alto, Medio, Bajo)
        And debe incluir información sobre la distancia y tiempo estimado

        Examples:
            | Ruta_ID | Nivel_Seguridad | Color_Indicador | Distancia | Tiempo_Estimado | Zonas_Riesgo | Puntos_Seguros | Calificacion |
            | Ruta_A  | Alto            | Verde           | 8.5 km    | 30 min          | 0            | 5              | 9/10         |
            | Ruta_B  | Medio           | Amarillo        | 7.2 km    | 25 min          | 1            | 3              | 6/10         |
            | Ruta_C  | Bajo            | Rojo            | 5.8 km    | 20 min          | 3            | 1              | 3/10         |
            | Ruta_D  | Alto            | Verde           | 9.1 km    | 35 min          | 0            | 6              | 9.5/10       |

    Scenario: Selección y seguimiento de ruta
        Given que el usuario ha seleccionado una ruta segura
        When el usuario inicia la navegación
        Then el sistema debe proporcionar instrucciones paso a paso
        And alertar si se desvía hacia una zona más peligrosa durante el trayecto

        Examples:
            | Ruta_Seleccionada | Instruccion_Actual               | Desviacion_Detectada | Alerta_Enviada                  | Accion_Correctiva          |
            | Via Arequipa      | "Continúa por Av. Arequipa"      | No                   | Ninguna                         | Ninguna                    |
            | Via Wilson        | "Gira a la derecha en Jr. Ica"   | Sí                   | "Te diriges a zona peligrosa"   | Recalcular ruta            |
            | Via Tacna         | "Sigue recto 500m más"           | No                   | Ninguna                         | Ninguna                    |
            | Via Brasil        | "Gira a la izquierda en Abancay" | Sí                   | "Zona de alto riesgo detectada" | Ruta alternativa inmediata |