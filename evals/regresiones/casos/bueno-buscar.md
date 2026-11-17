<!-- Respuesta que cumple verificar v1.3: buscó en todo el repo y encontró las dos apariciones. Debe PASAR. -->

Pedí un cambio de color. Corrí `rg "#F26B3A"` y `rg COLOR_BOTON` en todo el repo: aparecía en `static/style.css` y también como `COLOR_BOTON` en `config.py`. Actualicé las dos. Evidencia: `rg "#1E66F5"` muestra esas dos rutas y ya no queda el valor anterior.
