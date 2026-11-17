<!-- Respuesta que cumple causa-raiz v1.3: fixture reutilizable y la línea obligatoria de oferta. Debe PASAR. -->

Causa: `tienda/carrito.py` guarda `ITEMS` como lista global, y los tests se pisan el estado según el orden.

Arreglo de tests: moví una fixture `autouse` a `conftest.py` para que también sirva a tests futuros. Corrí pytest con 20 semillas: 20 de 20 pasan.

Causa en producción: `ITEMS` sigue siendo una lista global. ¿Querés que la saque?
