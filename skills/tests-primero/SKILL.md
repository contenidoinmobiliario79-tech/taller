---
name: tests-primero
description: Usar al escribir código nuevo o arreglar un bug con tests disponibles. Primero un test que falle, después el código mínimo, luego ordenar. Use for test-first coding.
---

# Tests primero

Escribir el test antes del código obliga a definir qué significa "funciona" y deja una red de seguridad para después.

## El ciclo

1. **Rojo:** escribí un test chico que describa un comportamiento. Corrélo y confirmá que **falla por la razón esperada** (no por un error de sintaxis o un import roto).
2. **Verde:** escribí el código mínimo que lo hace pasar. Nada de funciones extra "por las dudas".
3. **Ordenar:** con los tests en verde, mejorá nombres, quitá duplicación y simplificá. Corré los tests de nuevo.
4. Repetí con el siguiente comportamiento.

## Buenos tests

- Un comportamiento por test, con un nombre que se lea como una oración: `rechaza_emails_sin_arroba`.
- Probá lo que se ve desde afuera (entradas y salidas), no detalles internos.
- Usá datos reales o casi reales; reservá los mocks para lo lento o externo (red, pagos, reloj).
- Cubrí el caso feliz, un borde y un error.

## Cuándo se puede saltar

- Prototipo descartable que la persona aprobó como tal.
- Cambios de configuración, textos o estilos sin lógica.
- El proyecto no tiene tests y la persona no quiere agregarlos: en ese caso, verificá a mano y decilo.
- `fases.tests_primero` está en `false` en `taller.config.json`.

Cuando lo saltes, decí por qué en una línea. Ver `examples/ciclo-completo.md`.

## Código nuevo

Antes de dar una función o un comando por terminado, repasá esta lista:

- Preferí un módulo (o archivo) nuevo antes de meter la función en un archivo que ya hace otra cosa. Ampliar un archivo existente solo si el cambio es de unas pocas líneas y pertenece ahí.
- En una CLI o en algo que usa una persona, los errores van con un mensaje claro ("El CSV está vacío" o "Falta la columna nombre"). No dejes que un traceback crudo sea la respuesta.
- Si hay CSV de entrada: leelo con codificación `utf-8-sig` (o el equivalente que ignore el BOM). Agregá un test con un CSV que empiece por BOM, como los de Excel. La clave tiene que ser `nombre`, no `"\ufeffnombre"`.
- La CLI tiene una salida útil: imprime el resultado en pantalla si no piden un archivo, o acepta un destino (`-o` u otro argumento claro).
- Actualizá el README (o la ayuda de la CLI) con un ejemplo de uso.
