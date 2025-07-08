# Feature: HU028 - Mapa amigable para daltónicos
Feature: Mapa amigable para daltónicos
    Como persona con daltonismo
    Quiero que la app cuente con diferentes tipos de mapas a elección del usuario
    Para ofrecer mayor accesibilidad a personas con daltonismo

    Scenario: Selección de tipo de mapa
        Given que el usuario accede a la configuración de visualización
        When el usuario selecciona "Tipo de Mapa"
        Then debe poder elegir entre mapa estándar y mapa para daltónicos
        And el cambio debe aplicarse inmediatamente

        Examples:
            | Tipo_Daltonismo | Mapa_Seleccionado | Paleta_Colores       | Patrones_Adicionales | Contraste_Aplicado | Símbolos_Distintivos | Tiempo_Cambio |
            | Protanopia      | Daltónico Pro     | Azul-Amarillo-Blanco | Líneas punteadas     | Alto               | Triángulos, círculos | Inmediato     |
            | Deuteranopia    | Daltónico Deu     | Azul-Naranja-Gris    | Símbolos geométricos | Muy Alto           | Cuadrados, hexágonos | Inmediato     |
            | Tritanopia      | Daltónico Tri     | Rojo-Verde-Negro     | Texturas variadas    | Máximo             | Estrellas, rombos    | Inmediato     |
            | Acromatopsia    | Escala Grises     | Solo grises          | Patrones densos      | Extremo            | Formas complejas     | Inmediato     |
            | Sin daltonismo  | Estándar          | Espectro completo    | Ninguno              | Normal             | Colores únicamente   | Inmediato     |

    Scenario: Adaptación para daltonismo
        Given que el usuario selecciona "Mapa para Daltónicos"
        When el usuario visualiza el mapa de calor y zonas de seguridad
        Then debe usar patrones y símbolos además de colores
        And garantizar que la información sea clara para usuarios con daltonismo

        Examples:
            | Zona_Seguridad | Color_Original | Color_Adaptado | Patrón_Añadido    | Símbolo_Asociado | Textura_Fondo | Legibilidad_Score |
            | Muy Peligrosa  | Rojo           | Azul Oscuro    | Líneas diagonales | Triángulo ⚠      | Rugosa        | 98%               |
            | Peligrosa      | Naranja        | Azul Medio     | Puntos densos     | Círculo ⊗        | Semi-rugosa   | 95%               |
            | Precaución     | Amarillo       | Azul Claro     | Líneas verticales | Cuadrado ⬜       | Lisa          | 96%               |
            | Segura         | Verde Claro    | Gris Claro     | Puntos dispersos  | Círculo ⊙        | Muy lisa      | 97%               |
            | Muy Segura     | Verde Oscuro   | Blanco         | Sin patrón        | Estrella ⭐       | Brillante     | 99%               |

    Scenario: Persistencia de la configuración de accesibilidad
        Given que el usuario ha configurado el mapa para daltónicos
        When el usuario cierra y reabre la aplicación
        Then debe mantener la configuración de accesibilidad seleccionada
        And aplicarla a todas las visualizaciones de mapas

        Examples:
            | Configuracion_Activa | Sesiones_Mantenida | Mapas_Afectados     | Configuracion_Sincronizada | Tiempo_Persistencia | Backup_Configuracion |
            | Protanopia           | 25                 | Calor, rutas, zonas | Todos los dispositivos     | Permanente          | Cloud automático     |
            | Deuteranopia         | 18                 | Todos los mapas     | Todos los dispositivos     | Permanente          | Local + cloud        |
            | Tritanopia           | 12                 | Visualizaciones     | Todos los dispositivos     | Permanente          | Redundante           |
            | Acromatopsia         | 8                  | Elementos gráficos  | Todos los dispositivos     | Permanente          | Triple backup        |
            | Personalizada        | 35                 | Según configuración | Dispositivo principal      | Permanente          | Manual + automático  |