# Ejemplo de tarea bien escrita

## Tarea 3: Validar el email en el registro

**Objetivo:** rechazar emails mal formados antes de guardar el usuario.
**Archivos:** `src/registro/validar.ts` (nuevo), `src/registro/form.ts`, `tests/registro/validar.test.ts` (nuevo).
**Pasos:**
1. Escribir el test con 4 casos: válido, sin @, sin dominio, con espacios.
2. Crear `esEmailValido(texto: string): boolean`.
3. Usarla en `form.ts` antes de llamar a `guardarUsuario` y mostrar el mensaje "Revisá el email".
**Hecho cuando:**
- [ ] `npm test -- validar` pasa con los 4 casos.
- [ ] Al enviar "ana@" el formulario muestra el mensaje y no guarda.
**Costo estimado:** ~12k tokens.
**Riesgo:** bajo (sin revisión separada; alcanza con `verificar`).
