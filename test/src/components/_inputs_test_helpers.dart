import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

/// The components theme of the default theme, used as a base for the theme
/// overrides in the inputs & controls tests.
ImpaktfullUiComponentsTheme get defaultComponentsTheme =>
    ImpaktfullUiTheme.getDefault().components;

/// A custom asset that is not used by any default theme, to verify that a
/// theme override is applied.
final customTestAsset = ImpaktfullUiAsset.icon(PhosphorIcons.star);

/// A color that is not used by the default theme.
const customTestColor = Color(0xFF00FF7F);

/// Gives [child] a fixed width, so components with an [Expanded] child can be
/// rendered in a golden test cell.
Widget goldenSized(Widget child, {double width = 320, double? height}) =>
    SizedBox(
      width: width,
      height: height,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: child,
      ),
    );

/// Returns true when the [ImpaktfullUiAssetWidget]s in the tree show [asset].
bool Function(Widget) isAssetWidget(ImpaktfullUiAsset asset) =>
    (widget) => widget is ImpaktfullUiAssetWidget && widget.asset == asset;
