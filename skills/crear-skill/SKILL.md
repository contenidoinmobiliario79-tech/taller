---
name: crear-skill
description: Usar para crear una skill nueva o mejorar una existente. Arma SKILL.md, referencias, ejemplos y su eval desde el primer día. Use to create or improve a skill.
---

# Crear una skill

Una skill vale si cambia el comportamiento del agente de forma medible. Por eso se escribe junto con su prueba.

## 1. Definí el problema

Escribí en dos líneas: qué hace mal el agente sin la skill y qué debería hacer con ella. Si no podés describir la diferencia, todavía no hay skill.

## 2. Escribí la prueba primero

Creá `evals/skills/<nombre>.md` con 3 a 5 pedidos realistas y, para cada uno, qué tendría que pasar. Corrélos **sin** la skill y anotá qué hace el agente. Eso es la línea de base.

## 3. Escribí la skill

Seguí la estructura de `references/anatomia.md`:
- `name` en minúsculas con guiones, igual al nombre de la carpeta.
- `description` de menos de 200 caracteres que diga **cuándo** usarla (empezá con "Usar cuando…" o "Usar para…"), en español y con palabras clave en inglés.
- Cuerpo corto (menos de 8 KB): pasos numerados, criterios claros, un ejemplo. Lo que se necesita a veces va a `references/`.
- Instrucciones en positivo, explicando el porqué. Evitá mayúsculas de alarma y amenazas: los modelos actuales siguen mejor las razones que la presión.

## 4. Probá con la skill

Corré los mismos pedidos con la skill activa. Compará con la línea de base. Si no mejora, ajustá la descripción (si no se activa) o el cuerpo (si se activa pero no ayuda).

## 5. Validá

Corré `tests/validar.sh` desde la raíz del pack: revisa frontmatter, tamaño y enlaces.
