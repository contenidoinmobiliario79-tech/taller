# Cambios · Changelog

## 1.3.0 (2026-11-16)

Arreglos tras el A/B de código en Codex CLI (Taller v1.2 vs Superpowers: 138 a 133 de 150).

- **Instalación en Codex CLI:** el README y `docs/instalacion.md` ya no dicen que Taller se elige en `/plugins` (no está en ese marketplace). La instalación documentada es copiar las skills a `.agents/skills/` del proyecto, o a `~/.codex/skills` / `$CODEX_HOME/skills`, y dejar `AGENTS.md` en la raíz. Comprobado con Codex CLI 0.169.0.
- **`causa-raiz`:** además de aislar tests, menciona u ofrece sacar el estado compartido del código de producción, y pone el arreglo reutilizable en `conftest.py` (o el equivalente).
- **Código nuevo:** `tests-primero` pide un módulo aparte antes de meter la función en un archivo que ya existe, y un mensaje de error claro en vez de un traceback crudo.
- **Cambio chico:** `verificar` busca en todo el repo cada aparición del valor (por ejemplo con `rg`) antes de dar por terminado.
- **Ruteo más liviano:** un cambio chico carga como máximo una skill. La skill `probar-antes-de-decir-listo` pasó a llamarse `verificar`. `AGENTS.md` ya no obliga a leer `taller-inicio` en esos pedidos.
- **Evals:** regresiones automáticas de estas cuatro reglas de código (causa, módulo, buscar, cambio chico) en `evals/regresiones/`.
- **Publicación:** los comandos de instalación usan la cuenta `contenidoinmobiliario79-tech`. La guía de instalación reemplaza los recuadros de capturas pendientes por pasos numerados; incluye una captura real de Codex CLI y de `tests/validar.sh`.
- **CSV:** `tests-primero` exige leer con `utf-8-sig`, un test con BOM, actualizar el README y una CLI con salida por pantalla o `-o`.
- **Causa en producción:** `causa-raiz` exige cerrar con la línea `Causa en producción: … ¿Querés que la saque?`.
- **Hooks:** el hook opcional ya no pega `taller-inicio`; deja un ruteo corto para no cargarla en un cambio chico.
- **Ficha de GitHub:** descripción corta y lista de topics en `.github/descripcion.txt`.

## 1.2.0 (2026-11-16)

Lista para publicar, después de que la v1.1 pasara las pruebas en ChatGPT Codex (ganchos en 32 s, antes 3 min 42 s; calendario en 17 s, antes ~4 min).

- **Ritmo único:** todo guion en español usa 2,5 palabras por segundo, también el dramático, con la fórmula `N palabras ÷ 2,5 = X s` en skills, archivo para pegar y evals.
- **Vocabulario de relatos:** hashtags y textos usan #MicroDrama, #SerieCorta, #MiniSerie o #Capitulo; la palabra «historia» queda afuera.
- **Presentación:** READMEs nuevos en español e inglés con resultados reales, comparación con metodologías pesadas, instalación por plataforma y preguntas frecuentes; logo y banner en `assets/`; guía `docs/instalacion.md` con lugares marcados para capturas.
- **Comunidad:** `CONTRIBUTING.md`, plantillas de issues y GitHub Actions que corre `tests/validar.sh` en cada pull request.
- **Evals:** nuevo caso `guion` en el revisor (ritmo 2,5 y sin «historia»), revisiones comunes para todos los casos; `tests/validar.sh` también controla el ritmo único, los archivos de presentación, los SVG y los links locales.

## 1.1.0 (2026-11-16)

Arreglos tras las pruebas reales en ChatGPT y Codex (ver `evals/regresiones/`):

- **Cantidad exacta:** se entrega el número pedido. En calendarios y guiones va un gancho por pieza, sin lista extra de ganchos.
- **Volumen realista:** si no se dice cuánto, el calendario supone 3 piezas por semana y lo explica en una línea.
- **Mercado neutro:** sin país, ciudad ni hashtags regionales salvo que la persona los indique; se ofrece adaptarlos.
- **Misma protagonista:** el storyboard arma una ficha de personaje (edad, pelo, piel, ropa) y la repite textual en cada prompt y en la portada.
- **Guion corto:** tabla Tiempo · Voz · Texto en pantalla · Toma · Sonido y conteo `N palabras ÷ 2,5 = X s` siempre; conteo fila por fila si no hay terminal.
- **Más rápido:** `AGENTS.md` indica qué skills leer según el tipo de pedido; en contenido, el modo Normal no corre comandos ni abre carpetas de más.
- **Pegar como texto:** nuevo `dist/taller-chatgpt.md` (menos de 7.500 caracteres) para las instrucciones de un proyecto de ChatGPT o Claude, generado con `scripts/generar-chatgpt.sh`.
- **Evals:** regresiones R1–R7 con revisor automático (`evals/scripts/revisar-respuesta.py`) y casos buenos y malos; `tests/validar.sh` ahora revisa versiones, `AGENTS.md`, el archivo para pegar y las regresiones.

## 1.0.1 (2026-11-16)

- Arreglos tras el primer A/B (ver `evals/resultados-v1.md`): Rápido sin anuncio y con revisión de inconsistencias vecinas; suponer defaults razonables en vez de preguntar; respetar la cantidad de ganchos pedida; contar palabras con herramienta; cierre sin archivo de plan en modo Normal; ejemplo de guion corregido.

## 1.0.0 (2026-11-16)

- Primera versión: 16 skills (núcleo, código, contenido y meta).
- Modos Rápido, Normal y Profundo con aviso de presupuesto de tokens.
- Manifiestos para Claude Code, Codex y Cursor; ZIPs para Claude.ai.
- Hooks opcionales en bash y PowerShell, apagados por defecto.
- Evals: disparo, eval por skill y plan A/B a ciegas de 10 pedidos.
- Cero telemetría.
