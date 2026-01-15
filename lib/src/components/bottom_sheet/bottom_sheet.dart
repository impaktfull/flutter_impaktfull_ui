import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/bottom_sheet/bottom_sheet_style.dart';
import 'package:impaktfull_ui/src/components/icon_button/icon_button.dart';
import 'package:impaktfull_ui/src/util/descriptor/component_descriptor_mixin.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'bottom_sheet_style.dart';

part 'bottom_sheet.describe.dart';

class ImpaktfullUiBottomSheet extends StatelessWidget
    with ComponentDescriptorMixin {
  final String? title;
  final String? subtitle;
  final bool hasClose;
  final bool showHandle;
  final Future<bool> Function()? onCloseTapped;
  final Widget? child;
  final EdgeInsets? padding;
  final bool useSafeArea;
  final List<Widget> actions;
  final ImpaktfullUiBottomSheetTheme? theme;

  const ImpaktfullUiBottomSheet({
    this.title,
    this.subtitle,
    this.hasClose = true,
    this.onCloseTapped,
    this.child,
    this.padding,
    this.showHandle = false,
    this.actions = const [],
    this.useSafeArea = true,
    this.theme,
    super.key,
  });

  static Future<T?> show<T>({
    required BuildContext context,
    required Widget Function(BuildContext context) builder,
    RouteSettings? routeSettings,
    bool rootNavigator = false,
    ImpaktfullUiBottomSheetTheme? theme,
  }) {
    final resolvedTheme = theme ?? ImpaktfullUiBottomSheetTheme.of(context);
    return showModalBottomSheet(
      context: context,
      builder: builder,
      shape: RoundedRectangleBorder(
        borderRadius: resolvedTheme.dimens.borderRadius,
      ),
      backgroundColor: resolvedTheme.colors.background,
      isScrollControlled: true,
      useRootNavigator: rootNavigator,
      routeSettings: routeSettings,
    );
  }

  static Future<T?> showSimple<T>({
    required BuildContext context,
    RouteSettings? routeSettings,
    String? title,
    String? subtitle,
    Widget? child,
    List<Widget> actions = const [],
    bool hasClose = true,
    Future<bool> Function()? onCloseTapped,
    bool rootNavigator = false,
    ImpaktfullUiBottomSheetTheme? theme,
  }) {
    final modal = ImpaktfullUiBottomSheet(
      title: title,
      subtitle: subtitle,
      actions: actions,
      hasClose: hasClose,
      onCloseTapped: onCloseTapped,
      theme: theme,
      child: child,
    );
    return show(
      context: context,
      builder: (context) => modal,
      routeSettings: routeSettings,
      rootNavigator: rootNavigator,
      theme: theme,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: this,
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
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
            return SafeArea(
              top: useSafeArea,
              bottom: useSafeArea,
              right: useSafeArea,
              left: useSafeArea,
              child: MediaQuery.removePadding(
                context: context,
                removeTop: useSafeArea,
                removeBottom: useSafeArea,
                removeRight: useSafeArea,
                removeLeft: useSafeArea,
                child: GestureDetector(
                  onTap: () {}, // cancel close event
                  child: ImpaktfullUiAutoLayout.vertical(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        children: [
                          if (showHandle) ...[
                            Align(
                              alignment: AlignmentDirectional.center,
                              child: Opacity(
                                opacity: 0.5,
                                child: Container(
                                  margin: const EdgeInsets.only(top: 8),
                                  decoration: BoxDecoration(
                                    color: componentTheme.colors.handle,
                                    borderRadius: componentTheme
                                        .dimens.handleBorderRadius,
                                  ),
                                  height: 4,
                                  width: 50,
                                ),
                              ),
                            ),
                          ],
                          Padding(
                            padding: componentTheme.dimens.padding,
                            child: ImpaktfullUiAutoLayout.horizontal(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 16,
                              children: [
                                Expanded(
                                  child: ImpaktfullUiAutoLayout.vertical(
                                    mainAxisSize: MainAxisSize.min,
                                    spacing: 4,
                                    children: [
                                      if (title != null) ...[
                                        Text(
                                          title!,
                                          style:
                                              componentTheme.textStyles.title,
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
                                if (hasClose || onCloseTapped != null) ...[
                                  const SizedBox(width: 48),
                                ],
                              ],
                            ),
                          ),
                          if (hasClose || onCloseTapped != null) ...[
                            Align(
                              alignment: AlignmentDirectional.topEnd,
                              child: Padding(
                                padding: componentTheme
                                    .dimens.closeIconButtonPadding,
                                child: ImpaktfullUiIconButton(
                                  onTap: () {
                                    if (onCloseTapped != null) {
                                      onCloseTapped!.call();
                                    } else {
                                      Navigator.of(context).pop();
                                    }
                                  },
                                  asset: componentTheme.assets.close,
                                  color: componentTheme.colors.icons,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                      if (child != null) ...[
                        Padding(
                          padding: padding ?? componentTheme.dimens.padding,
                          child: child!,
                        ),
                      ],
                      if (actions.isNotEmpty) ...[
                        Padding(
                          padding: componentTheme.dimens.padding,
                          child: ImpaktfullUiAutoLayout(
                            spacing: 8,
                            orientation: actionsOrientation,
                            crossAxisAlignment: actionsOrientation ==
                                    ImpaktfullUiAutoLayoutOrientation.vertical
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
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);

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
