import 'dart:async';

import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/util/animation/animation_util.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/chat/chat.dart';
import 'package:impaktfull_ui/src/components/chat/widget/chat_list_item_avatar.dart';
import 'package:impaktfull_ui/src/util/localizations/localizations.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

class ImpaktfullUiChatListTypingContainer extends StatefulWidget {
  final List<ImpaktfullUiChatSender> sendersTyping;
  final bool showAvatars;
  final ImpaktfullUiChatTheme theme;
  final ImpaktfullUiChatLocalizations? localizations;
  const ImpaktfullUiChatListTypingContainer({
    required this.sendersTyping,
    required this.theme,
    this.showAvatars = false,
    this.localizations,
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
  // Timers instead of Future.delayed: they are cancelled on dispose.
  final _startTimers = <Timer>[];
  var _reduceMotion = false;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(3, (index) {
      final controller = AnimationController(
        duration: widget.theme.durations.typingDot,
        vsync: this,
      );
      _startTimers.add(Timer(widget.theme.durations.typingDotDelay * index, () {
        if (!mounted || _reduceMotion) return;
        controller.repeat(reverse: true);
      }));
      return controller;
    });
  }

  /// The dots do not bounce when the user asked to reduce motion.
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final reduceMotion = ImpaktfullUiAnimationUtil.reduceMotion(context);
    if (reduceMotion == _reduceMotion) return;
    _reduceMotion = reduceMotion;
    for (final controller in _controllers) {
      if (reduceMotion) {
        controller.stop();
        controller.value = 0;
      } else {
        controller.repeat(reverse: true);
      }
    }
  }

  @override
  void dispose() {
    for (final timer in _startTimers) {
      timer.cancel();
    }
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: widget,
      overrideComponentTheme: widget.theme,
      builder: (context, componentTheme) {
        return ImpaktfullUiAutoLayout.vertical(
          mainAxisSize: MainAxisSize.min,
          spacing: 4,
          children: [
            for (final sender in widget.sendersTyping) ...[
              _buildItem(
                context,
                componentTheme,
                sender,
              ),
            ]
          ],
        );
      },
    );
  }

  Widget _buildItem(BuildContext context, ImpaktfullUiChatTheme componentTheme,
      ImpaktfullUiChatSender sender) {
    final localizations = widget.localizations ??
        ImpaktfullUiLocalizations.of<ImpaktfullUiChatLocalizations>(context);
    return Semantics(
      container: true,
      label: localizations.typingLabel(sender.name),
      child: _buildItemContent(componentTheme, sender),
    );
  }

  Widget _buildItemContent(
      ImpaktfullUiChatTheme componentTheme, ImpaktfullUiChatSender sender) {
    return ImpaktfullUiAutoLayout.horizontal(
      spacing: 4,
      children: [
        if (widget.showAvatars) ...[
          ImpaktfullUiChatListItemAvatar(
            sender: sender,
            previousSender: null,
            isMyOwnMessage: false,
            theme: widget.theme,
          ),
        ],
        Container(
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
      ],
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
