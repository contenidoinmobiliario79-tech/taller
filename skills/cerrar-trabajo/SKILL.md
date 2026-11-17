---
name: cerrar-trabajo
description: Usar al terminar un trabajo Normal o Profundo. Marca el plan completado, resume en 5 líneas, informa el costo y propone próximos pasos. Use to wrap up work.
---

# Cerrar el trabajo

Un trabajo bien cerrado se puede retomar en un mes sin preguntar nada. Esta skill deja todo ordenado.

## Pasos

1. **Verificación final.** Corré la verificación completa (todos los tests, el build o la revisión final del contenido) con `verificar`.
2. **Plan al día.** Si hay un archivo de plan (modo Profundo), cambiá `Estado:` a `completado`, tildá los criterios cumplidos y anotá los que no. En modo Normal sin archivo, alcanza con el resumen en el mensaje final.
3. **Resumen.** Agregá al final del plan (o en `docs/taller/resumenes/`) un resumen con la plantilla de `references/plantilla-resumen.md`.
4. **Integración (código).** Ofrecé las opciones que apliquen: dejar los cambios listos para commit, crear un commit local, abrir un PR, o dejar la rama para revisar. Publicar algo (push, PR, merge) se hace solo con el ok explícito de la persona.
5. **Costo.** Informá el consumo estimado (o real) contra el presupuesto.
6. **Próximos pasos.** Hasta 3 sugerencias concretas, incluidas las ideas que quedaron "para después".

## Mensaje final a la persona

Corto: qué quedó hecho, la evidencia, qué quedó pendiente y una pregunta si hace falta decidir algo.
