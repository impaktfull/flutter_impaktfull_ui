import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/chat/chat.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';

class ImpaktfullUiChatListTypingContainer extends StatefulWidget {
  final List<String> senderIdsTyping;
  final ImpaktfullUiChatTheme theme;
  const ImpaktfullUiChatListTypingContainer({
    required this.senderIdsTyping,
    required this.theme,
    super.key,
  });

  @override
  State<ImpaktfullUiChatListTypingContainer> createState() =>
      _ImpaktfullUiChatListTypingContainerState();
}

class _ImpaktfullUiChatListTypingContainerState
    extends State<ImpaktfullUiChatListTypingContainer>
    with TickerProviderStateMixin {
  late final List<AnimationController> _controllers;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(3, (index) {
      final controller = AnimationController(
        duration: const Duration(milliseconds: 800),
        vsync: this,
      );
      Future.delayed(Duration(milliseconds: index * 200), () {
        controller.repeat(reverse: true);
      });
      return controller;
    });
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuilder(
      overrideComponentTheme: widget.theme,
      builder: (context, componentTheme) => Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: componentTheme.colors.typingContainerBackground,
          borderRadius: componentTheme.dimens.typingContainerBorderRadius,
        ),
        child: ImpaktfullUiAutoLayout.horizontal(
          spacing: 4,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildDot(0, componentTheme),
            _buildDot(1, componentTheme),
            _buildDot(2, componentTheme),
          ],
        ),
      ),
    );
  }

  Widget _buildDot(int index, ImpaktfullUiChatTheme componentTheme) {
    const size = 4;
    return AnimatedBuilder(
      animation: _controllers[index],
      builder: (context, child) => Transform.translate(
        offset: Offset(
          0,
          (-size *
              _controllers[index].value *
              (1 - _controllers[index].value) *
              size),
        ),
        child: Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: componentTheme.colors.typingContainerDots,
            borderRadius: componentTheme.dimens.typingDotsBorderRadius,
          ),
        ),
      ),
    );
  }
}
