import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/divider/divider.dart';
import 'package:impaktfull_ui_2/src/components/icon_button/icon_button.dart';
import 'package:impaktfull_ui_2/src/components/modal/modal_style.dart';
import 'package:impaktfull_ui_2/src/components/modal/routes/default_modal_route.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/models/asset.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

export 'modal_style.dart';
export 'routes/default_modal_route.dart';

part 'modal.describe.dart';

enum ImpaktfullUiModalHeaderChildLocation {
  leading,
  top,
}

class ImpaktfullUiModal extends StatelessWidget with ComponentDescriptorMixin {
  final ImpaktfullUiModalTheme? theme;
  final ImpaktfullUiModalHeaderChildLocation? headerChildLocation;
  final ImpaktfullUiAsset? headerIcon;
  final Widget? headerChild;
  final String? title;
  final String? subtitle;
  final bool hasClose;
  final Future<bool> Function()? onCloseTapped;
  final Widget? child;
  final List<Widget> actions;
  final bool isDismissible;
  final bool showDividers;
  final double width;

  const ImpaktfullUiModal({
    this.headerChildLocation,
    this.headerIcon,
    this.headerChild,
    this.title,
    this.subtitle,
    this.hasClose = true,
    this.onCloseTapped,
    this.child,
    this.actions = const [],
    this.isDismissible = true,
    this.showDividers = false,
    this.width = 400,
    this.theme,
    super.key,
  });

  static Future<T?> show<T>({
    required BuildContext context,
    required Widget Function(BuildContext context) builder,
    bool hasBlurredBackground = false,
    bool rootNavigator = false,
  }) =>
      Navigator.of(context, rootNavigator: rootNavigator)
          .push<T>(ImpaktfullUiDefaultModalRoute<T>(
        context: context,
        builder: builder,
        barrierDismissible: true,
        barrierLabel: '',
        hasBlurredBackground: hasBlurredBackground,
      ));

  static Future<T?> showSimple<T>({
    required BuildContext context,
    ImpaktfullUiModalHeaderChildLocation? headerChildLocation,
    ImpaktfullUiAsset? headerIcon,
    Widget? headerChild,
    String? title,
    String? subtitle,
    Widget? child,
    List<Widget> actions = const [],
    Future<bool> Function()? onCloseTapped,
    bool isDismissible = true,
    bool hasBlurredBackground = false,
    bool showDividers = false,
    bool rootNavigator = false,
    double width = 400,
  }) {
    final modal = ImpaktfullUiModal(
      headerChildLocation: headerChildLocation,
      headerIcon: headerIcon,
      headerChild: headerChild,
      title: title,
      subtitle: subtitle,
      actions: actions,
      onCloseTapped: onCloseTapped,
      isDismissible: isDismissible,
      showDividers: showDividers,
      width: width,
      child: child,
    );
    return show(
      context: context,
      builder: (context) => modal,
      rootNavigator: rootNavigator,
      hasBlurredBackground: hasBlurredBackground,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiModalTheme>(
      overrideComponentTheme: theme,
      builder: (context, theme, componentTheme) {
        return GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final width = constraints.maxWidth > this.width
                      ? this.width
                      : constraints.maxWidth;
                  final actionsOrientation = _getActionsOrientation(width);
                  List<Widget> actions = this.actions;
                  if (actions.isNotEmpty &&
                      actionsOrientation ==
                          ImpaktfullUiAutoLayoutOrientation.horizontal) {
                    actions = actions
                        .map((action) => Expanded(
                              child: action,
                            ))
                        .toList();
                  }
                  final headerChilderen = [
                    if (headerChild != null) ...[
                      headerChild!,
                    ],
                    if (headerIcon != null) ...[
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: componentTheme.colors.leadingHeaderIcon
                                .withOpacity(0.2),
                          ),
                          borderRadius: componentTheme.dimens.borderRadius,
                        ),
                        padding: componentTheme.dimens.leadingIconPadding,
                        child: ImpaktfullUiAssetWidget(
                          asset: headerIcon!,
                          color: componentTheme.colors.leadingHeaderIcon,
                        ),
                      ),
                    ],
                  ];
                  return GestureDetector(
                    onTap: () {}, // cancel close event
                    child: Material(
                      color: Colors.white,
                      borderRadius: componentTheme.dimens.borderRadius,
                      child: SizedBox(
                        width: width,
                        child: ImpaktfullUiAutoLayout.vertical(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Stack(
                              children: [
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
                                          headerChilderen.isNotEmpty) ...[
                                        ...headerChilderen,
                                      ],
                                      Expanded(
                                        child: ImpaktfullUiAutoLayout.vertical(
                                          mainAxisSize: MainAxisSize.min,
                                          spacing: 4,
                                          children: [
                                            if (headerChildLocation ==
                                                    ImpaktfullUiModalHeaderChildLocation
                                                        .top &&
                                                headerChilderen.isNotEmpty) ...[
                                              ...headerChilderen,
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
                                if (hasClose || onCloseTapped != null) ...[
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Padding(
                                      padding: componentTheme
                                          .dimens.closeIconButtonPadding,
                                      child: ImpaktfullUiIconButton(
                                        onTap: () => _onCloseTapped(context),
                                        asset: componentTheme.assets.close,
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
                              Padding(
                                padding: componentTheme.dimens.padding,
                                child: child!,
                              ),
                            ],
                            if (showDividers &&
                                (child != null || title != null)) ...[
                              const ImpaktfullUiDivider(),
                            ],
                            if (actions.isNotEmpty) ...[
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
          ),
        );
      },
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);

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
