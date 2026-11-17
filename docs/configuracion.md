# Configuración de Taller · Configuration

Taller funciona sin configurar nada. Si querés ajustarlo, copiá `taller.config.example.json` a la raíz de tu proyecto con el nombre `taller.config.json`. Las skills lo leen cuando existe; si no existe, usan los valores de abajo.

*English: copy `taller.config.example.json` to your project root as `taller.config.json`. Skills read it when present and fall back to the defaults below.*

| Clave | Valor por defecto | Qué controla |
|---|---|---|
| `idioma` | `"es"` | Idioma de las respuestas y documentos: `"es"`, `"en"` o `"auto"` (el del pedido). |
| `modo_por_defecto` | `"auto"` | `"auto"` deja que `taller-inicio` clasifique. `"rapido"`, `"normal"` o `"profundo"` fuerzan un modo. |
| `presupuesto_tokens.rapido` | `20000` | Techo estimado de tokens para tareas chicas. |
| `presupuesto_tokens.normal` | `120000` | Techo estimado para tareas medianas. |
| `presupuesto_tokens.profundo` | `400000` | Techo estimado para tareas grandes con subagentes. |
| `presupuesto_tokens.avisar_al_porcentaje` | `80` | Cuando la estimación llega a este porcentaje, el agente frena y pregunta. |
| `fases.entender_pedido` | `true` | Si es `false`, se salta las preguntas iniciales salvo que el pedido sea ambiguo de verdad. |
| `fases.plan` | `true` | Si es `false`, en modo Normal se trabaja con una lista corta en vez de un plan escrito. |
| `fases.revision` | `"segun_riesgo"` | `"siempre"`, `"segun_riesgo"` o `"nunca"`. |
| `fases.tests_primero` | `true` | Activa o desactiva `tests-primero` en la rama de código. |
| `fases.rama_aislada` | `true` | Activa o desactiva `rama-aislada`. |
| `modelos_por_rol.*` | `""` | Modelo sugerido para coordinador, implementador y revisor. Vacío = el modelo de la sesión. |
| `contenido.plataformas` | `["tiktok","reels"]` | Plataformas por defecto de la rama de contenido. |
| `contenido.duracion_segundos` | `30` | Duración por defecto de un guion corto. |
| `contenido.tono` | `"cercano"` | Tono de voz por defecto. |
| `contenido.publico` | `""` | Público objetivo por defecto (por ejemplo: "mujeres de 25 a 40 que siguen moda modesta"). |
| `carpeta_planes` | `"docs/taller/planes"` | Dónde se guardan los planes y resúmenes. |

## Sobre el presupuesto de tokens

Los agentes no siempre pueden leer su consumo exacto. Taller usa una **estimación honesta**: cuenta archivos leídos, salidas largas de comandos, subagentes lanzados y turnos. La tabla de referencia está en `skills/plan-con-presupuesto/references/estimar-tokens.md`. Si tu herramienta muestra el consumo real (por ejemplo `/cost` o `/usage`), el agente lo usa en lugar de la estimación.

## Variables de entorno de los hooks

| Variable | Efecto |
|---|---|
| `TALLER_HOOK_OFF=1` | El hook opcional de inicio no inyecta nada. |

Taller no tiene telemetría ni hace llamadas de red. No hay nada que apagar.
