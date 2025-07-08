# Feature: HU020 - Cambiar el idioma
Feature: Cambiar el idioma
    Como usuario
    Quiero poder cambiar el idioma de la aplicación en cualquier momento
    Para usar la app en mi idioma preferido

    Scenario: Cambio de idioma instantáneo
        Given que el usuario accede a la configuración de idioma
        When el usuario selecciona un idioma diferente (español, inglés, portugués)
        Then el cambio debe ser instantáneo sin necesidad de reiniciar la aplicación
        And toda la interfaz debe actualizarse al nuevo idioma

        Examples:
            | Idioma_Actual | Idioma_Seleccionado | Tiempo_Cambio | Elementos_Traducidos | Reinicio_Requerido | Notificaciones_Idioma | Persistence |
            | Español       | Inglés              | Inmediato     | 100%                 | No                 | English               | Sí          |
            | Inglés        | Portugués           | Inmediato     | 100%                 | No                 | Português             | Sí          |
            | Portugués     | Español             | Inmediato     | 100%                 | No                 | Español               | Sí          |
            | Español       | Francés             | Inmediato     | 95%                  | No                 | Français              | Sí          |
            | Inglés        | Español             | Inmediato     | 100%                 | No                 | Español               | Sí          |

    Scenario: Persistencia de la configuración de idioma
        Given que el usuario ha cambiado el idioma de la aplicación
        When el usuario cierra y vuelve a abrir la aplicación
        Then debe mantener el idioma seleccionado previamente
        And aplicarlo a todas las funciones y notificaciones

        Examples:
            | Idioma_Configurado | Sesiones_Posteriores | Mantenimiento_Idioma | Notificaciones_Push | Emails_Sistema | Reportes_Generados |
            | Inglés             | 15                   | Mantenido            | English             | English        | English            |
            | Portugués          | 8                    | Mantenido            | Português           | Português      | Português          |
            | Español            | 25                   | Mantenido            | Español             | Español        | Español            |
            | Francés            | 5                    | Mantenido            | Français            | Français       | Français           |
            | Italiano           | 3                    | Mantenido            | Italiano            | Italiano       | Italiano           |

    Scenario: Traducción completa de contenido
        Given que se ha cambiado el idioma
        When el usuario navega por diferentes secciones
        Then todo el contenido debe estar traducido incluyendo menús, botones y mensajes
        And las notificaciones push también deben enviarse en el idioma seleccionado

        Examples:
            | Seccion_App   | Idioma_Destino | Menus_Traducidos | Botones_Traducidos | Mensajes_Traducidos | Alertas_Traducidas | Cobertura_Traduccion |
            | Mapa de calor | Inglés         | Sí               | Sí                 | Sí                  | Sí                 | 100%                 |
            | Reportes      | Portugués      | Sí               | Sí                 | Sí                  | Sí                 | 100%                 |
            | Configuración | Francés        | Sí               | Sí                 | Sí                  | Sí                 | 95%                  |
            | Historial     | Español        | Sí               | Sí                 | Sí                  | Sí                 | 100%                 |
            | Ayuda         | Italiano       | Sí               | Sí                 | Sí                  | Sí                 | 90%                  |