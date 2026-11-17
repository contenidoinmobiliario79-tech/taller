# Técnicas de depuración · Debugging techniques

## Bisección
Si antes funcionaba, `git bisect` encuentra el commit culpable en pocos pasos. Sin git, comentá la mitad del cambio y fijate en qué mitad vive el bug.

## Seguir el dato hacia atrás
Partí del valor incorrecto y preguntá "¿de dónde vino?" función por función hasta encontrar dónde se volvió incorrecto.

## Tests intermitentes
Suelen deberse a tiempos (esperas fijas, carreras), estado compartido entre tests u orden de ejecución. Corré el test solo y en bucle (`for i in $(seq 20); do …; done`); si solo falla junto a otros, buscá qué test deja estado sucio corriendo subconjuntos. Aislar con una fixture en `conftest.py` (o el equivalente) evita que el orden los rompa; además, cerrá con `Causa en producción: … ¿Querés que la saque?`.

## Esperar condiciones, no tiempos
Reemplazá `sleep(2)` por "esperar hasta que X sea verdadero, con un límite". Es más rápido y más estable.

## Validar en varias capas
Después de arreglar, agregá una comprobación en la entrada de datos y otra cerca de donde se usan. Así un error parecido se detecta antes.
