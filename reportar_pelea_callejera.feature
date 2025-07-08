# Feature: HU014 - Reportar pelea callejera
Feature: Reportar pelea callejera
    Como ciudadano
    Quiero tener la capacidad de reportar un incidente entre personas que están alterando el orden de mi distrito
    Para contactar con el serenazgo/personal de seguridad cuanto antes

    Scenario: Reporte de alteración del orden público
        Given que el usuario presencia una pelea callejera
        When el usuario selecciona "Reportar Disturbio" y especifica "Pelea callejera"
        Then el sistema debe contactar al serenazgo de la zona
        And asegurar un tiempo de respuesta máximo de 15 minutos

        Examples:
            | Ubicacion_Disturbio   | Tipo_Alteracion    | Personas_Involucradas | Nivel_Violencia | Serenazgo_Asignado    | Tiempo_Respuesta | Prioridad |
            | Plaza San Martín      | Pelea grupal       | 6                     | Alto            | Serenazgo Centro      | 8 min            | Urgente   |
            | Av. Brasil cdra 18    | Discusión violenta | 2                     | Medio           | Serenazgo Breña       | 12 min           | Media     |
            | Jr. Lampa esq. Ancash | Riña callejera     | 4                     | Alto            | Serenazgo Lima        | 6 min            | Urgente   |
            | Gamarra sector A      | Pelea comerciantes | 8                     | Medio           | Serenazgo La Victoria | 10 min           | Media     |
            | Parque Kennedy        | Alterado público   | 3                     | Bajo            | Serenazgo Miraflores  | 15 min           | Baja      |

    Scenario: Descripción detallada del incidente
        Given que el usuario está reportando una pelea callejera
        When el usuario completa el formulario de reporte
        Then debe poder especificar el número aproximado de personas involucradas
        And describir el nivel de violencia y riesgo para transeúntes

        Examples:
            | Num_Involucrados | Descripcion_Violencia           | Riesgo_Transeuntes | Armas_Visibles | Alcohol_Drogas | Daños_Propiedad | Testigos_Presentes |
            | 3                | Golpes y empujones              | Medio              | Botellas       | Evidente       | Ninguno         | 5                  |
            | 8                | Pelea generalizada con lesiones | Alto               | Palos          | Probable       | Vitrina rota    | 12                 |
            | 2                | Discusión con amenazas          | Bajo               | Ninguna        | No evidente    | Ninguno         | 3                  |
            | 5                | Riña con sangrado               | Alto               | Cuchillos      | Evidente       | Auto dañado     | 8                  |
            | 4                | Pelea con objetos contundentes  | Medio              | Piedras        | Probable       | Ventana rota    | 6                  |

    Scenario: Monitoreo hasta resolución del conflicto
        Given que se ha reportado una pelea callejera
        When el serenazgo recibe la alerta
        Then el sistema debe permitir al usuario actualizar el estado del incidente
        And notificar cuando la situación haya sido controlada

        Examples:
            | ID_Reporte | Estado_Inicial | Actualizacion_Usuario   | Accion_Serenazgo         | Estado_Final | Tiempo_Resolucion | Seguimiento_Posterior   |
            | PEL001     | Activo         | "Violencia aumentando"  | 3 efectivos desplegados  | Controlado   | 25 min            | Detenidos identificados |
            | PEL002     | Reportado      | "Se están dispersando"  | 2 efectivos en camino    | Resuelto     | 18 min            | Mediación exitosa       |
            | PEL003     | Urgente        | "Lesionados en el piso" | Ambulancia + 4 efectivos | Controlado   | 12 min            | Traslado a hospital     |
            | PEL004     | En proceso     | "Todo tranquilo ya"     | 2 efectivos llegaron     | Resuelto     | 15 min            | Acta de intervención    |
            | PEL005     | Escalando      | "Más gente llegando"    | Refuerzos solicitados    | Controlado   | 35 min            | Zona acordonada         |