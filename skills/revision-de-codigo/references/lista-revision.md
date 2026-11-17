# Lista de revisión · Review checklist

**Cumple lo pedido**
- [ ] Hace lo que decía la tarea, ni más ni menos.
- [ ] Los criterios de "hecho cuando" se cumplen y hay evidencia.

**Correcto**
- [ ] Casos borde: vacío, nulo, muy grande, caracteres especiales, zona horaria.
- [ ] Manejo de errores: no se tragan excepciones; mensajes claros para quien usa la herramienta, no un traceback crudo.
- [ ] Concurrencia o asincronía sin carreras evidentes.

**Seguro**
- [ ] Sin secretos en el código ni en logs.
- [ ] Entradas externas validadas (SQL, rutas, HTML).
- [ ] Permisos mínimos.

**Mantenible**
- [ ] Nombres claros, funciones cortas, sin duplicación grande. Una función nueva vive en su propio módulo si no pertenece de forma clara a un archivo existente.
- [ ] Tests que fallarían si el comportamiento se rompe.
- [ ] Sin código muerto ni comentarios desactualizados.

**Compatible**
- [ ] No rompe APIs públicas sin avisar.
- [ ] Funciona en los sistemas que importan (Linux, macOS, Windows si aplica).
