import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/util/accessibility/accessibility.localizations.dart';
import 'package:impaktfull_ui/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/button/button.dart';
import 'package:impaktfull_ui/src/components/card/card.dart';
import 'package:impaktfull_ui/src/components/divider/divider.dart';
import 'package:impaktfull_ui/src/components/icon_button/icon_button.dart';
import 'package:impaktfull_ui/src/components/modal/modal_style.dart';
import 'package:impaktfull_ui/src/components/modal/routes/default_modal_route.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/util/extension/color_extensions.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'modal_style.dart';
export 'routes/default_modal_route.dart';

enum ImpaktfullUiModalHeaderChildLocation {
  leading,
  top,
}

enum ImpaktfullUiModalType {
  neutral,
  danger,
}

class ImpaktfullUiModal extends StatelessWidget {
  final ImpaktfullUiModalTheme? theme;
  final ImpaktfullUiModalHeaderChildLocation? headerChildLocation;
  final ImpaktfullUiAsset? headerIcon;
  final Color? headerIconColor;
  final Widget? headerChild;
  final String? title;
  final String? subtitle;
  final String? content;
  final bool hasClose;
  final Future<bool> Function()? onCloseTapped;
  final Widget? child;
  final String? primaryActionTitle;
  final VoidCallback? onPrimaryActionTapped;
  final String? secondaryActionTitle;
  final VoidCallback? onSecondaryActionTapped;
  final List<Widget> actions;
  final bool isDismissible;
  final bool showDividers;
  final double width;
  final EdgeInsetsGeometry? childPadding;
  final ImpaktfullUiModalType type;

  const ImpaktfullUiModal({
    this.headerChildLocation,
    this.headerIcon,
    this.headerIconColor,
    this.headerChild,
    this.title,
    this.subtitle,
    this.hasClose = true,
    this.onCloseTapped,
    this.child,
    String? primaryActionTitle,
    @Deprecated('Use primaryActionTitle instead. Will be removed in 1.0.0.')
    String? primaryActionLabel,
    VoidCallback? onPrimaryActionTapped,
    @Deprecated('Use onPrimaryActionTapped instead. Will be removed in 1.0.0.')
    VoidCallback? primaryActionOnTap,
    String? secondaryActionTitle,
    @Deprecated('Use secondaryActionTitle instead. Will be removed in 1.0.0.')
    String? secondaryActionLabel,
    VoidCallback? onSecondaryActionTapped,
    @Deprecated(
        'Use onSecondaryActionTapped instead. Will be removed in 1.0.0.')
    VoidCallback? secondaryActionOnTap,
    this.actions = const [],
    this.isDismissible = true,
    this.showDividers = false,
    this.width = 400,
    this.childPadding,
    this.theme,
    this.type = ImpaktfullUiModalType.neutral,
    super.key,
  })  : content = null,
        primaryActionTitle = primaryActionTitle ?? primaryActionLabel,
        onPrimaryActionTapped = onPrimaryActionTapped ?? primaryActionOnTap,
        secondaryActionTitle = secondaryActionTitle ?? secondaryActionLabel,
        onSecondaryActionTapped =
            onSecondaryActionTapped ?? secondaryActionOnTap;

  const ImpaktfullUiModal.simple({
    this.headerChildLocation,
    this.headerIcon,
    this.headerIconColor,
    this.headerChild,
    this.title,
    this.subtitle,
    this.content,
    String? primaryActionTitle,
    @Deprecated('Use primaryActionTitle instead. Will be removed in 1.0.0.')
    String? primaryActionLabel,
    String? secondaryActionTitle,
    @Deprecated('Use secondaryActionTitle instead. Will be removed in 1.0.0.')
    String? secondaryActionLabel,
    VoidCallback? onPrimaryActionTapped,
    @Deprecated('Use onPrimaryActionTapped instead. Will be removed in 1.0.0.')
    VoidCallback? primaryActionOnTap,
    VoidCallback? onSecondaryActionTapped,
    @Deprecated(
        'Use onSecondaryActionTapped instead. Will be removed in 1.0.0.')
    VoidCallback? secondaryActionOnTap,
    this.hasClose = true,
    this.onCloseTapped,
    this.isDismissible = true,
    this.showDividers = false,
    this.width = 400,
    this.type = ImpaktfullUiModalType.neutral,
    this.theme,
    super.key,
  })  : child = null,
        actions = const [],
        childPadding = null,
        primaryActionTitle = primaryActionTitle ?? primaryActionLabel,
        onPrimaryActionTapped = onPrimaryActionTapped ?? primaryActionOnTap,
        secondaryActionTitle = secondaryActionTitle ?? secondaryActionLabel,
        onSecondaryActionTapped =
            onSecondaryActionTapped ?? secondaryActionOnTap;

  @Deprecated('Use primaryActionTitle instead. Will be removed in 1.0.0.')
  String? get primaryActionLabel => primaryActionTitle;

  @Deprecated('Use onPrimaryActionTapped instead. Will be removed in 1.0.0.')
  VoidCallback? get primaryActionOnTap => onPrimaryActionTapped;

  @Deprecated('Use secondaryActionTitle instead. Will be removed in 1.0.0.')
  String? get secondaryActionLabel => secondaryActionTitle;

  @Deprecated('Use onSecondaryActionTapped instead. Will be removed in 1.0.0.')
  VoidCallback? get secondaryActionOnTap => onSecondaryActionTapped;

  static Future<T?> show<T>({
    required BuildContext context,
    required Widget Function(BuildContext context) builder,
    RouteSettings? routeSettings,
    bool hasBlurredBackground = false,
    bool barrierDismissible = true,
    bool rootNavigator = false,
  }) {
    // The route has no context of its own to read a theme from, so the tokens
    // of the modal theme are resolved here.
    final modalTheme = ImpaktfullUiModalTheme.of(context);
    return Navigator.of(context, rootNavigator: rootNavigator).push<T>(
      ImpaktfullUiDefaultModalRoute<T>(
        context: context,
        builder: builder,
        transitionDuration: modalTheme.durations.transition,
        barrierColor: modalTheme.colors.barrier,
        blurSigma: modalTheme.dimens.barrierBlurSigma,
        settings: routeSettings,
        barrierDismissible: barrierDismissible,
        hasBlurredBackground: hasBlurredBackground,
      ),
    );
  }

  static Future<T?> showSimple<T>({
    required BuildContext context,
    ImpaktfullUiModalHeaderChildLocation? headerChildLocation,
    ImpaktfullUiAsset? headerIcon,
    Color? headerIconColor,
    Widget? headerChild,
    String? title,
    String? subtitle,
    Widget? child,
    RouteSettings? routeSettings,
    List<Widget> actions = const [],
    Future<bool> Function()? onCloseTapped,
    bool hasClose = true,
    bool isDismissible = true,
    bool hasBlurredBackground = false,
    bool barrierDismissible = true,
    bool showDividers = false,
    bool rootNavigator = false,
    double width = 400,
    EdgeInsetsGeometry? childPadding,
  }) {
    final modal = ImpaktfullUiModal(
      headerChildLocation: headerChildLocation,
      headerIcon: headerIcon,
      headerIconColor: headerIconColor,
      headerChild: headerChild,
      title: title,
      subtitle: subtitle,
      actions: actions,
      onCloseTapped: onCloseTapped,
      hasClose: hasClose,
      isDismissible: isDismissible,
      showDividers: showDividers,
      width: width,
      childPadding: childPadding,
      child: child,
    );
    return show(
      context: context,
      builder: (context) => modal,
      rootNavigator: rootNavigator,
      routeSettings: routeSettings,
      hasBlurredBackground: hasBlurredBackground,
      barrierDismissible: barrierDismissible && isDismissible,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: this,
      overrideComponentTheme: theme,
      builder: (context, componentTheme) {
        // Tapping outside the card is handled by the barrier of the route
        // (barrierDismissible), the modal itself never pops on an outside tap:
        // it can also be used inline in a page.
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final width = constraints.maxWidth > this.width
                    ? this.width
                    : constraints.maxWidth;
                final actionsOrientation = _getActionsOrientation(width);
                final allActions = [
                  ...this.actions,
                  if (secondaryActionTitle != null) ...[
                    ImpaktfullUiButton(
                      type: ImpaktfullUiButtonType.secondaryGrey,
                      title: secondaryActionTitle!,
                      onTap: onSecondaryActionTapped,
                    ),
                  ],
                  if (primaryActionTitle != null) ...[
                    ImpaktfullUiButton(
                      type: type == ImpaktfullUiModalType.danger
                          ? ImpaktfullUiButtonType.destructivePrimary
                          : ImpaktfullUiButtonType.primary,
                      title: primaryActionTitle!,
                      onTap: onPrimaryActionTapped,
                    ),
                  ],
                ];
                List<Widget> actions = allActions;
                if (actions.isNotEmpty &&
                    actionsOrientation ==
                        ImpaktfullUiAutoLayoutOrientation.horizontal) {
                  actions = actions
                      .map(
                        (action) => Expanded(
                          child: action,
                        ),
                      )
                      .toList();
                }
                final headerChildren = [
                  if (headerChild != null) ...[
                    headerChild!,
                  ],
                  if (headerIcon != null) ...[
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: componentTheme.colors.leadingHeaderIcon
                              .withOpacityPercentage(0.2),
                          width: componentTheme.dimens.borderWidth,
                        ),
                        borderRadius: componentTheme.dimens.borderRadius,
                      ),
                      padding: componentTheme.dimens.leadingIconPadding,
                      child: ImpaktfullUiAssetWidget(
                        asset: headerIcon!,
                        color: headerIconColor ??
                            componentTheme.colors.leadingHeaderIcon,
                      ),
                    ),
                  ],
                ];
                final hasHeader = headerChildLocation != null ||
                    headerIcon != null ||
                    headerChild != null ||
                    title != null ||
                    subtitle != null;
                return GestureDetector(
                  onTap: () {}, // cancel close event
                  child: ImpaktfullUiCard(
                    padding: EdgeInsets.zero,
                    borderRadius: componentTheme.dimens.borderRadius,
                    child: SizedBox(
                      width: width,
                      child: ImpaktfullUiAutoLayout.vertical(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Stack(
                            children: [
                              if (hasHeader) ...[
                                Padding(
                                  padding: componentTheme.dimens.padding,
                                  child: ImpaktfullUiAutoLayout.horizontal(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    spacing: 16,
                                    children: [
                                      if (headerChildLocation ==
                                              ImpaktfullUiModalHeaderChildLocation
                                                  .leading &&
                                          headerChildren.isNotEmpty) ...[
                                        ...headerChildren,
                                      ],
                                      Expanded(
                                        child: ImpaktfullUiAutoLayout.vertical(
                                          mainAxisSize: MainAxisSize.min,
                                          spacing: 4,
                                          children: [
                                            if (headerChildLocation ==
                                                    ImpaktfullUiModalHeaderChildLocation
                                                        .top &&
                                                headerChildren.isNotEmpty) ...[
                                              ...headerChildren,
                                            ],
                                            if (title != null) ...[
                                              Text(
                                                title!,
                                                style: componentTheme
                                                    .textStyles.title,
                                              ),
                                              if (subtitle != null) ...[
                                                Text(
                                                  subtitle!,
                                                  style: componentTheme
                                                      .textStyles.subtitle,
                                                ),
                                              ],
                                            ],
                                          ],
                                        ),
                                      ),
                                      if (hasClose ||
                                          onCloseTapped != null) ...[
                                        const SizedBox(width: 48),
                                      ],
                                    ],
                                  ),
                                ),
                              ],
                              if (hasClose || onCloseTapped != null) ...[
                                Align(
                                  alignment: AlignmentDirectional.topEnd,
                                  child: Padding(
                                    padding: componentTheme
                                        .dimens.closeIconButtonPadding,
                                    child: ImpaktfullUiIconButton(
                                      onTap: () => _onCloseTapped(context),
                                      tooltip:
                                          ImpaktfullUiAccessibilityLocalizations
                                                  .of(context)
                                              .close,
                                      asset: componentTheme.assets.close,
                                      color: componentTheme.colors.closeIcon,
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                          if (showDividers && title != null) ...[
                            const ImpaktfullUiDivider(),
                          ],
                          if (child != null) ...[
                            Flexible(
                              flex: 1,
                              fit: FlexFit.loose,
                              child: Padding(
                                padding: childPadding ??
                                    componentTheme.dimens.padding,
                                child: child!,
                              ),
                            ),
                          ],
                          if (content != null) ...[
                            Flexible(
                              flex: 1,
                              fit: FlexFit.loose,
                              child: Padding(
                                padding: componentTheme.dimens.padding,
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    content!,
                                    style: componentTheme.textStyles.content,
                                  ),
                                ),
                              ),
                            ),
                          ],
                          if (showDividers &&
                              (child != null || title != null)) ...[
                            const ImpaktfullUiDivider(),
                          ],
                          if (actions.isNotEmpty ||
                              primaryActionTitle != null ||
                              secondaryActionTitle != null) ...[
                            Padding(
                              padding: componentTheme.dimens.padding,
                              child: ImpaktfullUiAutoLayout(
                                spacing: 8,
                                orientation: actionsOrientation,
                                crossAxisAlignment: actionsOrientation ==
                                        ImpaktfullUiAutoLayoutOrientation
                                            .vertical
                                    ? CrossAxisAlignment.stretch
                                    : CrossAxisAlignment.start,
                                children: [
                                  ...actions,
                                ],
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  Future<void> _onCloseTapped(BuildContext context) async {
    if (onCloseTapped == null) {
      Navigator.of(context).pop();
      return;
    }
    final result = await onCloseTapped!();
    if (!context.mounted) return;
    if (result == true) {
      Navigator.of(context).pop();
    }
  }

  ImpaktfullUiAutoLayoutOrientation _getActionsOrientation(double width) {
    if (actions.length > 2) {
      return ImpaktfullUiAutoLayoutOrientation.vertical;
    }
    if (width > 400) {
      return ImpaktfullUiAutoLayoutOrientation.vertical;
    }
    return ImpaktfullUiAutoLayoutOrientation.horizontal;
  }
}
