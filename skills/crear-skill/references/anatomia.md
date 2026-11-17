# Anatomía de una skill de Taller

```
skills/<nombre>/
├── SKILL.md         # obligatorio, < 8 KB
├── references/      # detalle que se carga solo cuando hace falta
└── examples/        # 1 ejemplo bueno, 1 a evitar, comentados
evals/skills/<nombre>.md   # pedidos de prueba y resultado esperado
```

## Plantilla de SKILL.md

```markdown
---
name: <nombre-con-guiones>
description: Usar cuando <situación>. <Qué hace en pocas palabras>. Use when <situation>.
---

# <Título>

<Una o dos oraciones: para qué sirve y por qué importa.>

## Pasos
1. …

## Cuándo no usarla
- …
```

## Checklist de calidad
- [ ] La descripción dice cuándo, no solo qué.
- [ ] Un agente sin contexto podría seguir los pasos.
- [ ] Hay un criterio claro de terminado.
- [ ] Tiene eval con línea de base y resultado con la skill.
