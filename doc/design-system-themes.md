# Design system themes

The package ships two themes in the style of a well known design system:

| Theme | Style of | Brightness |
|---|---|---|
| `ImpaktfullUiShadcnTheme` | [shadcn/ui](https://ui.shadcn.com) | `.light()` and `.dark()` |
| `ImpaktfullUiAntDesignTheme` | [Ant Design 5](https://5x.ant.design) | `.light()` and `.dark()` |

```dart
ImpaktfullUiThemeBuilder(
  theme: ImpaktfullUiShadcnTheme.light(fontFamily: 'Geist'),
  builder: (context) => const MyApp(),
);
```

Both are built with the public theme API only, the same way an app builds its
own theme, and both are in the theme picker of the example app. They are
**not** ports of those design systems and not affiliated with them: the
components of this package are built differently, so the parts below cannot be
reached from a theme.

A golden test per preset (`test/src/theme/presets/`) renders a showcase of the
components each design system is recognized by, and a test per preset measures
the geometry (a 32px Ant control, a 36px shadcn control, a 16px checkbox, a
3px focus ring). Together they are the regression test of the theme system: a
component that starts hardcoding a size, a radius or a state color fails them.

## Which components they cover

Every component that has a counterpart in the design system, which is 30 of
the 87 component themes:

| | shadcn/ui | Ant Design |
|---|---|---|
| button, input field, checkbox, switch, badge, card, modal, table (header, row, cells), focus ring | yes | yes |
| tooltip, dropdown menu and its items, radio button, slider, tabs, notification, pagination, avatar, bottom sheet, progress indicator, skeleton, divider | yes | yes |
| segmented control | — (it has none) | yes |

The others keep the geometry of this package, because the design system has
nothing to say about them: the virtual keyboard, the image cropper, the WYSIWYG
editor, the chat, the CMS header, the calendar, the colour picker, the
introduction, the confetti, the master detail layout, and the layout
primitives (`ImpaktfullUiAutoLayout`, `ImpaktfullUiResponsiveRow`, …).

Where the two systems disagree structurally, the preset follows its own
system. Tabs are the clearest case: shadcn/ui is a `bg-muted rounded-lg
p-[3px]` list whose active tab is a filled `bg-background` box with no
underline, and Ant Design is a transparent row with a `colorSplit` line under
it and a 2px `colorPrimary` bar under the active tab.

## What the theme covers

| | shadcn/ui | Ant Design 5 |
|---|---|---|
| Palette | the `default` base color (`--background`, `--foreground`, `--primary`, `--muted`, `--destructive`, `--border`, `--ring`), light and dark | the seed and alias tokens of both algorithms (`colorPrimary`, `colorText`, `colorBorder`, `colorBgContainer`, `colorBgLayout`, `colorFillAlter`) |
| Radius | `--radius-sm` 6, `--radius-md` 8 (controls), `--radius-lg` 10 (dialog), `--radius-xl` 14 (card) | `borderRadius` 6 (controls), `borderRadiusLG` 8 (card, modal) |
| Control height | `h-8` / `h-9` / `h-10` on the button, `h-9` on the input field | `controlHeightSM` 24 / `controlHeight` 32 / `controlHeightLG` 40, on the button and the input field |
| Typography | `text-sm` (14) with `leading-normal`, `font-medium` on a button | `fontSize` 14 with a line box of 22 |
| States | `hover:bg-primary/90`, `hover:bg-accent`, `disabled:opacity-50` | the `colorPrimaryHover` / `colorPrimaryActive` ramp per button type, and explicit disabled colors |
| Focus | `ring-ring/50` at `ring-[3px]`, no offset | `outline: 4px solid colorPrimaryBorder` with `outline-offset: 1px` |
| Checkbox / switch | `size-4` box, a `h-[1.15rem] w-8` track with a `size-4` thumb | `controlInteractiveSize` 16, a 44 × 22 track with an 18 thumb |
| Surfaces | `shadow-xs` / `shadow-sm` / `shadow-lg`, a `bg-black/50` overlay | `boxShadowTertiary` on a card, a `rgba(0, 0, 0, 0.45)` mask |
| Table | `hover:bg-muted/50`, `data-[state=selected]:bg-muted` | `headerBg` and `rowHoverBg` of `colorFillAlter`, 16 × 16 cells |

## What a theme cannot reach

These are differences in the components, not missing tokens. They are the
reason the presets are "in the style of" instead of a port.

- **Structure.** `ImpaktfullUiInputField` renders its `label` above the field
  and its `hint` below it, where both design systems put a placeholder inside
  the field. A card of this package has one `child`, not a header, a body and
  a footer slot.
- **A font size per control size.** Ant Design's large button uses
  `fontSize: 16` where its default uses 14. The button has one text style for
  every size, so the preset uses 14 everywhere.
- **A line height per text size.** `fontSizeText` grows the whole scale in
  steps of 2 and `heightText` is one multiplier for all of it, while Ant
  Design declares a line height per size (22 for 14, 24 for 16).
- **Per-state text and border of a component that is not a button.** The
  button has a `hover`, `pressed` and `disabled` color theme; the other
  components have a hover background at most, so Ant's "a hovered row turns
  its text and border blue" is a background change here.
- **The bottom sheet barrier.** `ImpaktfullUiBottomSheet` uses Flutter's
  `showModalBottomSheet`, which does not read the modal theme, so its barrier
  is the Flutter default instead of the mask of the design system.
- **Fonts.** The package ships no fonts. shadcn/ui renders with Geist (or
  Inter): declare the family in the `pubspec.yaml` of the app and pass it as
  `fontFamily`. Ant Design's `fontFamily` is a stack that starts at the font
  of the platform, which is what Flutter renders without a family, so the Ant
  preset sets none.

## Building your own

A preset is one file of constants and one `withMinimalChanges` call followed
by a `copyWith` per component (`lib/src/theme/presets/`). Copy it as the
starting point of a theme for your own design system. The four seeds do most
of the work:

```dart
ImpaktfullUiDefaultTheme.withMinimalChanges(
  primary: brand,
  accent: brand,
  secondary: brand,
  radius: 6,        // the radius scale: 2 / 4 / 6 / 10 / 14
  spacingUnit: 4,   // the spacing scale: 4 / 8 / 12 / 16 / 24 / 32
  fontSizeText: 14, // the text scale: 18 / 16 / 14 / 12 / 10
  heightText: 1.5,
);
```

Then set the tokens that carry the identity of the design system: the control
heights (`components.button.dimens.sizes`, `components.inputField.dimens
.minHeight`), the state colors (`components.button.colors.primaryHover`, ...)
and the focus ring (`components.touchFeedback.focusRing`).
