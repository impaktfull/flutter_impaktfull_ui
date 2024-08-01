import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/divider/divider.dart';
import 'package:impaktfull_ui_2/src/components/icon_button/icon_button.dart';
import 'package:impaktfull_ui_2/src/components/modal/modal_style.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';
import 'package:impaktfull_ui_2/src/util/device_util/device_util.dart';

export 'modal_style.dart';

part 'modal.describe.dart';

enum ImpaktfullUiModalHeaderChildLocation {
  leading,
  top,
}

class ImpaktfullUiModal extends StatelessWidget with ComponentDescriptorMixin {
  final ImpaktfullUiModalTheme? theme;
  final ImpaktfullUiModalHeaderChildLocation headerChildLocation;
  final IconData? headerIcon;
  final Widget? headerChild;
  final String? title;
  final String? subtitle;
  final Future<bool> Function()? onCloseTapped;
  final Widget? child;
  final List<Widget> actions;
  final bool isDismissible;
  final bool hasBlurredBackground;
  final double width;

  const ImpaktfullUiModal({
    this.headerChildLocation = ImpaktfullUiModalHeaderChildLocation.leading,
    this.headerIcon,
    this.headerChild,
    this.title,
    this.subtitle,
    this.onCloseTapped,
    this.child,
    this.actions = const [],
    this.hasBlurredBackground = false,
    this.isDismissible = true,
    this.width = 300,
    this.theme,
    super.key,
  });

  static show({
    required BuildContext context,
    ImpaktfullUiModalHeaderChildLocation headerChildLocation = ImpaktfullUiModalHeaderChildLocation.leading,
    IconData? headerIcon,
    Widget? headerChild,
    String? title,
    String? subtitle,
    Widget? child,
    List<Widget> actions = const [],
    Future<bool> Function()? onCloseTapped,
    bool isDismissible = true,
    bool hasBlurredBackground = false,
    double width = 300,
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
      hasBlurredBackground: hasBlurredBackground,
      width: width,
      child: child,
    );
    if (isApple()) {
      showCupertinoModalPopup(
        context: context,
        builder: (context) => modal,
      );
      return;
    }
    showAdaptiveDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (context) => modal,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiModalTheme>(
      overrideComponentTheme: theme,
      builder: (context, theme, componentTheme) {
        return GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                if (hasBlurredBackground) ...[
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Container(),
                  ),
                ],
                LayoutBuilder(
                  builder: (context, constraints) {
                    final width = constraints.maxWidth > this.width ? this.width : constraints.maxWidth;
                    final actionsOrientation = _getActionsOrientation(width);
                    List<Widget> actions = this.actions;
                    if (actions.isNotEmpty && actionsOrientation == ImpaktfullUiAutoLayoutOrientation.horizontal) {
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
                              color: componentTheme.colors.leadingHeaderIcon.withOpacity(0.2),
                            ),
                            borderRadius: componentTheme.dimens.borderRadius,
                          ),
                          padding: componentTheme.dimens.leadingIconPadding,
                          child: Icon(
                            headerIcon!,
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
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      spacing: 16,
                                      children: [
                                        if (headerChildLocation == ImpaktfullUiModalHeaderChildLocation.leading &&
                                            headerChilderen.isNotEmpty) ...[
                                          ...headerChilderen,
                                        ],
                                        ImpaktfullUiAutoLayout.vertical(
                                          mainAxisSize: MainAxisSize.min,
                                          spacing: 4,
                                          children: [
                                            if (headerChildLocation == ImpaktfullUiModalHeaderChildLocation.top &&
                                                headerChilderen.isNotEmpty) ...[
                                              ...headerChilderen,
                                            ],
                                            if (title != null) ...[
                                              Text(
                                                title!,
                                                style: componentTheme.textStyles.title,
                                              ),
                                              if (subtitle != null) ...[
                                                Text(
                                                  subtitle!,
                                                  style: componentTheme.textStyles.subtitle,
                                                ),
                                              ],
                                            ],
                                          ],
                                        ),
                                        if (onCloseTapped != null) ...[
                                          const SizedBox(width: 48),
                                        ],
                                      ],
                                    ),
                                  ),
                                  if (onCloseTapped != null) ...[
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Padding(
                                        padding: componentTheme.dimens.closeIconButtonPadding,
                                        child: ImpaktfullUiIconButton(
                                          onTap: () => _onCloseTapped(context),
                                          icon: theme.assets.icons.close,
                                        ),
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                              if (child != null) ...[
                                const ImpaktfullUiDivider(),
                                Padding(
                                  padding: componentTheme.dimens.padding,
                                  child: child!,
                                ),
                              ],
                              if (actions.isNotEmpty) ...[
                                const ImpaktfullUiDivider(),
                                Padding(
                                  padding: componentTheme.dimens.padding,
                                  child: ImpaktfullUiAutoLayout(
                                    spacing: 8,
                                    orientation: actionsOrientation,
                                    crossAxisAlignment: actionsOrientation == ImpaktfullUiAutoLayoutOrientation.vertical
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
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  String describe() => _describeInstance(this);

  Future<void> _onCloseTapped(BuildContext context) async {
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
