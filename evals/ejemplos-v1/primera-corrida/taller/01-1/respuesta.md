Modo Rápido: un cambio de un archivo, presupuesto ~20k tokens.

Cambié el fondo de `.btn-enviar` de `#2ECC71` a `#1E66F5` en `style.css`.

Verificación: `grep -n "1E66F5" style.css` → `3:  background-color: #1E66F5;` y `git diff` muestra una sola línea modificada (ver `evidencia.diff`).
