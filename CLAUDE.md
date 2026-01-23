# ImpaktfullUI

A comprehensive Flutter UI component library with themeable components and pre-built building blocks.

## Quick Start

This codebase contains two main types of UI elements:

- **Components** (`ImpaktfullUi*`) - Reusable, themeable UI widgets (buttons, inputs, cards, etc.)
- **Building Blocks** (`ImpaktfullUiBB*`) - Pre-built screens/layouts composed of components (login, register, etc.)

## Skills

Learn how to work with this codebase:

- [Create a Component](.claude/skills/create_component/SKILL.md) - How to add new reusable components
- [Create a Building Block](.claude/skills/create_building_block/SKILL.md) - How to add new pre-built screens
- [Theme System](.claude/skills/theme_system/SKILL.md) - How the theming architecture works
- [Architecture Overview](.claude/skills/architecture/SKILL.md) - Project structure, patterns, and conventions

## Changelog (REQUIRED)

**IMPORTANT: Always update CHANGELOG.md when making any code or documentation changes.**

Update CHANGELOG.md to match what changed in the code:

| Change Type | Version Bump |
|-------------|--------------|
| fix/chore/docs/ci | 0.0.x |
| feat | 0.x.0 |
| feat! | x.0.0 |

Add a new version entry at the top of CHANGELOG.md with the appropriate section (Feature, Fix, Chore, etc.).

Do not update the `pubspec.yaml` version. This is handled by the CI/CD pipeline.

## Validate

```bash
./tool/format.sh
./tool/analyze.sh
```

## Create Pull Request

Pull requests are created on Github. `main` branch is the default branch.
All changes pushed to the default branch should be done through a pull request.
