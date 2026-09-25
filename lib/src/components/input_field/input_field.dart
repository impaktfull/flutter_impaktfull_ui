import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:impaktfull_ui/src/util/accessibility/accessibility.localizations.dart';
import 'package:impaktfull_ui/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/card/card.dart';
import 'package:impaktfull_ui/src/components/interaction_feedback/touch_feedback/touch_feedback.dart';
import 'package:impaktfull_ui/src/components/icon_button/icon_button.dart';
import 'package:impaktfull_ui/src/components/input_field/input_field.dart';
import 'package:impaktfull_ui/src/components/interaction_feedback/hover_feedback/hover_feedback.dart';
import 'package:impaktfull_ui/src/components/section_title/section_title.dart';
import 'package:impaktfull_ui/src/components/virtual_keyboard/controller/virtual_keyboard_text_edit_controller.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/util/extension/border_radius_geometry_extension.dart';
import 'package:impaktfull_ui/src/widget/input/base_input_field.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'input_field_style.dart';
export 'action/input_field_action.dart';
export 'validator/input_field_validator.dart';

typedef ImpaktfullUiInputFieldValidator = ImpaktfullUiInputFieldValidatorResult
    Function(String value);

class ImpaktfullUiInputField extends StatefulWidget {
  final String? label;
  final List<Widget> labelActions;
  final String? placeholder;
  final String? hint;
  final String? error;
  final WidgetBuilder? leadingBuilder;
  final WidgetBuilder? topBuilder;
  final ImpaktfullUiAsset? leadingIcon;
  final Widget? trailingAction;
  final List<Widget> trailingInputActions;
  final String? value;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final TextEditingController? controller;
  final bool autofocus;
  final bool autocorrect;
  final FocusNode? focusNode;
  final ValueChanged<bool>? onFocusChange;
  final bool obscureText;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final bool multiline;
  final int? maxLines;
  final List<String> autofill;
  final TextAlign textAlign;
  final bool readOnly;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter> inputFormatters;
  final ImpaktfullUiInputFieldValidator? validator;
  final ImpaktfullUiInputFieldTheme? theme;

  const ImpaktfullUiInputField({
    required this.value,
    required this.onChanged,
    this.leadingIcon,
    this.leadingBuilder,
    this.topBuilder,
    this.trailingAction,
    this.trailingInputActions = const [],
    this.placeholder,
    this.hint,
    this.error,
    this.label,
    this.labelActions = const [],
    this.autofill = const [],
    this.controller,
    this.focusNode,
    ValueChanged<bool>? onFocusChange,
    @Deprecated('Use onFocusChange instead. Will be removed in 1.0.0.')
    ValueChanged<bool>? onFocusChanged,
    ValueChanged<String>? onSubmitted,
    @Deprecated('Use onSubmitted instead. Will be removed in 1.0.0.')
    ValueChanged<String>? onSubmit,
    this.autofocus = false,
    this.autocorrect = true,
    this.obscureText = false,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.multiline = false,
    this.maxLines,
    this.textAlign = TextAlign.start,
    this.readOnly = false,
    this.validator,
    this.inputFormatters = const [],
    this.textCapitalization = TextCapitalization.none,
    this.theme,
    super.key,
  })  : onFocusChange = onFocusChange ?? onFocusChanged,
        onSubmitted = onSubmitted ?? onSubmit;

  @Deprecated('Use onSubmitted instead. Will be removed in 1.0.0.')
  ValueChanged<String>? get onSubmit => onSubmitted;

  @Deprecated('Use onFocusChange instead. Will be removed in 1.0.0.')
  ValueChanged<bool>? get onFocusChanged => onFocusChange;

  @override
  State<ImpaktfullUiInputField> createState() => _ImpaktfullUiInputFieldState();
}

class _ImpaktfullUiInputFieldState extends State<ImpaktfullUiInputField> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  var _obscureText = false;

  String? _validationError;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
    _controller =
        widget.controller ?? TextEditingController(text: widget.value);
    _focusNode = widget.focusNode ?? FocusNode();
    if (widget.autofocus) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _focusNode.requestFocus();
      });
    }
  }

  @override
  void didUpdateWidget(covariant ImpaktfullUiInputField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      final oldController = _controller;
      _controller = widget.controller ??
          TextEditingController(text: widget.value ?? oldController.text);
      if (oldWidget.controller == null) {
        // Children still reference the old controller during this frame.
        WidgetsBinding.instance
            .addPostFrameCallback((_) => oldController.dispose());
      }
    }
    if (oldWidget.focusNode != widget.focusNode) {
      final oldFocusNode = _focusNode;
      _focusNode = widget.focusNode ?? FocusNode();
      if (oldWidget.focusNode == null) {
        WidgetsBinding.instance
            .addPostFrameCallback((_) => oldFocusNode.dispose());
      }
    }
    // Without an `onChanged` the field renders `_controller.text` as a
    // `Text`, so the value of the app has to reach the controller here. With
    // one, the `BaseInputField` below owns that: it knows which values this
    // field reported, so a value that is still catching up does not undo what
    // was typed in the meantime.
    final rendersItsOwnText = widget.onChanged == null && !widget.readOnly;
    if (rendersItsOwnText &&
        oldWidget.value != widget.value &&
        _controller.text != widget.value) {
      final text = widget.value ?? '';
      // Setting `text` directly would reset the selection
      final selection = _controller.selection;
      _controller.value = TextEditingValue(
        text: text,
        selection: selection.isValid
            ? TextSelection(
                baseOffset: selection.baseOffset.clamp(0, text.length),
                extentOffset: selection.extentOffset.clamp(0, text.length),
              )
            : TextSelection.collapsed(offset: text.length),
      );
    }
    if (oldWidget.obscureText != widget.obscureText) {
      _obscureText = widget.obscureText;
    }
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: widget,
      overrideComponentTheme: widget.theme,
      builder: (context, componentTheme) {
        final trailingAction = widget.trailingAction;
        final isDisabled = widget.onChanged == null;
        final trailingActionAllowed =
            widget.multiline == false && trailingAction != null;
        final trailingInputActions = [
          if (widget.obscureText) ...[
            ImpaktfullUiIconButton(
              asset: _obscureText
                  ? componentTheme.assets.passwordHide
                  : componentTheme.assets.passwordShow,
              tooltip: _obscureText
                  ? ImpaktfullUiAccessibilityLocalizations.of(context)
                      .showPassword
                  : ImpaktfullUiAccessibilityLocalizations.of(context)
                      .hidePassword,
              onTap: _onObscureTextHideShowIconTapped,
            ),
          ],
          ...widget.trailingInputActions,
        ];
        return ImpaktfullUiAutoLayout.vertical(
          mainAxisSize: MainAxisSize.min,
          spacing: componentTheme.dimens.labelSpacing,
          children: [
            if (widget.label != null) ...[
              ImpaktfullUiSectionTitle(
                title: widget.label ?? '',
                margin: componentTheme.dimens.labelMargin,
                actions: widget.labelActions,
              ),
            ],
            ImpaktfullUiAutoLayout.horizontal(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Opacity(
                    opacity: isDisabled && !widget.readOnly ? 0.66 : 1,
                    child: _HoverBuilder(
                      // Only a theme with a hovered border has to know about
                      // the pointer: without it, nothing changes on hover.
                      enabled: componentTheme.colors.borderHover != null,
                      builder: (context, isHovered) => ImpaktfullUiCard(
                        theme: _getCardTheme(
                          context,
                          componentTheme,
                          isHovered: isHovered,
                        ),
                        // The field draws its own ring, so the card must
                        // not draw a second one around it.
                        useFocusRing: componentTheme.colors.focusRing == null,
                        cursor: SystemMouseCursors.text,
                        error: widget.error != null && widget.error!.isNotEmpty,
                        onTap: isDisabled ? null : _onTap,
                        onFocus: isDisabled ? null : _onFocus,
                        padding: EdgeInsets.zero,
                        borderRadius: BorderRadiusDirectional.only(
                          topStart: componentTheme.dimens.borderRadius.topStart,
                          bottomStart:
                              componentTheme.dimens.borderRadius.bottomStart,
                          topEnd: trailingActionAllowed
                              ? Radius.zero
                              : componentTheme.dimens.borderRadius.topEnd,
                          bottomEnd: trailingActionAllowed
                              ? Radius.zero
                              : componentTheme.dimens.borderRadius.bottomEnd,
                        ),
                        child: ImpaktfullUiAutoLayout.vertical(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (widget.topBuilder != null) ...[
                              Padding(
                                padding: componentTheme.dimens.actionPadding,
                                child: widget.topBuilder!(context),
                              ),
                            ],
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                minHeight: widget.multiline
                                    ? componentTheme.dimens.multilineMinHeight
                                    : componentTheme.dimens.minHeight,
                              ),
                              child: Padding(
                                padding: trailingInputActions.isEmpty
                                    ? componentTheme.dimens.padding
                                    : componentTheme.dimens.paddingWithActions,
                                child: ImpaktfullUiAutoLayout.horizontal(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  spacing: componentTheme.dimens.spacing,
                                  children: [
                                    if (widget.leadingIcon != null) ...[
                                      ImpaktfullUiAssetWidget(
                                        asset: widget.leadingIcon,
                                        size: componentTheme.dimens.iconSize,
                                        color: componentTheme
                                            .textStyles.text.color,
                                      ),
                                    ],
                                    if (widget.leadingBuilder != null) ...[
                                      widget.leadingBuilder!(context),
                                    ],
                                    if (widget.onChanged == null &&
                                        !widget.readOnly) ...[
                                      Expanded(
                                        // The value is aligned to the top of
                                        // the field, so it fills the height of
                                        // the field instead of centering in it.
                                        child: ConstrainedBox(
                                          constraints: BoxConstraints(
                                            minHeight: widget.multiline
                                                ? componentTheme
                                                    .dimens.multilineMinHeight
                                                : componentTheme
                                                    .dimens.minHeight,
                                          ),
                                          child: Padding(
                                            padding: componentTheme
                                                .dimens.readOnlyContentPadding,
                                            child: Align(
                                              alignment:
                                                  AlignmentDirectional.topStart,
                                              child: Text(
                                                _controller.text,
                                                maxLines: widget.multiline
                                                    ? widget.maxLines
                                                    : 1,
                                                style: componentTheme
                                                    .textStyles.text,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ] else ...[
                                      Expanded(
                                        child: BaseInputField(
                                          value: widget.value,
                                          onChanged: _onChanged,
                                          onSubmit: widget.onSubmitted,
                                          focusNode: _focusNode,
                                          controller: _controller,
                                          autofill: widget.autofill,
                                          theme: componentTheme,
                                          maxLines: widget.maxLines,
                                          textInputAction:
                                              widget.textInputAction,
                                          textInputType: widget.textInputType,
                                          obscureText: _obscureText,
                                          placeholder: widget.placeholder,
                                          autofocus: widget.autofocus,
                                          autocorrect: widget.autocorrect,
                                          multiline: widget.multiline,
                                          inputFormatters:
                                              widget.inputFormatters,
                                          textCapitalization:
                                              widget.textCapitalization,
                                          onFocusChanged: _onFocusChanged,
                                          readOnly: widget.readOnly,
                                          textAlign: widget.textAlign,
                                        ),
                                      ),
                                      ...trailingInputActions,
                                    ],
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                if (trailingActionAllowed) ...[
                  trailingAction,
                ],
              ],
            ),
            if (widget.error != null || _validationError != null) ...[
              Text(
                widget.error ?? _validationError ?? '',
                style: componentTheme.textStyles.error,
              ),
            ] else if (widget.hint != null) ...[
              Text(
                widget.hint ?? '',
                style: componentTheme.textStyles.hint,
              ),
            ]
          ],
        );
      },
    );
  }

  void _onTap() {
    _focusNode.requestFocus();
    // Hack to make sure the cursor is at the end of the text
    WidgetsBinding.instance.addPostFrameCallback((d) {
      if (!mounted) return;
      _controller.selection = TextSelection(
        baseOffset: _controller.text.length,
        extentOffset: _controller.text.length,
      );
    });
  }

  void _onFocus() => _focusNode.requestFocus();

  void _onFocusChanged(bool hasFocus) {
    final hasFocus = _focusNode.hasFocus;
    // The border and the focus ring of the field follow its focus
    // (`ImpaktfullUiInputFieldColorTheme.borderFocused` / `focusRing`).
    if (mounted) setState(() {});
    final controller = widget.controller;
    if (hasFocus &&
        controller != null &&
        controller is ImpaktfullUiVirtualKeyboardTextEditController) {
      _focusNode.unfocus();
      controller.openKeyboard(
        context,
        onChanged: widget.onChanged,
        onSubmitted: _onSubmitFromVirtualKeyboard,
        obscureText: widget.obscureText,
      );
    }
    widget.onFocusChange?.call(hasFocus);
  }

  void _onSubmitFromVirtualKeyboard() {
    Navigator.pop(context);
    final onSubmitted = widget.onSubmitted;
    if (onSubmitted == null) return;
    onSubmitted(_controller.text);
  }

  void _onObscureTextHideShowIconTapped() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _onChanged(String value) {
    if (widget.readOnly) return;
    final onChanged = widget.onChanged;
    if (onChanged == null) return;
    onChanged(value);
    final validator = widget.validator;
    if (validator == null || widget.error != null) {
      setState(() => _validationError = null);
      return;
    }
    final validatorResult = validator(value);
    if (validatorResult.isPendingFinalValidation || validatorResult.isValid) {
      setState(() => _validationError = null);
      return;
    }
    setState(() => _validationError = validatorResult.errorMessage);
  }

  /// The card of the field uses the colors of the [ImpaktfullUiInputFieldTheme].
  ///
  /// The field draws its background, its border and its radius with an
  /// `ImpaktfullUiCard`, so every token of the field that ends up on that card
  /// (the border of a focused or hovered field, the border width and the focus
  /// ring) is passed through here. It starts from the card theme that is
  /// already in the tree (`ImpaktfullUiCardTheme.of`) and only replaces the
  /// tokens the field owns, so an app that themes its cards keeps the rest.
  ImpaktfullUiCardTheme _getCardTheme(
    BuildContext context,
    ImpaktfullUiInputFieldTheme componentTheme, {
    required bool isHovered,
  }) {
    final cardTheme = ImpaktfullUiCardTheme.of(context);
    final colors = componentTheme.colors;
    final dimens = componentTheme.dimens;
    final hasFocus = _focusNode.hasFocus;
    // The ring of the field, and only when the rings are on at all.
    final focusRing =
        ImpaktfullUiTouchFeedbackTheme.of(context).focusRing.enabled
            ? colors.focusRing
            : null;
    return cardTheme.copyWith(
      colors: cardTheme.colors.copyWith(
        background: colors.background,
        // A focused border wins over a hovered one, like `:focus` over
        // `:hover`. An erroneous field keeps `borderError`: the card picks
        // that one itself, from `ImpaktfullUiCard.error`.
        border: (hasFocus ? colors.borderFocused : null) ??
            (isHovered ? colors.borderHover : null) ??
            colors.border,
        borderError: colors.borderError,
      ),
      dimens: dimens.borderWidth == null
          ? null
          : cardTheme.dimens.copyWith(borderWidth: dimens.borderWidth),
      shadows: !hasFocus || focusRing == null
          ? null
          : cardTheme.shadows.copyWith(
              card: [
                ...cardTheme.shadows.card,
                // A ring, not a shadow: no blur and no offset. The border
                // of a card is painted inside its box, so the ring that
                // spreads out of that box is `focusRingWidth` thick, and
                // adding the border to it made it thicker than the theme
                // asked for.
                BoxShadow(
                  color: focusRing,
                  spreadRadius: dimens.focusRingWidth,
                ),
              ],
            ),
    );
  }
}

/// Rebuilds [builder] with whether the pointer is over it, or builds it once
/// with `false` when [enabled] is false.
class _HoverBuilder extends StatelessWidget {
  final bool enabled;
  final Widget Function(BuildContext context, bool isHovered) builder;

  const _HoverBuilder({
    required this.enabled,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    if (!enabled) return builder(context, false);
    return ImpaktfullUiHoverFeedback(
      // The card of the field sets the cursor itself.
      cursor: MouseCursor.defer,
      builder: builder,
    );
  }
}
