import 'dart:async';

import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/chat/chat_style.dart';
import 'package:impaktfull_ui_2/src/components/chat/model/chat_item.dart';
import 'package:impaktfull_ui_2/src/components/chat/model/sender/chat_sender_config.dart';
import 'package:impaktfull_ui_2/src/components/chat/widget/chat_list_internal_item.dart';
import 'package:impaktfull_ui_2/src/components/list_view/list_view.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

export 'chat_style.dart';
export 'model/chat_item.dart';
export 'model/sender/chat_sender_config.dart';
export 'model/sender/chat_sender.dart';

part 'chat.describe.dart';

class ImpaktfullUiChat extends StatefulWidget with ComponentDescriptorMixin {
  final List<ImpaktfullUiChatItem>? items;
  final Stream<List<ImpaktfullUiChatItem>>? itemsStream;
  final EdgeInsetsGeometry padding;
  final Stream<List<String>>? senderIdsTypingStream;
  final Widget Function(
    BuildContext context,
    ImpaktfullUiChatItem item,
    ImpaktfullUiChatItem? nextItem,
    ImpaktfullUiChatItem? previousItem,
  )? itemBuilder;
  final ImpaktfullUiChatSenderConfig senderConfig;
  final bool shrinkWrap;
  final ImpaktfullUiChatTheme? theme;

  const ImpaktfullUiChat({
    required List<ImpaktfullUiChatItem> this.items,
    required this.senderConfig,
    this.senderIdsTypingStream,
    this.padding = const EdgeInsets.all(16),
    this.itemBuilder,
    this.shrinkWrap = false,
    this.theme,
    super.key,
  }) : itemsStream = null;

  const ImpaktfullUiChat.stream({
    required Stream<List<ImpaktfullUiChatItem>> this.itemsStream,
    required this.senderConfig,
    this.senderIdsTypingStream,
    this.padding = const EdgeInsets.all(16),
    this.itemBuilder,
    this.shrinkWrap = false,
    this.theme,
    super.key,
  }) : items = null;

  @override
  State<ImpaktfullUiChat> createState() => _ImpaktfullUiChatState();

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

class _ImpaktfullUiChatState extends State<ImpaktfullUiChat> {
  final _items = <ImpaktfullUiChatItem>[];
  final _senderIdsTyping = <String>[];

  StreamSubscription<List<ImpaktfullUiChatItem>>? _streamSubscription;
  StreamSubscription<List<String>>? _senderIdsTypingSubscription;

  @override
  void initState() {
    super.initState();
    _setItems();
    _setSenderIdsTyping();
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    _senderIdsTypingSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuilder<ImpaktfullUiChatTheme>(
      overrideComponentTheme: widget.theme,
      builder: (context, componentTheme) => ImpaktfullUiListView.builder(
        padding: widget.padding,
        items: _items,
        noDataLabel: '',
        spacing: 2,
        reversed: true,
        shrinkWrap: widget.shrinkWrap,
        itemBuilder: (context, item, index) => ImpaktfullUiChatListInternalItem(
          items: _items,
          index: index,
          senderConfig: widget.senderConfig,
          theme: componentTheme,
          itemBuilder: widget.itemBuilder,
          senderIdsTyping: _senderIdsTyping,
        ),
      ),
    );
  }

  void _setItems() {
    List<ImpaktfullUiChatItem> newItems = [];
    if (widget.items != null) {
      newItems = widget.items!;
    } else if (widget.itemsStream != null) {
      _streamSubscription?.cancel();
      _streamSubscription = widget.itemsStream!.listen((items) {
        if (!mounted) return;
        setState(() => newItems = items);
      });
    }
    _items.clear();
    _items.addAll(newItems);
  }

  void _setSenderIdsTyping() {
    _senderIdsTyping.clear();
    _senderIdsTypingSubscription?.cancel();
    if (widget.senderIdsTypingStream == null) return;
    _senderIdsTypingSubscription =
        widget.senderIdsTypingStream!.listen((senderIds) {
      if (!mounted) return;
      setState(() {
        _senderIdsTyping.clear();
        _senderIdsTyping.addAll(senderIds);
      });
    });
  }
}
