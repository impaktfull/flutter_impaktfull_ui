import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/button/button.dart';
import 'package:impaktfull_ui/src/components/carousel/carousel.dart';
import 'package:impaktfull_ui/src/components/introduction/introduction.localizations.dart';
import 'package:impaktfull_ui/src/components/introduction/introduction_style.dart';
import 'package:impaktfull_ui/src/components/introduction/model/introduction_page.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'introduction.localizations.dart';
export 'introduction_style.dart';
export 'model/introduction_page.dart';

/// An introduction (onboarding) flow: a page per step, with a page
/// indicator, a skip button and a next button that becomes a done button on
/// the last page.
///
/// The user can swipe between the pages or use the buttons.
class ImpaktfullUiIntroduction extends StatelessWidget {
  /// The pages. Without pages, nothing is shown.
  final List<ImpaktfullUiIntroductionPage> pages;

  /// The page that is shown first. It is clamped to the pages.
  final int initialIndex;

  /// Called when the done button on the last page is tapped. The done button
  /// is only shown when it is set.
  final VoidCallback? onDone;

  /// Called when the skip button is tapped. The skip button is shown on every
  /// page except the last one, and only when it is set.
  final VoidCallback? onSkip;

  /// Called when another page is shown, by swiping or with the next button.
  final ValueChanged<int>? onPageChanged;

  /// The texts of the buttons. Defaults to the localizations of the app.
  final ImpaktfullUiIntroductionLocalizations? localizations;
  final ImpaktfullUiIntroductionTheme? theme;

  const ImpaktfullUiIntroduction({
    this.pages = const [],
    this.initialIndex = 0,
    this.onDone,
    this.onSkip,
    this.onPageChanged,
    this.localizations,
    this.theme,
    super.key,
  });

  // A StatelessWidget, like before the introduction was implemented: the
  // state lives in a private widget, so the public type does not change.
  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: this,
      overrideComponentTheme: theme,
      builder: (context, componentTheme) {
        if (pages.isEmpty) return const SizedBox.shrink();
        return _Introduction(
          introduction: this,
          componentTheme: componentTheme,
        );
      },
    );
  }
}

class _Introduction extends StatefulWidget {
  final ImpaktfullUiIntroduction introduction;
  final ImpaktfullUiIntroductionTheme componentTheme;

  const _Introduction({
    required this.introduction,
    required this.componentTheme,
  });

  @override
  State<_Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<_Introduction> {
  ImpaktfullUiIntroduction get introduction => widget.introduction;

  late int _index = _clampIndex(introduction.initialIndex);

  bool get _isLastPage => _index >= introduction.pages.length - 1;

  @override
  void didUpdateWidget(covariant _Introduction oldWidget) {
    super.didUpdateWidget(oldWidget);
    _index = _clampIndex(_index);
  }

  int _clampIndex(int index) {
    if (introduction.pages.isEmpty) return 0;
    return index.clamp(0, introduction.pages.length - 1);
  }

  @override
  Widget build(BuildContext context) {
    final componentTheme = widget.componentTheme;
    final localizations = introduction.localizations ??
        ImpaktfullUiIntroductionLocalizations.of(context);
    return ImpaktfullUiAutoLayout.vertical(
      children: [
        Expanded(
          child: ImpaktfullUiCarousel(
            index: _index,
            loop: false,
            onItemChanged: _onPageChanged,
            items: [
              for (final page in introduction.pages)
                _IntroductionPage(
                  page: page,
                  componentTheme: componentTheme,
                ),
            ],
          ),
        ),
        Padding(
          padding: componentTheme.dimens.actionsPadding,
          child: ImpaktfullUiAutoLayout.horizontal(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (introduction.onSkip != null && !_isLastPage)
                ImpaktfullUiButton(
                  type: ImpaktfullUiButtonType.tertiaryGrey,
                  title: localizations.skipBtn,
                  onTap: introduction.onSkip,
                ),
              const Spacer(),
              if (!_isLastPage)
                ImpaktfullUiButton(
                  type: ImpaktfullUiButtonType.primary,
                  title: localizations.nextBtn,
                  onTap: _onNextTapped,
                )
              else if (introduction.onDone != null)
                ImpaktfullUiButton(
                  type: ImpaktfullUiButtonType.primary,
                  title: localizations.doneBtn,
                  onTap: introduction.onDone,
                ),
            ],
          ),
        ),
      ],
    );
  }

  void _onNextTapped() {
    if (_isLastPage) return;
    _onPageChanged(_index + 1);
  }

  void _onPageChanged(int index) {
    if (index == _index) return;
    setState(() => _index = index);
    introduction.onPageChanged?.call(index);
  }
}

class _IntroductionPage extends StatelessWidget {
  final ImpaktfullUiIntroductionPage page;
  final ImpaktfullUiIntroductionTheme componentTheme;

  const _IntroductionPage({
    required this.page,
    required this.componentTheme,
  });

  @override
  Widget build(BuildContext context) {
    final asset = page.asset;
    final subtitle = page.subtitle;
    final child = page.child;
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: Padding(
            padding: componentTheme.dimens.pagePadding,
            child: ImpaktfullUiAutoLayout.vertical(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: componentTheme.dimens.spacing,
              children: [
                if (asset != null)
                  ImpaktfullUiAssetWidget(
                    asset: asset,
                    color: componentTheme.colors.asset,
                    size: componentTheme.dimens.assetSize,
                  ),
                Text(
                  page.title,
                  style: componentTheme.textStyles.title,
                  textAlign: TextAlign.center,
                ),
                if (subtitle != null)
                  Text(
                    subtitle,
                    style: componentTheme.textStyles.subtitle,
                    textAlign: TextAlign.center,
                  ),
                if (child != null) child,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
