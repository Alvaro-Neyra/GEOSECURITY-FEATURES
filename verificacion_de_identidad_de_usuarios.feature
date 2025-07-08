# Feature: HU033 - Verificación de identidad de usuarios
Feature: Verificación de identidad de usuarios
    Como administrador del sistema
    Quiero que los usuarios verifiquen su identidad al registrarse
    Para garantizar la autenticidad de los reportes y prevenir el uso malintencionado de la aplicación

    Scenario: Proceso de verificación durante el registro
        Given que un nuevo usuario intenta crear una cuenta en la aplicación
        And ha completado la información básica requerida
        When el sistema solicita la verificación de identidad mediante documento oficial y selfie de confirmación
        Then debe validar automáticamente que los datos coincidan con bases de datos oficiales
        And aprobar la cuenta solo si la verificación es exitosa

        Examples:
            | Tipo_Documento | País_Emisión | Tiempo_Verificación | Estado_Verificación | Nivel_Confianza | Base_Datos_Consultada | Intentos_Permitidos |
            | DNI            | Perú         | 30 seg              | Aprobado            | Alto            | RENIEC                | 3                   |
            | Pasaporte      | Perú         | 45 seg              | Aprobado            | Alto            | MIGRACIONES           | 3                   |
            | CE             | Perú         | 60 seg              | Pendiente           | Medio           | MIGRACIONES           | 2                   |
            | DNI            | Extranjero   | 90 seg              | Rechazado           | Bajo            | No disponible         | 1                   |
            | Carnet Univ.   | Perú         | 15 seg              | Rechazado           | Muy bajo        | No válido             | 0                   |

    Scenario: Validación de documentos en tiempo real
        Given que el usuario está en el proceso de verificación de identidad
        And ha subido fotografías claras de su documento oficial de identificación
        When el sistema procesa las imágenes mediante tecnología OCR y algoritmos de validación
        Then debe verificar automáticamente la autenticidad del documento
        And detectar posibles falsificaciones o alteraciones

        Examples:
            | Calidad_Imagen | Datos_OCR_Extraídos | Elementos_Seguridad_Detectados | Resultado_Validación    | Confianza_OCR | Tiempo_Procesamiento | Errores_Detectados |
            | Excelente      | 100%                | Hologramas, microimpresión     | Documento auténtico     | 98%           | 25 seg               | Ninguno            |
            | Buena          | 95%                 | Hologramas                     | Probablemente auténtico | 92%           | 35 seg               | Menor calidad      |
            | Regular        | 85%                 | Parcialmente detectados        | Requiere revisión       | 78%           | 50 seg               | Imagen borrosa     |
            | Mala           | 60%                 | No detectados                  | Documento sospechoso    | 45%           | 60 seg               | Multiple errores   |
            | Muy mala       | 30%                 | Ninguno                        | Rechazado automático    | 15%           | 15 seg               | No procesable      |

    Scenario: Mantenimiento de niveles de confianza
        Given que el usuario ha completado exitosamente el proceso de verificación inicial
        And utiliza activamente la aplicación enviando reportes verificables
        When otros usuarios califican positivamente sus contribuciones
        And las autoridades confirman la veracidad de sus reportes
        Then el sistema debe asignar automáticamente un nivel de confianza más alto
        And mostrar indicadores visuales que distingan a usuarios verificados

        Examples:
            | Tiempo_Usuario | Reportes_Enviados | Reportes_Verificados | Calificación_Comunidad | Nivel_Confianza  | Insignia_Obtenida | Privilegios_Adicionales |
            | 1 mes          | 5                 | 5                    | 4.8/5                  | Novato confiable | Bronce            | Reportes prioritarios   |
            | 3 meses        | 25                | 23                   | 4.9/5                  | Usuario validado | Plata             | Moderación comunitaria  |
            | 6 meses        | 50                | 48                   | 4.95/5                 | Experto local    | Oro               | Verificador oficial     |
            | 1 año          | 100               | 97                   | 4.98/5                 | Líder comunidad  | Platino           | Administrador zona      |
            | 2 años         | 250               | 245                  | 4.99/5                 | Embajador        | Diamante          | Mentor nuevos usuarios  |